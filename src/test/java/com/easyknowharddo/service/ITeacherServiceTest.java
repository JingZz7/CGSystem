package com.easyknowharddo.service;

import com.github.pagehelper.PageInfo;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.ArrayList;
import java.util.HashMap;

@SpringBootTest
public class ITeacherServiceTest {

    @Autowired
    private ITeacherService iTeacherService;

    @Test
    public void teacherGetAccountListTest() {
        //    System.out.println(iTeacherService.teacherGetAccountList());
    }

    @Test
    public void teacherGetAccountByIdTest() {
        //    System.out.println(iTeacherService.teacherGetAccountById("202026010512"));
    }

    @Test
    public void teacherGetAccountByNameTest() {
        //    System.out.println(iTeacherService.teacherGetAccountByName("李"));
    }

    @Test
    public void teacherViewReviewTest() {
        PageInfo<HashMap<String, String>> pageInfo = iTeacherService.teacherGetReviewByProblemId("1", 1, 2);
        System.out.println(pageInfo);
    }

    @Test
    public void deleteProblemTest() {
        iTeacherService.deleteProblem("4");
    }

    @Test
    public void bulkDeleteProblemTest() {
        ArrayList<String> list = new ArrayList<>();
        list.add("1");
        list.add("2");
        list.add("3");
        iTeacherService.bulkDeleteProblem(list);
    }

    @Test
    public void getKnowledgePointGradeTest() {
        iTeacherService.getKnowledgePointGrade("201810040108");
    }
}
