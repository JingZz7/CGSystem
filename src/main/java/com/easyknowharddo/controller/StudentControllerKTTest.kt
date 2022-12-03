package com.easyknowharddo.controller

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper
import com.baomidou.mybatisplus.core.toolkit.support.SFunction
import com.easyknowharddo.controller.utils.Result
import com.easyknowharddo.domain.Student
import com.easyknowharddo.service.IStudentService
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@RequestMapping("/students")
class StudentControllerKTTest {
    @Autowired
    private val iStudentService: IStudentService? = null

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @get:GetMapping
    val all: Result
        get() = Result(true, iStudentService!!.list())

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @PostMapping
    fun save(@RequestBody student: Student): Result {
        return Result(iStudentService!!.save(student))
    }

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @PutMapping("{id}")
    fun update(@PathVariable id: String?, @RequestBody student: Student): Result {
        val lqw = LambdaQueryWrapper<Student>()
        lqw.eq(SFunction<Student, Any> { obj: Student -> obj.id }, id)
        return Result(iStudentService!!.update(student, lqw))
    }

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @DeleteMapping("{id}") // http://localhost/Student/202026010512
    fun delete(@PathVariable id: String?): Result {
        val lqw = LambdaQueryWrapper<Student>()
        lqw.eq(SFunction<Student, Any> { obj: Student -> obj.id }, id)
        return Result(iStudentService!!.remove(lqw))
    }

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @GetMapping("{id}")
    fun getById(@PathVariable id: String?): Result {
        val lqw = LambdaQueryWrapper<Student>()
        lqw.eq(SFunction<Student, Any> { obj: Student -> obj.id }, id)
        return Result(true, iStudentService!!.getOne(lqw))
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
    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO test
     */
    @GetMapping("/{id}/{password}")
    fun login(@PathVariable id: String?, @PathVariable password: String?): Result {
        return Result(iStudentService!!.login(id, password))
    }
}