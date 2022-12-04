package com.easyknowharddo.controller

import com.alibaba.fastjson.JSONObject
import com.easyknowharddo.controller.utils.JsonResult
import com.easyknowharddo.service.IAdministratorService
import com.easyknowharddo.service.IStudentService
import com.easyknowharddo.service.ITeacherService
import com.easyknowharddo.service.ITutorService
import lombok.extern.slf4j.Slf4j
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.web.bind.annotation.CrossOrigin
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RestController

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

    /**
     * @param null:
     * @return null
     * @author ZJ
     * @description TODO [学生]修改电话和邮箱(个人中心)
     * @date 2022/12/4 23:22
     */
    @RequestMapping(value = ["/modifyPhoneAndEmailById"], method = [RequestMethod.PUT])
    open fun modifyPhoneAndEmailById(@RequestBody jsonObject: JSONObject): JsonResult<*>? {
        val flagStudent = iStudentService?.modifyPhoneAndEmailById(
            jsonObject.getString("id"), jsonObject.getString("phone"), jsonObject
                .getString("email")
        )
        val flagTeacher = iTeacherService?.modifyPhoneAndEmailById(
            jsonObject.getString("id"), jsonObject.getString("phone"), jsonObject
                .getString("email")
        )
        val flagTutor = iTutorService?.modifyPhoneAndEmailById(
            jsonObject.getString("id"), jsonObject.getString("phone"), jsonObject
                .getString("email")
        )
        val flagAdministrator = iAdministratorService?.modifyPhoneAndEmailById(
            jsonObject.getString("id"), jsonObject.getString("phone"), jsonObject
                .getString("email")
        )
        if (flagStudent == true || flagTeacher == true || flagTutor == true || flagAdministrator == true) {
            return JsonResult.success("success", "修改成功");
        }
        return JsonResult.failed("error", "修改失败")
    }
}