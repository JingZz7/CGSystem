package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.service.IProblemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
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
   * @author ZJ Description [教师]获取题目列表(题库管理) 无参 date 2022-11-11 18:07:17 18:07
   * @param
   */
  @RequestMapping(value = "/getProblemList", method = RequestMethod.POST)
  public JsonResult getProblemList() {
    return JsonResult.success(iProblemService.list());
  }

  /**
   * @author ZJ Description [教师]根据id查询问题(题库管理) date 2022-11-09 21:09:21 21:09
   * @param jsonObject
   */
  @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
  public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
    List<Problem> problems = iProblemService.getProblemById(jsonObject.getString("problemId"));
    if (problems.isEmpty()) {
      return JsonResult.failed("查找失败");
    }
    return JsonResult.success(problems, "查找成功");
  }

  /**
   * @author ZJ Description [教师]根据名称查询问题(题库管理) problemName即可 date 2022-11-11 18:16:45 18:16
   * @param jsonObject
   */
  @RequestMapping(value = "/getProblemListByName", method = RequestMethod.POST)
  public JsonResult getProblemListByName(@RequestBody JSONObject jsonObject) {
    List<Problem> list = iProblemService.getProblemListByName(jsonObject.getString("problemName"));

    if (list == null) {
      return JsonResult.failed("查找失败");
    }

    return JsonResult.success(list, "查找成功");
  }
}
