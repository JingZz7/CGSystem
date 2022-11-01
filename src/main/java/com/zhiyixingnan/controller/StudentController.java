package com.zhiyixingnan.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.api.R;
import com.zhiyixingnan.controller.utils.Result;
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
  public Result getAll() {
    return new Result(true, iStudentService.list());
  }

  /**
   * @author ZJ Description 增 date 2022-10-31 20:38:11 20:38
   * @param student
   */
  @PostMapping
  public Result save(@RequestBody Student student) {
    return new Result(iStudentService.save(student));
  }

  /**
   * @author ZJ Description 改 date 2022-10-31 20:40:21 20:40
   * @param student
   */
  @PutMapping
  public Result update(@RequestBody Student student) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, student.getId());
    return new Result(iStudentService.update(student, lqw));
  }

  /**
   * @author ZJ Description 根据学号删除 date 2022-10-31 20:43:02 20:43
   * @param id
   */
  @DeleteMapping("{id}") // http://localhost/Student/202026010512
  public Result delete(@PathVariable String id) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return new Result(iStudentService.remove(lqw));
  }

  /**
   * @author ZJ Description 根据学号查询 date 2022-10-31 20:47:39 20:47
   * @param id
   */
  @GetMapping("{id}")
  public Result getById(@PathVariable String id) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return new Result(true, iStudentService.getOne(lqw));
  }

  //    /**
  //     * @author ZJ Description 分页查询 date 2022-10-31 21:36:28 21:36
  //     * @param currentPage
  //     * @param pageSize
  //     */
  //    @GetMapping("{currentPage}/{pageSize}")
  //    public Result getPage(@PathVariable int currentPage, @PathVariable int pageSize) {
  //      return new Result(true, iStudentService.getPage(currentPage, pageSize));
  //    }

  @GetMapping("/{id}/{password}")
  public Result login(@PathVariable String id, @PathVariable String password) {
    return new Result(true, iStudentService.login(id, password));
  }
}
