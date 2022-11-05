package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/login")
public class LoginController {

  @Autowired private IStudentService iStudentService;

  @RequestMapping(value = "/students/{id}/{password}",method = RequestMethod.GET)
//  @GetMapping("/{id}/{password}")
  public JsonResult login(@PathVariable String id, @PathVariable String password) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    Student student = iStudentService.getOne(lqw);
    if (student == null) {
      return JsonResult.validateFailed("用户名或密码错误");
    }
    if (student.getPassword().equals(password)) {
      return JsonResult.success("success");
    }
    return JsonResult.failed("用户名或密码错误");
  }
}
