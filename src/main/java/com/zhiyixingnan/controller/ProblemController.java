package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhiyixingnan.controller.utils.JsonResult;
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

  @RequestMapping(value = "/collectProblem", method = RequestMethod.POST)
  public JsonResult collectProblem(@RequestBody JSONObject jsonObject) {
    iFavoriteService.collectProblem(
            jsonObject.getString("studentId"), jsonObject.getString("problemId"));
    return JsonResult.success("收藏成功");
  }
}
