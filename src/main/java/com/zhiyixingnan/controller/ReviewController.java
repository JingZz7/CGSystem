package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.service.IProblemService;
import com.zhiyixingnan.service.ITeacherService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.HashMap;
import java.util.List;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/review")
public class ReviewController {

  @Autowired private IProblemService iProblemService;
  @Autowired private ITeacherService iTeacherService;

  /**
   * @author ZJ Description [教师]查看评论(查看评论) json数据包含problemId date 2022-11-14 14:22:47 14:22
   * @param jsonObject
   */
  @RequestMapping(value = "/teacherViewReview", method = RequestMethod.POST)
  public JsonResult teacherViewReview(@RequestBody JSONObject jsonObject) {
    List<HashMap<String, String>> list =
        iTeacherService.teacherViewReview(jsonObject.getString("problemId"));

    if (list.isEmpty()) {
      return JsonResult.failed("无评论，查找失败");
    }
    return JsonResult.success(list, "查找成功");
  }
}
