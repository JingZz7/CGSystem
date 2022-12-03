package com.easyknowharddo.controller

import com.alibaba.fastjson.JSONObject
import com.easyknowharddo.controller.utils.JsonResult
import com.easyknowharddo.service.IAdministratorService
import com.easyknowharddo.service.IStudentService
import com.easyknowharddo.service.ITeacherService
import com.easyknowharddo.service.ITutorService
import lombok.extern.slf4j.Slf4j
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.*

/**
 * (个人中心)Controller
 * 因为比较简单，所以作为学习Kotlin的一种方式
 * 语法和Java有些类似，Kotlin可以直接调用Java接口
 * */
@RestController
@Slf4j
@CrossOrigin
@RequestMapping("/personalCenter")
class PersonalCenterController {

    @Autowired
    private val iStudentService: IStudentService? = null

    @Autowired
    private val iTeacherService: ITeacherService? = null

    @Autowired
    private val iTutorService: ITutorService? = null

    @Autowired
    private val iAdministratorService: IAdministratorService? = null

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO 展示个人信息(个人中心)
     * @date 2022/12/3 18:49
     */
    @RequestMapping(value = ["/displayPersonalInformation"], method = [RequestMethod.POST])
    open fun displayPersonalInformation(@RequestBody jsonObject: JSONObject): JsonResult<List<HashMap<String, String>>>? {
        val flagStudent = iStudentService?.isStudentExist(jsonObject.getString("id"))
        val flagTeacher = iTeacherService?.isTeacherExist(jsonObject.getString("id"))
        val flagTutor = iTutorService?.isTutorExist(jsonObject.getString("id"))
        val flagAdministrator = iAdministratorService?.isAdministratorExist(jsonObject.getString("id"))
        if (flagStudent == true) {
            return JsonResult.success(iStudentService?.displayPersonalInformation(jsonObject.getString("id")), "获取成功")
        } else if (flagTeacher == true) {
            return JsonResult.success(iTeacherService?.displayPersonalInformation(jsonObject.getString("id")), "获取成功")
        } else if (flagTutor == true) {
            return JsonResult.success(iTutorService?.displayPersonalInformation(jsonObject.getString("id")), "获取成功")
        } else if (flagAdministrator == true) {
            return JsonResult.success(
                iAdministratorService?.displayPersonalInformation(jsonObject.getString("id")),
                "获取成功"
            )
        }
        return JsonResult.failed("获取失败")
    }
}