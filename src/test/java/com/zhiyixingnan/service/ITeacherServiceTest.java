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
}
