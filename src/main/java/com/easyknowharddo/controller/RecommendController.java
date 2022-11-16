package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IFavoriteService;
import com.github.pagehelper.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/recommend")
public class RecommendController {

  @Autowired private IFavoriteService iFavoriteService;

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [学生]根据id查询问题(收藏夹) json数据包含studentId、problemId、currentPage、pageSize
   * @date 2022/11/15 23:05
   */
  @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
  public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {

    IPage<Problem> page =
        iFavoriteService.getProblemById(
            jsonObject.getString("studentId"),
            jsonObject.getString("problemId"),
            jsonObject.getInteger("currentPage"),
            jsonObject.getInteger("pageSize"));
    if (jsonObject.getInteger("currentPage") > page.getPages()) {
      page =
          iFavoriteService.getProblemById(
              jsonObject.getString("studentId"),
              jsonObject.getString("problemId"),
              jsonObject.getInteger("currentPage"),
              jsonObject.getInteger("pageSize"));
    }
    return JsonResult.success(page.getRecords(), "获取成功");

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

    PageInfo<Problem> page =
        iFavoriteService.getProblemByName(
            jsonObject.getString("studentId"),
            jsonObject.getString("problemName"),
            jsonObject.getInteger("currentPage"),
            jsonObject.getInteger("pageSize"));
//    if (jsonObject.getInteger("currentPage") > page.getPages()) {
//      page =
//          iFavoriteService.getProblemByName(
//              jsonObject.getString("studentId"),
//              jsonObject.getString("problemName"),
//              jsonObject.getInteger("currentPage"),
//              jsonObject.getInteger("pageSize"));
//    }
    return JsonResult.success(page.getList(), "获取成功");

    //    List<Problem> problems =
    //        iFavoriteService.getProblemByName(
    //            jsonObject.getString("studentId"), jsonObject.getString("problemName"));
    //    if (problems == null) {
    //      return JsonResult.failed("查找失败");
    //    }
    //    return JsonResult.success(problems, "查找成功");
  }
}
