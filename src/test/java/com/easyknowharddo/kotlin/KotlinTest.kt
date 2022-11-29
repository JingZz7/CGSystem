package com.easyknowharddo.kotlin

import com.easyknowharddo.controller.PersonalCenterController
import com.easyknowharddo.service.ITeacherService
import org.junit.jupiter.api.Test
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.boot.test.context.SpringBootTest

@SpringBootTest
class KotlinTest {

    @Autowired
    private lateinit var iTeacherService: ITeacherService

    @Autowired
    private var personalCenterController: PersonalCenterController? = null

    @Test
    fun test(): Unit {
//        val list = iTeacherService.teacherGetAccountList(1, 10)
//        println(list)
//        println(personalCenterController?.getProblemList(1,10))
    }
}