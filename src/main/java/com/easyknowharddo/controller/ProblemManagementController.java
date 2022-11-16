package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IProblemService;
import com.easyknowharddo.service.ITeacherService;
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
@RequestMapping("/problemManagement")
public class ProblemManagementController {

  @Autowired private IProblemService iProblemService;
  @Autowired private ITeacherService iTeacherService;

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]获取题目列表(题库管理) json数据包含currentPage、pageSize
   * @date 2022/11/16 16:25
   */
  @RequestMapping(value = "/getProblemList", method = RequestMethod.POST)
  public JsonResult getProblemList(@RequestBody JSONObject jsonObject) {
    PageInfo<Problem> pageInfo =
        iTeacherService.getProblemList(
            jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"));
    //    if (jsonObject.getInteger("currentPage") > pageInfo.getPages()) {
    //      pageInfo =
    //          iTeacherService.getProblemList(
    //              jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"));
    //    }
    return JsonResult.success(pageInfo.getList(), "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据id查询问题(题库管理) json数据包含problemId、currentPage、pageSize
   * @date 2022/11/16 16:48
   */
  @RequestMapping(value = "/getProblemById", method = RequestMethod.POST)
  public JsonResult getProblemById(@RequestBody JSONObject jsonObject) {
    PageInfo<Problem> pageInfo =
        iProblemService.getProblemById(
            jsonObject.getString("problemId"),
            jsonObject.getInteger("currentPage"),
            jsonObject.getInteger("pageSize"));
    return JsonResult.success(pageInfo.getList(), "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据名称查询问题(题库管理) json数据包含problemName、currentPage、pageSize
   * @date 2022/11/16 16:55
   */
  @RequestMapping(value = "/getProblemListByName", method = RequestMethod.POST)
  public JsonResult getProblemListByName(@RequestBody JSONObject jsonObject) {
    PageInfo<Problem> pageInfo =
        iProblemService.getProblemListByName(
            jsonObject.getString("problemName"),
            jsonObject.getInteger("currentPage"),
            jsonObject.getInteger("pageSize"));
    return JsonResult.success(pageInfo.getList(), "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]删除题目(题库管理) json数据包含problemId
   * @date 2022/11/14 23:49
   */
  @RequestMapping(value = "/deleteProblem", method = RequestMethod.DELETE)
  public JsonResult deleteProblem(@RequestBody JSONObject jsonObject) {
    Boolean flag = iTeacherService.deleteProblem(jsonObject.getString("problemId"));
    if (flag) {
      return JsonResult.success("删除成功");
    }
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]批量删除题目(题库管理) json数据包含ids
   * @date 2022/11/15 0:11
   */
  @RequestMapping(value = "/bulkDeleteProblem", method = RequestMethod.DELETE)
  public JsonResult bulkDeleteProblem(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iTeacherService.bulkDeleteProblem(jsonObject.getJSONArray("ids").toJavaList(String.class));
    if (flag) {
      return JsonResult.success("删除成功");
    }
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据难度查询(题库管理) json数据包含difficulty、currentPage、pageSize
   * @date 2022/11/15 0:24
   */
  @RequestMapping(value = "/getListByDifficulty", method = RequestMethod.POST)
  public JsonResult getListByDifficulty(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(
        iTeacherService
            .getListByDifficulty(
                jsonObject.getString("difficulty"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        "查询成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]编辑题目(题库管理) json数据包含id、name、difficulty、label
   * @date 2022/11/15 17:19
   */
  @RequestMapping(value = "/editProblem", method = RequestMethod.PUT)
  public JsonResult editProblem(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iTeacherService.editProblem(
            jsonObject.getString("id"),
            jsonObject.getString("name"),
            jsonObject.getString("difficulty"),
            jsonObject.getString("label"));
    if (flag) {
      return JsonResult.success("编辑成功");
    }
    return JsonResult.failed("编辑失败");
  }
}

// 2977452 300892
