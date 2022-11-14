package com.easyknowharddo.controller;

import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.IProblemDescriptionService;
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

  @Autowired private IProblemDescriptionService iProblemDescriptionService;

  /**
   * @param : * @return JsonResult
   * @author ZJ
   * @description TODO 测试
   * @date 2022/11/14 20:42
   */
  @RequestMapping(value = "/getList", method = RequestMethod.GET)
  public JsonResult getList() {
    return JsonResult.success(iProblemDescriptionService.list(), "获取成功");
  }
}
