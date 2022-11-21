package com.easyknowharddo.service;

import com.easyknowharddo.utils.GetCaptcha;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

@SpringBootTest
public class IAdministratorServiceTest {

  private static final String PATH = "C:\\Users\\曾靖\\Desktop\\hello.py";

  @Autowired private IAdministratorService iAdministratorService;

  @Test
  public void editAccountTest() {
    //    iAdministratorService.editAccount("201810040106", "111111", "xxx@gmail.com", "123456789");
    System.out.println(new GetCaptcha().getCode(6));
  }

  @Test
  public void addAccountTest() {
//    iAdministratorService.addAccount(
//        "tutor", "202026010512", "zj", "123456", "xxx@qq.com", "123321123");
  }

  @Test
  public void bulkResetPasswordsTest() {
    ArrayList<String> strings = new ArrayList<>();
    strings.add("202108030328");
    strings.add("202108030329");
    strings.add("T202026010512");
    strings.add("202026010512");
    //    iAdministratorService.bulkResetPasswords(strings, "123111321");
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

  @Test
  public void pyTest() {
    System.out.println("Start");
    // python脚本的绝对路径，在windows中用"\\"分隔，在Linux中用"/"分隔
    String pyPath = "C:\\Users\\曾靖\\Desktop\\hello.py";

    // 传入python脚本的参数为”111“
    String[] args1 = new String[] {"python", pyPath, "111"};

    try {
      // 执行Python文件，并传入参数
      Process process = Runtime.getRuntime().exec(args1);
      // 获取Python输出字符串作为输入流被Java读取
      BufferedReader in = new BufferedReader(new InputStreamReader(process.getInputStream()));
      String actionStr = in.readLine();
      if (actionStr != null) {
        System.out.println(actionStr);
      }

      in.close();
      process.waitFor();
    } catch (IOException e) {
      throw new RuntimeException(e);
    } catch (InterruptedException e) {
      throw new RuntimeException(e);
    }

    System.out.println("End");
  }

  @Test
  public void administratorGetAccountListTest(){
    System.out.println(iAdministratorService.administratorGetAccountList(1, 10));
  }
}
