package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.service.IAdministratorService;
import com.zhiyixingnan.service.IStudentService;
import com.zhiyixingnan.service.ITeacherService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class LoginController {

  @Autowired private IStudentService iStudentService;
  @Autowired private ITeacherService iTeacherService;
  @Autowired private IAdministratorService iAdministratorService;
  @Autowired private LoginController loginController;

  /**
   * @author ZJ Description 学生登录 date 2022-11-05 21:01:32 21:01
   * @param student
   */
  @RequestMapping(value = "/students", method = RequestMethod.POST)
  //  @GetMapping("/{id}/{password}")
  public JsonResult loginStudent(@RequestBody Student student) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, student.getId());
    Student studentTemp = iStudentService.getOne(lqw);
    if (studentTemp == null) {
      return JsonResult.validateFailed("用户名或密码错误");
    }
    if (studentTemp.getPassword().equals(student.getPassword())) {
      return JsonResult.success("success");
    }
    return JsonResult.failed("用户名或密码错误");
  }

  /**
   * @author ZJ Description 教师登录 date 2022-11-06 22:05:57 22:05
   * @param teacher
   */
  @RequestMapping(value = "/teachers", method = RequestMethod.POST)
  public JsonResult loginTeacher(@RequestBody Teacher teacher) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Teacher::getId, teacher.getId());
    Teacher teacherTemp = iTeacherService.getOne(lqw);
    if (teacherTemp == null) {
      return JsonResult.validateFailed("用户名或密码错误");
    }
    if (teacherTemp.getPassword().equals(teacher.getPassword())) {
      return JsonResult.success("success");
    }
    return JsonResult.failed("用户名或密码错误");
  }

  /**
   * @author ZJ Description 管理员登录 date 2022-11-06 22:07:50 22:07
   * @param administrator
   */
  @RequestMapping(value = "/administrators", method = RequestMethod.POST)
  public JsonResult loginAdministrator(@RequestBody Administrator administrator) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getId, administrator.getId());
    Administrator administratorTemp = iAdministratorService.getOne(lqw);
    if (administratorTemp == null) {
      return JsonResult.validateFailed("用户名或密码错误");
    }
    if (administratorTemp.getPassword().equals(administrator.getPassword())) {
      return JsonResult.success("success");
    }
    return JsonResult.failed("用户名或密码错误");
  }

  /**
   * @author ZJ Description 忘记密码 date 2022-11-06 23:02:30 23:02
   * @param phone
   */
  @RequestMapping(value = "/forgotPassword/{phone}", method = RequestMethod.GET)
  public JsonResult forgotPassword(@PathVariable String phone) {
    LambdaQueryWrapper<Student> lqw1 = new LambdaQueryWrapper<>();
    LambdaQueryWrapper<Teacher> lqw2 = new LambdaQueryWrapper<>();
    LambdaQueryWrapper<Administrator> lqw3 = new LambdaQueryWrapper<>();
    lqw1.eq(Student::getPhone, phone);
    lqw2.eq(Teacher::getPhone, phone);
    lqw3.eq(Administrator::getPhone, phone);
    Student student = iStudentService.getOne(lqw1);
    Teacher teacher = iTeacherService.getOne(lqw2);
    Administrator administrator = iAdministratorService.getOne(lqw3);
    if (student == null && teacher == null && administrator == null) {
      return JsonResult.failed("手机号不存在");
    }
    if (student != null) {
      return JsonResult.success(student, "student");
    } else if (teacher != null) {
      return JsonResult.success(teacher, "teacher");
    }
    return JsonResult.success(administrator, "administrator");
  }

  /**
   * @author ZJ Description 修改学生密码 date 2022-11-07 00:11:37 0:11
   * @param student
   */
  @RequestMapping(value = "/modifyStudentPassword", method = RequestMethod.PUT)
  public JsonResult modifyStudentPassword(@RequestBody Student student) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getPhone, student.getPhone());
    iStudentService.update(student, lqw);
    return JsonResult.success("修改成功!");
  }

  /**
   * @author ZJ Description 修改教师密码 date 2022-11-07 00:13:55 0:13
   * @param teacher
   */
  @RequestMapping(value = "/modifyTeacherPassword", method = RequestMethod.PUT)
  public JsonResult modifyTeacherPassword(@RequestBody Teacher teacher) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Teacher::getPhone, teacher.getPhone());
    iTeacherService.update(teacher, lqw);
    return JsonResult.success("修改成功!");
  }

  /**
   * @author ZJ Description 修改管理员密码 date 2022-11-07 00:15:14 0:15
   * @param administrator
   */
  @RequestMapping(value = "/modifyAdministratorPassword", method = RequestMethod.PUT)
  public JsonResult modifyAdministratorPassword(@RequestBody Administrator administrator) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getPhone, administrator.getPhone());
    iAdministratorService.update(administrator, lqw);
    return JsonResult.success("修改成功!");
  }
}
