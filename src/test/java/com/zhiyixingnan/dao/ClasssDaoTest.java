package com.zhiyixingnan.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.zhiyixingnan.domain.Classs;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ClasssDaoTest {

  @Autowired private ClasssDao classsDao;

  @Test
  public void selectOneTest() {
    //    QueryWrapper qw=new QueryWrapper();
    //    qw.like("id","202026010512");
    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper();
    lqw.eq(Classs::getId, "260105");
    //    lqw.like(Student::getId, "260101");
    System.out.println(classsDao.selectOne(lqw));
  }

  @Test
  public void selectListTest() {
    //    String classId = "260101";
    //    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
    //    lqw.eq(Strings.isNotEmpty(classId), Classs::getClassId, classId);
    System.out.println(classsDao.selectList(null));
  }

  @Test
  public void insertTest() {
    Classs classs1 = new Classs();
    Classs classs2 = new Classs();
    Classs classs3 = new Classs();
    Classs classs4 = new Classs();

    classs1.setId("080301");
    classs1.setName("通信一班");

    classs2.setId("080302");
    classs2.setName("通信二班");

    classs3.setId("080303");
    classs3.setName("通信三班");

    classs4.setId("080304");
    classs4.setName("通信四班");

    classsDao.insert(classs1);
    classsDao.insert(classs2);
    classsDao.insert(classs3);
    classsDao.insert(classs4);
  }

  @Test
  public void deleteTest() {
    // delete skip for now
  }

  @Test
  public void updateTest() {
    // update skip for now
  }

  @Test
  public void pageTest() {
    String name = "一";

    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
    lqw.like(Classs::getName, name);

    IPage page = new Page(0, 9);

    classsDao.selectPage(page, lqw);
  }

  @Test
  public void getIdByName() {
    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Classs::getName, "软件一班");
    //    System.out.println(classsDao.selectOne(lqw));
    Classs classs = classsDao.selectOne(lqw);
    System.out.println(classs.getId());
  }
}
