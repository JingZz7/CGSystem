package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.service.IAdministratorService;
import com.zhiyixingnan.service.IStudentService;
import com.zhiyixingnan.service.ITeacherService;
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
  @Autowired
  private ITeacherService iTeacherService;
  @Autowired
  private IAdministratorService iAdministratorService;

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
}