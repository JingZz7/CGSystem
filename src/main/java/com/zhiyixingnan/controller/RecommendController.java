package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.service.IFavoriteService;
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
@RequestMapping("/recommend")
public class RecommendController {

  @Autowired private IFavoriteService iFavoriteService;

  /**
   * @author ZJ Description [学生]根据id查询问题(收藏夹) json数据包含studentId和problemId date 2022-11-11 16:23:38
   *     16:23
   * @param jsonObject
   */
  @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
  public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
    Problem problem =
        iFavoriteService.getProblemById(
            jsonObject.getString("studentId"), jsonObject.getString("problemId"));

    if (problem == null) {
      return JsonResult.failed("查找失败");
    }

    return JsonResult.success(problem, "查找成功");
  }

  /**
   * @author ZJ Description [学生]根据名称查询问题(收藏夹) json数据包含studentId和problemName date 2022-11-11 16:56:34
   *     16:56
   * @param jsonObject
   */
  @RequestMapping(value = "/getProblemByName", method = RequestMethod.POST)
  public JsonResult getProblemByName(@RequestBody JSONObject jsonObject) {
    List<Problem> problems =
        iFavoriteService.getProblemByName(
            jsonObject.getString("studentId"), jsonObject.getString("problemName"));
    if (problems == null) {
      return JsonResult.failed("查找失败");
    }
    return JsonResult.success(problems, "查找成功");
  }
}
