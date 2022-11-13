package com.zhiyixingnan.service;

import com.zhiyixingnan.domain.Student;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.PutMapping;

import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class IAdministratorServiceTest {

  @Autowired private IAdministratorService iAdministratorService;

  @Test
  public void editAccountTest() {
    iAdministratorService.editAccount("201810040106", "111111", "xxx@gmail.com", "123456789");
  }

  @Test
  public void addAccountTest() {
    iAdministratorService.addAccount(
        "tutor", "202026010512", "zj", "123456", "xxx@qq.com", "123321123");
  }

  @Test
  public void bulkResetPasswordsTest() {
    ArrayList<String> strings = new ArrayList<>();
    strings.add("202108030328");
    strings.add("202108030329");
    strings.add("T202026010512");
    strings.add("202026010512");
    iAdministratorService.bulkResetPasswords(strings, "123111321");
  }

  @Test
  public void deleteAccountTest() {
    iAdministratorService.deleteAccount("2222222223");
  }

  @Test
  public void bulkDeleteAccountTest() {
    List<String> list = new ArrayList<>();
    list.add("202108030204");
    list.add("202108030207");
    list.add("202026010512");
    list.add("2222222224");
    iAdministratorService.bulkDeleteAccount(list);
  }
}
