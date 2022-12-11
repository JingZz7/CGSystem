package com.easyknowharddo.controller;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.easyknowharddo.controller.utils.Result;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.service.IStudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/students")
public class StudentController {

  @Autowired private IStudentService iStudentService;

  /**
   * @param
   * @author ZJ Description 查全部 date 2022-10-31 20:34:25 20:34
   */
  @GetMapping
  public Result getAll() {
    return new Result(true, iStudentService.list());
  }

  /**
   * @param student
   * @author ZJ Description 增 date 2022-10-31 20:38:11 20:38
   */
  @PostMapping
  public Result save(@RequestBody Student student) {
    return new Result(iStudentService.save(student));
  }

  /**
   * @param student
   * @author ZJ Description 改 date 2022-10-31 20:40:21 20:40
   */
  @PutMapping("{id}")
  public Result update(@PathVariable String id, @RequestBody Student student) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return new Result(iStudentService.update(student, lqw));
  }

  /**
   * @param id
   * @author ZJ Description 根据学号删除 date 2022-10-31 20:43:02 20:43
   */
  @DeleteMapping("{id}") // http://localhost/Student/202026010512
  public Result delete(@PathVariable String id) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, id);
    return new Result(iStudentService.remove(lqw));
  }

  /**
   * @param id
   * @author ZJ Description 根据学号查询 date 2022-10-31 20:47:39 20:47
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
    return new Result(iStudentService.login(id, password));
  }
}
