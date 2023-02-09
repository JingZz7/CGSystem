package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.service.IAdministratorService;
import com.easyknowharddo.service.ITeacherService;
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
@RequestMapping("/accountManagement")
public class AccountManagementController {

  @Autowired private IAdministratorService iAdministratorService;
  @Autowired private ITeacherService iTeacherService;

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]获取账户列表(账户管理) json数据包含currentPage、pageSize
   * @date 2022/11/16 17:19
   */
  @RequestMapping(value = "/teacherGetAccountList", method = RequestMethod.POST)
  public JsonResult teacherGetAccountList(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iTeacherService
            .teacherGetAccountList(
                jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
            .getList(),
        iTeacherService
            .teacherGetAccountList(
                jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据工号查询(账户管理) json数据包含id、currentPage、pageSize
   * @date 2022/11/16 17:25
   */
  @RequestMapping(value = "/teacherGetAccountById", method = RequestMethod.POST)
  public JsonResult teacherGetAccountById(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iTeacherService
            .teacherGetAccountById(
                jsonObject.getString("id"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iTeacherService
            .teacherGetAccountById(
                jsonObject.getString("id"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据类型查询(账户管理) json数据包含type、currentPage、pageSize
   * @date 2022/11/17 10:26
   */
  @RequestMapping(value = "/teacherGetAccountByType", method = RequestMethod.POST)
  public JsonResult teacherGetAccountByType(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iTeacherService
            .teacherGetAccountByType(
                jsonObject.getString("type"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iTeacherService
            .teacherGetAccountByType(
                jsonObject.getString("type"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "查找成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]根据姓名查询(账户管理) json数据包含name、currentPage、pageSize
   * @date 2022/11/16 17:30
   */
  @RequestMapping(value = "/teacherGetAccountByName", method = RequestMethod.POST)
  public JsonResult teacherGetAccountByName(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iTeacherService
            .teacherGetAccountByName(
                jsonObject.getString("name"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iTeacherService
            .teacherGetAccountByName(
                jsonObject.getString("name"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }

  /**
   * @param jsonObject: a * @return JsonResult
   * @author ZJ
   * @description TODO [教师]添加账户(账户管理) json数据包含type、id、name、password、email、phone
   * @date 2022/11/20 21:26
   */
  @RequestMapping(value = "/teacherAddAccount", method = RequestMethod.POST)
  public JsonResult teacherAddAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iTeacherService.teacherAddAccount(
            jsonObject.getString("type"),
            jsonObject.getString("id"),
            jsonObject.getString("name"),
            jsonObject.getString("password"),
            jsonObject.getString("email"),
            jsonObject.getString("phone"));
    if (flag) return JsonResult.success("添加成功");
    return JsonResult.failed("添加失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]删除账户(账户管理) json数据包含id
   * @date 2022/11/15 0:42
   */
  @RequestMapping(value = "/teacherDeleteAccount", method = RequestMethod.DELETE)
  public JsonResult teacherDeleteAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag = iTeacherService.deleteAccount(jsonObject.getString("id"));
    if (flag) return JsonResult.success("删除成功");
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]批量删除账户(账户管理) json数据包含ids的数组
   * @date 2022/11/15 16:13
   */
  @RequestMapping(value = "/teacherBulkDeleteAccount", method = RequestMethod.DELETE)
  public JsonResult teacherBulkDeleteAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iTeacherService.teacherBulkDeleteAccount(
            jsonObject.getJSONArray("ids").toJavaList(String.class));
    if (flag) return JsonResult.success("删除成功");
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]重置密码(账户管理) json数据包含id
   * @date 2022/11/15 16:30
   */
  @RequestMapping(value = "/teacherResetPassword", method = RequestMethod.PUT)
  public JsonResult teacherResetPassword(@RequestBody JSONObject jsonObject) {
    Boolean flag = iTeacherService.teacherResetPassword(jsonObject.getString("id"));
    if (flag) return JsonResult.success("重置成功");
    return JsonResult.failed("重置失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [教师]批量重置密码(账户管理) json数据包含ids数组
   * @date 2022/11/15 16:38
   */
  @RequestMapping(value = "/teacherBulkResetPassword", method = RequestMethod.PUT)
  public JsonResult teacherBulkResetPassword(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iTeacherService.teacherBulkResetPassword(
            jsonObject.getJSONArray("ids").toJavaList(String.class));
    if (flag) return JsonResult.success("重置成功");
    return JsonResult.failed("重置失败");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [管理员]获取用户列表(账户管理) json数据包含currentPage、pageSize
   * @date 2022/11/17 11:19
   */
  @RequestMapping(value = "/administratorGetAccountList", method = RequestMethod.POST)
  public JsonResult administratorGetAccountList(@RequestBody JSONObject jsonObject) {
    return JsonResult.success(
        iAdministratorService.administratorGetAccountList(
            jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize")),
        "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [管理员]分类查找(账户管理) json数据包含type、currentPage、pageSize
   * @date 2022/11/17 11:28
   */
  @RequestMapping(value = "/getAccountByType", method = RequestMethod.POST)
  public JsonResult getAccountByType(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iAdministratorService
            .getAccountByType(
                jsonObject.getString("type"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iAdministratorService
            .getAccountByType(
                jsonObject.getString("type"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO [管理员]编辑账户(账户管理) json数据中包含id、password、email、phone、className
   * @date 2022/11/21 0:08
   */
  @RequestMapping(value = "/editAccount", method = RequestMethod.PUT)
  public JsonResult editAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iAdministratorService.editAccount(
            jsonObject.getString("id"),
            jsonObject.getString("password"),
            jsonObject.getString("email"),
            jsonObject.getString("phone"),
            jsonObject.getString("className"));

    if (flag) return JsonResult.success("修改成功");
    return JsonResult.failed("修改失败");
  }

  /**
   * @param jsonObject
   * @author ZJ Description [管理员]添加账户(账户管理) json数据包含type、id、name、password、email、phone date、className
   *     2022-11-12 16:28:51 16:28
   */
  @RequestMapping(value = "/addAccount", method = RequestMethod.POST)
  public JsonResult addAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iAdministratorService.addAccount(
            jsonObject.getString("type"),
            jsonObject.getString("id"),
            jsonObject.getString("name"),
            jsonObject.getString("password"),
            jsonObject.getString("email"),
            jsonObject.getString("phone"),
            jsonObject.getString("className"));
    if (flag) {
      return JsonResult.success("添加成功");
    }
    return JsonResult.failed("添加失败");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [管理员]重置密码(账户管理) json数据包含id
   * @date 2022/11/20 23:50
   */
  @RequestMapping(value = "/resetPasswords", method = RequestMethod.PUT)
  public JsonResult resetPasswords(@RequestBody JSONObject jsonObject) {
    Boolean flag = iAdministratorService.resetPassword(jsonObject.getString("id"));
    if (flag) return JsonResult.success("重置成功");
    return JsonResult.failed("重置失败");
  }

  /**
   * @param jsonObject
   * @author ZJ Description [管理员]批量重置密码(账户管理) json数据包含ids数组和password date 2022-11-13 10:00:24 10:00
   */
  @RequestMapping(value = "/bulkResetPasswords", method = RequestMethod.PUT)
  public JsonResult bulkResetPasswords(@RequestBody JSONObject jsonObject) {
    List<String> ids = jsonObject.getJSONArray("ids").toJavaList(String.class);
    Boolean flag = iAdministratorService.bulkResetPasswords(ids);

    if (flag) return JsonResult.success("修改成功");
    return JsonResult.failed("修改失败");
  }

  /**
   * @param jsonObject
   * @author ZJ Description [管理员]删除账号(账户管理) json数据包含id date 2022-11-13 10:22:41 10:22
   */
  @RequestMapping(value = "/deleteAccount", method = RequestMethod.DELETE)
  public JsonResult deleteAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag = iAdministratorService.deleteAccount(jsonObject.getString("id"));

    if (flag) return JsonResult.success("删除成功");
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject
   * @author ZJ Description [管理员]批量删除账号(账户管理) json数据包含ids数组 date 2022-11-13 14:43:21 14:43
   */
  @RequestMapping(value = "/bulkDeleteAccount", method = RequestMethod.DELETE)
  public JsonResult bulkDeleteAccount(@RequestBody JSONObject jsonObject) {
    List<String> ids = jsonObject.getJSONArray("ids").toJavaList(String.class);
    Boolean flag = iAdministratorService.bulkDeleteAccount(ids);
    if (flag) return JsonResult.success("删除成功");
    return JsonResult.failed("删除失败");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [管理员]根据id查询账号(账户管理) json数据包含id、currentPage、pageSize
   * @date 2022/11/20 22:25
   */
  @RequestMapping(value = "/getAccountById", method = RequestMethod.POST)
  public JsonResult getAccountById(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iAdministratorService
            .getAccountById(
                jsonObject.getString("id"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iAdministratorService
            .getAccountById(
                jsonObject.getString("id"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO [管理员]根据姓名查询账号(账户管理) json数据包含name、currentPage、pageSize
   * @date 2022/11/20 22:38
   */
  @RequestMapping(value = "/getAccountByName", method = RequestMethod.POST)
  public JsonResult getAccountByName(@RequestBody JSONObject jsonObject) {
    return JsonResult.successes(
        iAdministratorService
            .getAccountByName(
                jsonObject.getString("name"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getList(),
        iAdministratorService
            .getAccountByName(
                jsonObject.getString("name"),
                jsonObject.getInteger("currentPage"),
                jsonObject.getInteger("pageSize"))
            .getTotal(),
        "获取成功");
  }
}
