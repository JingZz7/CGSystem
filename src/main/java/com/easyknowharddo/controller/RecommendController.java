package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.IFavoriteService;
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
@RequestMapping("/recommend")
public class RecommendController {

    @Autowired
    private IFavoriteService iFavoriteService;

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [学生]根据id查询问题(收藏夹) json数据包含studentId、problemId、currentPage、pageSize
     * @date 2022/11/15 23:05
     */
    @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
    public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iFavoriteService
                        .getProblemById(
                                jsonObject.getString("studentId"),
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getList(),
                iFavoriteService
                        .getProblemById(
                                jsonObject.getString("studentId"),
                                jsonObject.getString("problemId"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");

        //    List<Problem> problem =
        //        iFavoriteService.getProblemById(
        //            jsonObject.getString("studentId"), jsonObject.getString("problemId"));
        //
        //    if (problem == null) {
        //      return JsonResult.failed("查找失败");
        //    }
        //
        //    return JsonResult.success(problem, "查找成功");
    }

    /**
     * @param jsonObject: * @return JsonResult
     * @author ZJ
     * @description TODO [学生]根据名称查询问题(收藏夹) json数据包含studentId、problemName、currentPage、pageSize
     * @date 2022/11/15 23:25
     */
    @RequestMapping(value = "/getProblemByName", method = RequestMethod.POST)
    public JsonResult getProblemByName(@RequestBody JSONObject jsonObject) {
        return JsonResult.successes(
                iFavoriteService
                        .getProblemByName(
                                jsonObject.getString("studentId"),
                                jsonObject.getString("problemName"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getList(),
                iFavoriteService
                        .getProblemByName(
                                jsonObject.getString("studentId"),
                                jsonObject.getString("problemName"),
                                jsonObject.getInteger("currentPage"),
                                jsonObject.getInteger("pageSize"))
                        .getTotal(),
                "获取成功");

        //    List<Problem> problems =
        //        iFavoriteService.getProblemByName(
        //            jsonObject.getString("studentId"), jsonObject.getString("problemName"));
        //    if (problems == null) {
        //      return JsonResult.failed("查找失败");
        //    }
        //    return JsonResult.success(problems, "查找成功");
    }
}
