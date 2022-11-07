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

  @Test
  public void loginTest() {
    System.out.println(iStudentService.login("曾靖", "xxx"));
  }

  @Test
  public void isStudentPhoneTest() {
    System.out.println(iStudentService.isStudentPhone("12424234233"));
  }

  @Test
  public void isExistStudentTest() {
    System.out.println(iStudentService.isExistStudent("202126010446", "QkwGdoz6joliYE2g"));
  }
}
