package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.controller.utils.JsonResult;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
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

  @RequestMapping(value = "/students",method = RequestMethod.POST)
//  @GetMapping("/{id}/{password}")
  public JsonResult login(@RequestBody Student student) {
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
}
