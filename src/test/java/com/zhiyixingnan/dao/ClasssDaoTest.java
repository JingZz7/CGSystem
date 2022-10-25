package com.zhiyixingnan.dao;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ClasssDaoTest {

  @Autowired private ClasssDao classsDao;

  @Test
  public void selectListTest() {
    System.out.println(classsDao.selectList(null));
  }
}
