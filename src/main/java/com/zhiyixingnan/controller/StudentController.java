package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.List;

@RestController
@RequestMapping("/students")
public class StudentController {

  @Autowired private IStudentService iStudentService;

  /**
   * @author ZJ Description 查全部 date 2022-10-31 20:34:25 20:34
   * @param
   */
  @GetMapping
  public List<Student> getAll() {
    return iStudentService.list();
  }

  /**
   * @author ZJ Description 增 date 2022-10-31 20:38:11 20:38
   * @param student
   */
  @PostMapping
  public Boolean save(@RequestBody Student student) {
    return iStudentService.save(student);
  }

  /**
   * @author ZJ Description 改 date 2022-10-31 20:40:21 20:40
   * @param student
   */
  @PutMapping
  public Boolean update(@RequestBody Student student) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, student.getId());
    return iStudentService.update(student, lqw);
  }

  /**
   * @author ZJ Description 根据学号删除 date 2022-10-31 20:43:02 20:43
   * @param id
   */
  @DeleteMapping("{id}") // http://localhost/Student/202026010512
  public Boolean delete(@PathVariable String id) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return iStudentService.remove(lqw);
  }

  /**
   * @author ZJ Description 根据学号查询 date 2022-10-31 20:47:39 20:47
   * @param id
   */
  @GetMapping("{id}")
  public Student getById(@PathVariable String id) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return iStudentService.getOne(lqw);
  }
}
