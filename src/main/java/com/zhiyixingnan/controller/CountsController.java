package com.zhiyixingnan.controller;

import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.service.IProblemDescriptionService;
import com.zhiyixingnan.service.IProblemService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@Slf4j
@RequestMapping("/count")
public class CountsController {

  @Autowired private IProblemService iProblemService;
  @Autowired private IProblemDescriptionService iProblemDescriptionService;

  @RequestMapping(value = "/getList", method = RequestMethod.GET)
  public JsonResult getList() {
    return JsonResult.success(iProblemDescriptionService.list(), "获取成功");
  }
}
