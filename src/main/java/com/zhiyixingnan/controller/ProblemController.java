package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.service.IFavoriteService;
import com.zhiyixingnan.service.IProblemDescriptionService;
import com.zhiyixingnan.service.IProblemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/problem")
public class ProblemController {

  @Autowired private IProblemService iProblemService;
  @Autowired private IProblemDescriptionService iProblemDescriptionService;
  @Autowired private IFavoriteService iFavoriteService;

  /**
   * @author ZJ Description 获取题目列表 date 无参 2022-11-09 16:44:13 16:44
   * @param
   */
  @RequestMapping(value = "/getProblemList", method = RequestMethod.GET)
  public JsonResult getProblemList() {
    return JsonResult.success(iProblemService.list());
  }

  /**
   * @author ZJ Description 收藏题目 date json数据包含studnetId字段和problemId字段即可 2022-11-09 17:40:06 17:40
   * @param jsonObject
   */
  @RequestMapping(value = "/collectProblem", method = RequestMethod.POST)
  public JsonResult collectProblem(@RequestBody JSONObject jsonObject) {
    //    iFavoriteService.collectProblem(
    //        jsonObject.getString("studentId"), jsonObject.getString("problemId"));
    //    return JsonResult.success("收藏成功");
    if (iFavoriteService.collectProblem(
        jsonObject.getString("studentId"), jsonObject.getString("problemId"))) {
      return JsonResult.success("收藏成功");
    }
    return JsonResult.failed("收藏失败");
  }

  /**
   * @author ZJ Description 取消收藏 date json数据包含studnetId字段和problemId字段即可 2022-11-09 20:28:33 20:28
   * @param jsonObject
   */
  @RequestMapping(value = "/cancelCollectedProblem", method = RequestMethod.DELETE)
  public JsonResult cancelCollectedProblem(@RequestBody JSONObject jsonObject) {
    if (iFavoriteService.cancelCollectedProblem(
        jsonObject.getString("studentId"), jsonObject.getString("problemId"))) {
      return JsonResult.success("取消收藏成功");
    }
    return JsonResult.failed("取消收藏失败");
  }

  /**
   * @author ZJ Description 根据id查询问题 date 2022-11-09 21:09:21 21:09
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
}
