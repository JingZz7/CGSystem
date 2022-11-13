package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.service.IAdministratorService;
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

  /**
   * @author ZJ Description [管理员]获取用户列表(账户管理) date 2022-11-12 00:04:14 0:04
   * @param
   */
  @RequestMapping(value = "/getList", method = RequestMethod.POST)
  public JsonResult getList() {
    List<Object> list = iAdministratorService.getList();
    if (list == null) {
      return JsonResult.failed("查找失败");
    }
    return JsonResult.success(list, "查找成功");
  }

  /**
   * @author ZJ Description [管理员]编辑账户(账户管理) json数据中包含id、password、email、phone date 2022-11-12
   *     15:45:02 15:45
   * @param jsonObject
   */
  @RequestMapping(value = "/editAccount", method = RequestMethod.PUT)
  public JsonResult editAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iAdministratorService.editAccount(
            jsonObject.getString("id"),
            jsonObject.getString("password"),
            jsonObject.getString("email"),
            jsonObject.getString("phone"));

    if (flag) {
      return JsonResult.success("修改成功");
    }
    return JsonResult.failed("修改失败");
  }

  /**
   * @author ZJ Description [管理员]添加账户(账户管理) json数据包含type、id、name、password、email、phone date
   *     2022-11-12 16:28:51 16:28
   * @param jsonObject
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
            jsonObject.getString("phone"));
    if (flag) {
      return JsonResult.success("添加成功");
    }
    return JsonResult.failed("添加失败");
  }

  /**
   * @author ZJ Description [管理员]批量重置密码(账户管理) date 2022-11-13 10:00:24 10:00
   * @param jsonObject
   */
  @RequestMapping(value = "/bulkResetPasswords", method = RequestMethod.PUT)
  public JsonResult bulkResetPasswords(@RequestBody JSONObject jsonObject) {
    List<String> ids = jsonObject.getJSONArray("ids").toJavaList(String.class);
    Boolean flag = iAdministratorService.bulkResetPasswords(ids, jsonObject.getString("password"));

    if (flag) {
      return JsonResult.success("修改成功");
    }
    return JsonResult.failed("修改失败");
  }

  /**
   * @author ZJ Description [管理员]删除账号(账户管理) json数据包含id date 2022-11-13 10:22:41 10:22
   * @param jsonObject
   */
  @RequestMapping(value = "/deleteAccount", method = RequestMethod.DELETE)
  public JsonResult deleteAccount(@RequestBody JSONObject jsonObject) {
    Boolean flag = iAdministratorService.deleteAccount(jsonObject.getString("id"));

    if (flag) {
      return JsonResult.success("删除成功");
    }
    return JsonResult.failed("删除失败");
  }
}
