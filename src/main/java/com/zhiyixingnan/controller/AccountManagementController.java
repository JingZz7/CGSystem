package com.zhiyixingnan.controller;

import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.service.IAdministratorService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
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
}
