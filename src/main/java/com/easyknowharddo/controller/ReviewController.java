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

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/review")
public class ReviewController {

    @Autowired
    private IProblemService iProblemService;
    @Autowired
    private ITeacherService iTeacherService;

    /**
     * @param : * @return JsonResult
     * @author ZJ
     * @description TODO [教师]获取评论列表(查看评论) json数据包含currentPage、pageSize
     * @date 2022/11/15 20:21
     */
    @RequestMapping(value = "teacherGetReviewList", method = RequestMethod.POST)
    public JsonResult teacherGetReviewList(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iTeacherService
                        .teacherGetReviewList(
                                jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                        .getList(),
                iTeacherService
                        .teacherGetReviewList(
                                jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [教师]根据问题id搜索评论(查看评论) json数据包含problemId、currentPage、pageSize
     * @date 2022/11/17 11:10
     */
    @RequestMapping(value = "/teacherGetReviewByProblemId", method = RequestMethod.POST)
    public JsonResult teacherGetReviewByProblemId(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iTeacherService
                        .teacherGetReviewByProblemId(
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getList(),
                iTeacherService
                        .teacherGetReviewByProblemId(
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [教师]查看具体评论信息(查看评论) json数据包含评论的id
     * @date 2022/11/20 20:34
     */
    @RequestMapping(value = "/teacherViewDetailReview", method = RequestMethod.POST)
    public JsonResult teacherViewDetailReview(@RequestBody JSONObject jsonObject) {
        return JsonResult.success(
                iTeacherService.teacherViewDetailReview(jsonObject.getString("id")), "获取成功");
    }
}
