package com.zhiyixingnan.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class IAdministratorServiceTest {

  @Autowired private IAdministratorService iAdministratorService;

  @Test
  public void editAccountTest() {
    iAdministratorService.editAccount("201810040106", "111111", "xxx@gmail.com", "123456789");
  }
}
