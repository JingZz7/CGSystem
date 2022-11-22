package com.easyknowharddo.controller;

import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.ITeacherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/grade")
public class GradeController {

  @Autowired private ITeacherService iTeacherService;

  /**
   * @param : a * @return JsonResult
   * @author ZJ
   * @description TODO [教师]获取成绩分布 无参
   * @date 2022/11/22 17:32
   */
  @RequestMapping(value = "/gradeDistribution", method = RequestMethod.POST)
  public JsonResult gradeDistribution() {
    return JsonResult.success(iTeacherService.gradeDistribution(), "获取成功");
  }
}
