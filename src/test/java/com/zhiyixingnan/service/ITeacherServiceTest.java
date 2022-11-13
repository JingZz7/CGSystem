package com.zhiyixingnan.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

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
}
