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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.ArrayList;
import java.util.List;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/problem")
public class ProblemController {

  @Autowired private IProblemService iProblemService;
  @Autowired private IProblemDescriptionService iProblemDescriptionService;
  @Autowired private IFavoriteService iFavoriteService;

  /**
   * @author ZJ Description [学生]获取题目列表(刷题推荐) 无参 date 2022-11-09 16:44:13 16:44
   * @param
   */
  @RequestMapping(value = "/getProblemList", method = RequestMethod.POST)
  public JsonResult getProblemList() {
    return JsonResult.success(iProblemService.list());
  }

  /**
   * @author ZJ Description [学生]获取题目列表(收藏夹) 传入数据为学号 date 2022-11-11 15:34:00 15:34
   * @param jsonObject
   */
  @RequestMapping(value = "/getFavoriteProblemList", method = RequestMethod.POST)
  public JsonResult getFavoriteProblemList(@RequestBody JSONObject jsonObject) {
    List<Problem> list = iFavoriteService.getFavoriteProblemList(jsonObject.getString("studentId"));
    if (list == null) {
      return JsonResult.failed("获取失败,此学生收藏夹无题目");
    }
    return JsonResult.success(list, "获取成功");
  }

  /**
   * @author ZJ Description [学生]收藏题目 json数据包含studnetId字段和problemId字段即可 date 2022-11-09 17:40:06
   *     17:40
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
   * @author ZJ Description [学生]取消收藏 json数据包含studnetId字段和problemId字段即可 date 2022-11-09 20:28:33
   *     20:28
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
   * @author ZJ Description [学生]批量删除收藏夹的题目 json数据包含studentId字段和ids的list集合 date 2022-11-11 15:00:47
   *     15:00
   * @param jsonObject
   */
  @RequestMapping(value = "/bulkDeleteCollectedProblem", method = RequestMethod.DELETE)
  public JsonResult bulkDeleteCollectedProblem(@RequestBody JSONObject jsonObject) {
    if (jsonObject == null) {
      return JsonResult.validateFailed("删除失败");
    }
    iFavoriteService.bulkDeleteCollectedProblem(
        jsonObject.getString("studentId"),
        jsonObject.getJSONArray("ids").toJavaList(Integer.class));
    return JsonResult.success("删除成功");
  }

  /**
   * @author ZJ Description [学生]根据id查询问题(刷题推荐) date 2022-11-09 21:09:21 21:09
   * @param jsonObject
   */
  @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
  public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
    Problem problem =
        iProblemService.getOne(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, jsonObject.getString("problemId")));

    List<Problem> problems = new ArrayList<>();

    problems.add(problem);

    if (problems == null) {
      return JsonResult.failed("查找失败");
    }
    return JsonResult.success(problems, "查找成功");
  }
}
