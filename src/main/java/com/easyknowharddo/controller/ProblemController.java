package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IFavoriteService;
import com.easyknowharddo.service.IProblemDescriptionService;
import com.easyknowharddo.service.IProblemService;
import com.easyknowharddo.service.IStudentService;
import com.github.pagehelper.PageInfo;
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

    @Autowired
    private IProblemService iProblemService;
    @Autowired
    private IProblemDescriptionService iProblemDescriptionService;
    @Autowired
    private IFavoriteService iFavoriteService;
    @Autowired
    private IStudentService iStudentService;

    /**
     * @param jsonObject: a * return JsonResult
     * @author ZJ
     * @description TODO [学生]获取题目列表(刷题推荐)
     * @date 2022/11/15 20:54
     */
    @RequestMapping(value = "/getProblemList", method = RequestMethod.POST)
    public JsonResult getProblemList(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iStudentService
                        .getProblemList(jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                        .getList(),
                iStudentService
                        .getProblemList(jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");
    }

    /**
     * @param jsonObject: a * return JsonResult
     * @author ZJ
     * @description TODO [学生]获取题目列表(刷题推荐)aop分页增强 json数据包含id、currentPage、pageSize
     * @date 2022/11/22 15:35
     */
    @RequestMapping(value = "/getProblemsList", method = RequestMethod.POST)
    public JsonResult getProblemsList(@RequestBody JSONObject jsonObject) {
        return JsonResult.success(
                iStudentService.getProblemsList(
                        jsonObject.getString("id"),
                        jsonObject.getInteger("currentPage"),
                        jsonObject.getInteger("pageSize")),
                "获取成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [学生]获取题目列表(收藏夹) json数据包含studentId、currentPage、pageSize
     * @date 2022/11/15 22:31
     */
    @RequestMapping(value = "/getFavoriteProblemList", method = RequestMethod.POST)
    public JsonResult getFavoriteProblemList(@RequestBody JSONObject jsonObject) {
        PageInfo<Problem> page =
                iFavoriteService.getFavoriteProblemList(
                        jsonObject.getString("studentId"),
                        jsonObject.getInteger("currentPage"),
                        jsonObject.getInteger("pageSize"));
        return JsonResult.successes(page.getList(), page.getTotal(), "获取成功");
    }

    /**
     * @param jsonObject
     * @author ZJ Description [学生]收藏题目 json数据包含studnetId字段和problemId字段即可 date 2022-11-09 17:40:06
     * 17:40
     */
    @RequestMapping(value = "/collectProblem", method = RequestMethod.POST)
    public JsonResult collectProblem(@RequestBody JSONObject jsonObject) {
        //    iFavoriteService.collectProblem(
        //        jsonObject.getString("studentId"), jsonObject.getString("problemId"));
        //    return JsonResult.success("收藏成功");
        if (iFavoriteService.collectProblem(
                jsonObject.getString("studentId"), jsonObject.getString("problemId")))
            return JsonResult.success("收藏成功");
        return JsonResult.failed("收藏失败");
    }

    /**
     * @param jsonObject
     * @author ZJ Description [学生]取消收藏 json数据包含studnetId字段和problemId字段即可 date 2022-11-09 20:28:33
     * 20:28
     */
    @RequestMapping(value = "/cancelCollectedProblem", method = RequestMethod.DELETE)
    public JsonResult cancelCollectedProblem(@RequestBody JSONObject jsonObject) {
        if (iFavoriteService.cancelCollectedProblem(
                jsonObject.getString("studentId"), jsonObject.getString("problemId")))
            return JsonResult.success("取消收藏成功");
        return JsonResult.failed("取消收藏失败");
    }

    /**
     * @param jsonObject
     * @author ZJ Description [学生]批量删除收藏夹的题目 json数据包含studentId字段和ids的list集合 date 2022-11-11 15:00:47
     * 15:00
     */
    @RequestMapping(value = "/bulkDeleteCollectedProblem", method = RequestMethod.DELETE)
    public JsonResult bulkDeleteCollectedProblem(@RequestBody JSONObject jsonObject) {
        if (jsonObject == null) return JsonResult.validateFailed("删除失败");
        iFavoriteService.bulkDeleteCollectedProblem(
                jsonObject.getString("studentId"),
                jsonObject.getJSONArray("ids").toJavaList(Integer.class));
        return JsonResult.success("删除成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [学生]根据id查询问题(刷题推荐) json数据包含problemId、currentPage、pageSize
     * @date 2022/11/15 22:41
     */
    @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
    public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iStudentService
                        .getProblemById(
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getList(),
                iStudentService
                        .getProblemById(
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [学生]根据难度查询(刷题推荐)aop分页增强 json数据包含id、difficulty、currentPage、pageSize
     * @date 2022/11/15 22:50
     */
    @RequestMapping(value = "/getProblemsByDifficulty", method = RequestMethod.POST)
    public JsonResult getProblemsByDifficulty(@RequestBody JSONObject jsonObject) {
        return JsonResult.success(
                iStudentService.getProblemsByDifficulty(
                        jsonObject.getString("id"),
                        jsonObject.getString("difficulty"),
                        jsonObject.getInteger("currentPage"),
                        jsonObject.getInteger("pageSize")),
                "获取成功");
    }

    /**
     * @param jsonObject
     * @author ZJ Description [学生]评论 json数据包含studentId、problemId、description date 2022-11-14 13:21:05
     * 13:21
     */
    @RequestMapping(value = "/studentComment", method = RequestMethod.POST)
    public JsonResult studentComment(@RequestBody JSONObject jsonObject) {
        Boolean flag =
                iStudentService.studentComment(
                        jsonObject.getString("studentId"),
                        jsonObject.getString("problemId"),
                        jsonObject.getString("description"));

        if (flag) return JsonResult.success("评论成功");
        return JsonResult.failed("评论失败");
    }
}
