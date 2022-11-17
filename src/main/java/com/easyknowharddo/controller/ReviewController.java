package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.IProblemService;
import com.easyknowharddo.service.ITeacherService;
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
   * @param : * @return JsonResult
   * @author ZJ
   * @description TODO [教师]获取评论列表(查看评论) json数据包含currentPage、pageSize
   * @date 2022/11/15 20:21
   */
  @RequestMapping(value = "teacherGetReviewList", method = RequestMethod.POST)
  public JsonResult teacherGetReviewList(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(
        iTeacherService
            .teacherGetReviewList(
                jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
            .getList(),
        "获取成功");
  }

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
