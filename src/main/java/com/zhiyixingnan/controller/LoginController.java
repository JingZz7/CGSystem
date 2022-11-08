package com.zhiyixingnan.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.service.IAdministratorService;
import com.zhiyixingnan.service.IStudentService;
import com.zhiyixingnan.service.ITeacherService;
import lombok.Value;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
@Slf4j
@RequestMapping("/login")
public class LoginController {

  @Autowired private IStudentService iStudentService;
  @Autowired private ITeacherService iTeacherService;
  @Autowired private IAdministratorService iAdministratorService;
  @Autowired private LoginController loginController;

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public JsonResult test() {
    System.out.println("test hot deploy..");
    System.out.println("test hot deploy..");
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, "202026010512");
    return JsonResult.success(iStudentService.getOne(lqw));
  }

  /**
   * @author ZJ Description 学生登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:28:34 21:28
   * @param jsonObject
   */
  @RequestMapping(value = "/students", method = RequestMethod.POST)
  //  @GetMapping("/{id}/{password}")
  public JsonResult loginStudent(@RequestBody JSONObject jsonObject) {
    //    lqw.eq(Student::getDeleted        , 0)
    //            .and(i -> i.eq(Student::getId, id).eq(Student::getPassword, password));
    if (iStudentService.isExistStudent(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success("登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @author ZJ Description 教师登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:52:57 21:52
   * @param jsonObject
   */
  @RequestMapping(value = "/teachers", method = RequestMethod.POST)
  public JsonResult loginTeacher(@RequestBody JSONObject jsonObject) {
    if (iTeacherService.isExistTeacher(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success("登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @author ZJ Description 管理员登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:56:40 21:56
   * @param jsonObject
   */
  @RequestMapping(value = "/administrators", method = RequestMethod.POST)
  public JsonResult loginAdministrator(@RequestBody JSONObject jsonObject) {
    if (iAdministratorService.isExistAdministrator(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success("登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @author ZJ Description 忘记密码 date jsonObject数据包含"phone"字段即可 2022-11-07 18:04:21 18:04
   * @param jsonObject
   */
  @RequestMapping(value = "/forgotPassword", method = RequestMethod.POST)
  public JsonResult forgotPassword(@RequestBody JSONObject jsonObject) {
    if (!iStudentService.isStudentPhone(jsonObject.getString("phone"))
        && !iTeacherService.isTeacherPhone(jsonObject.getString("phone"))
        && !iAdministratorService.isAdministratorPhone(jsonObject.getString("phone"))) {
      return JsonResult.validateFailed("手机号不存在");
    }
    return JsonResult.success("手机号存在");
  }

  /**
   * @author ZJ Description 修改密码 date jsonObject数据包含"phone"字段和"password"字段即可 2022-11-07 17:47:14
   *     17:47
   * @param jsonObject
   */
  @RequestMapping(value = "/modifyPassword", method = RequestMethod.PUT)
  public JsonResult modifyPassword(@RequestBody JSONObject jsonObject) {
    String phone = jsonObject.getString("phone");
    if (iStudentService.isStudentPhone(phone)) {
      iStudentService.updatePasswordByPhone(phone, jsonObject.getString("password"));
      return JsonResult.success("修改成功！");
    } else if (iTeacherService.isTeacherPhone(phone)) {
      iTeacherService.updatePasswordByPhone(phone, jsonObject.getString("password"));
      return JsonResult.success("修改成功！");
    }
    iAdministratorService.updatePasswordByPhone(phone, jsonObject.getString("password"));
    return JsonResult.success("修改成功！");
  }

  //  /**
  //   * @author ZJ Description 修改教师密码 date 2022-11-07 00:13:55 0:13
  //   * @param teacher
  //   */
  //  @RequestMapping(value = "/modifyTeacherPassword", method = RequestMethod.PUT)
  //  public JsonResult modifyTeacherPassword(@RequestBody Teacher teacher) {
  //    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
  //    lqw.eq(Teacher::getPhone, teacher.getPhone());
  //    iTeacherService.update(teacher, lqw);
  //    return JsonResult.success("修改成功!");
  //  }
  //
  //
  //  @RequestMapping(value = "/modifyAdministratorPassword", method = RequestMethod.PUT)
  //  public JsonResult modifyAdministratorPassword(@RequestBody JSONObject jsonObject) {
  ////    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
  ////    lqw.eq(Administrator::getPhone, administrator.getPhone());
  ////    iAdministratorService.update(administrator, lqw);
  ////    return JsonResult.success("修改成功!");
  //
  //    Student student=jsonObject.toJavaObject(Student.class);
  //    return JsonResult.success(student);
  //  }
}
