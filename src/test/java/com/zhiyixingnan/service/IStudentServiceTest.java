package com.zhiyixingnan.service;

import com.zhiyixingnan.domain.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class IStudentServiceTest {
  @Autowired private IStudentService iStudentService;

  @Test
  public void saveTest() {
    Student student = new Student();
    student.setId("202026010513");
    student.setName("笑睿张");
    student.setPhone("12424234234");
    student.setEmail("xxx@xxx.com");
    student.setPassword("xxxxxaaaaa");
    student.setClassId("260105");
    System.out.println(iStudentService.save(student));
  }

  @Test
  public void getStudentByClassNameTest() {
    System.out.println(iStudentService.getStudentByClassName("软件二班"));
  }
}
