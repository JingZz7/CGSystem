package com.zhiyixingnan.dao;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class StudentDaoTest {

  @Autowired private StudentDao studentDao;

  @Test
  public void selectListTest() {
    QueryWrapper qw=new QueryWrapper();
    qw.like("id","202026010512");
    System.out.println(studentDao.selectList(qw));
  }
}
