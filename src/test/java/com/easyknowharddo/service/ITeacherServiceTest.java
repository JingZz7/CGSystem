package com.easyknowharddo.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.HashMap;
import java.util.List;

@SpringBootTest
public class ITeacherServiceTest {

  @Autowired private ITeacherService iTeacherService;

  @Test
  public void teacherGetAccountListTest() {
    System.out.println(iTeacherService.teacherGetAccountList());
  }

  @Test
  public void teacherGetAccountByIdTest() {
    System.out.println(iTeacherService.teacherGetAccountById("202026010512"));
  }

  @Test
  public void teacherGetAccountByNameTest() {
    System.out.println(iTeacherService.teacherGetAccountByName("李"));
  }

  @Test
  public void teacherViewReviewTest() {
    List<HashMap<String, String>> hashMaps = iTeacherService.teacherViewReview("1");
    System.out.println(hashMaps);
  }
}
