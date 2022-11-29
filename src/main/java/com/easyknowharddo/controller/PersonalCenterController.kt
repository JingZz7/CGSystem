package com.easyknowharddo.controller

import com.alibaba.fastjson.JSONObject
import com.easyknowharddo.controller.utils.JsonResult
import com.easyknowharddo.dao.ProblemDao
import com.easyknowharddo.dao.StudentDao
import com.easyknowharddo.service.IStudentService
import lombok.extern.slf4j.Slf4j
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/personalCenter")
class PersonalCenterController {

    @Autowired
    private val iStudentService: IStudentService? = null

    @Autowired
    private val studentDao: StudentDao? = null

    @Autowired
    private val problemDao: ProblemDao? = null

    @RequestMapping(value = ["/modifyInformation"], method = [RequestMethod.POST])
    open fun modifyInformation(@RequestBody jsonObject: JSONObject): JsonResult<*>? {
        return JsonResult.successes(
            iStudentService
                ?.getProblemList(jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                ?.list,
            iStudentService
                ?.getProblemList(jsonObject.getInteger("currentPage"), jsonObject.getInteger("pageSize"))
                ?.total,
            "获取成功"
        )
    }
}