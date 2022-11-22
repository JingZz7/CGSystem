package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.IStudentService;
import com.easyknowharddo.service.ITeacherService;
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
@RequestMapping("/grade")
public class GradeController {

  @Autowired private ITeacherService iTeacherService;
  @Autowired private IStudentService iStudentService;

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

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [教师]根据班级获取成绩分布 json数据包含className
   * @date 2022/11/22 21:29
   */
  @RequestMapping(value = "/gradeDistributionByClass", method = RequestMethod.POST)
  public JsonResult gradeDistributionByClass(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(
        iTeacherService.gradeDistributionByClass(jsonObject.getString("className")), "获取成功");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [教师]获取学生知识点成绩扇形图 json数据包含id
   * @date 2022/11/22 22:16
   */
  @RequestMapping(value = "/getKnowledgePointGrade", method = RequestMethod.POST)
  public JsonResult getKnowledgePointGrade(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(
        iTeacherService.getKnowledgePointGrade(jsonObject.getString("id")), "获取成功");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [学生]获取期末成绩预测 json数据包含id
   * @date 2022/11/22 22:42
   */
  @RequestMapping(value = "/getFinalForecast", method = RequestMethod.POST)
  public JsonResult getFinalForecast(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(iStudentService.getFinalForecast(jsonObject.getString("id")), "获取成功");
  }
}
