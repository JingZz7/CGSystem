package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.service.IProblemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/problemManagement")
public class ProblemManagementController {

  @Autowired private IProblemService iProblemService;

  /**
   * @author ZJ Description 获取题目列表(刷题推荐) 无参 date 2022-11-11 18:07:17 18:07
   * @param
   */
  @RequestMapping(value = "/getProblemList", method = RequestMethod.POST)
  public JsonResult getProblemList() {
    return JsonResult.success(iProblemService.list());
  }

  /**
   * @author ZJ Description 根据id查询问题(刷题推荐) date 2022-11-09 21:09:21 21:09
   * @param problemId
   */
  @RequestMapping(value = "/getProblemById/{problemId}", method = RequestMethod.GET)
  public JsonResult getProblemById(@PathVariable String problemId) {
    if (iProblemService.getOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId))
        == null) {
      return JsonResult.failed("查找失败");
    }
    return JsonResult.success(
        iProblemService.getOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId)),
        "查找成功");
  }

  /**
   * @author ZJ Description 根据名称查询问题(题库管理) problemName即可 date 2022-11-11 18:16:45 18:16
   * @param problemName
   */
  @RequestMapping(value = "/getProblemListByName/{problemName}", method = RequestMethod.GET)
  public JsonResult getProblemListByName(@PathVariable String problemName) {
    List<Problem> list = iProblemService.getProblemListByName(problemName);

    if (list == null) {
      return JsonResult.failed("查找失败");
    }

    return JsonResult.success(list, "查找成功");
  }
}
