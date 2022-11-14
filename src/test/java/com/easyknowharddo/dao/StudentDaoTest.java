package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easyknowharddo.domain.Student;
import org.apache.logging.log4j.util.Strings;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class StudentDaoTest {

  @Autowired private StudentDao studentDao;

  @Test
  public void selectOneTest() {
    //    QueryWrapper qw=new QueryWrapper();
    //    qw.like("id","202026010512");
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper();
    lqw.eq(Student::getId, "202126010544");
    //    lqw.like(Student::getId, "260101");
    System.out.println(studentDao.selectOne(lqw));
  }

  @Test
  public void selectListTest() {
    String classId = "260101";
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(classId), Student::getClassId, classId);
    System.out.println(studentDao.selectList(lqw));
  }

  @Test
  public void insertTest() {
    Student student = new Student();
    student.setClassId("260105");
    student.setName("靖曾");
    student.setId("202026010512");
    student.setEmail("1950662032@qq.com");
    student.setPassword("addawdwadwasd");
    student.setPhone("1423423425");

    studentDao.insert(student);
  }

  @Test
  public void deleteTest() {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, "201707020309");
    studentDao.delete(lqw);
  }

  @Test
  public void updateTest() {
    Student student = new Student();
    student.setClassId("260105");
    student.setName("曾靖");
    student.setId("202026010512");
    student.setEmail("1950662032@qq.com");
    student.setPassword("xxx");
    student.setPhone("18389670510");

    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, "202026010512");

    studentDao.update(student, lqw);
  }

  @Test
  public void pageTest() {
    String emailEnd = "outlook.com";

    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.like(Student::getEmail, emailEnd);

    IPage page = new Page(0, 9);

    studentDao.selectPage(page, lqw);
  }
}
