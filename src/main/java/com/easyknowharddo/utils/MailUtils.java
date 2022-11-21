package com.easyknowharddo.utils;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

/** 发邮件工具类 */
public final class MailUtils {
  private String USER = "1950662032@qq.com"; // 发件人称号，同邮箱地址※
  private String PASSWORD = "zjztmqgmedekbaeg"; // 授权码，开启SMTP时显示※
  // zj zjztmqgmedekbaeg

  @Override
  public String toString() {
    return "MailUtils{" + "USER='" + USER + '\'' + ", PASSWORD='" + PASSWORD + '\'' + '}';
  }

  public String getUSER() {
    return USER;
  }

  public void setUSER(String USER) {
    this.USER = USER;
  }

  public String getPASSWORD() {
    return PASSWORD;
  }

  public void setPASSWORD(String PASSWORD) {
    this.PASSWORD = PASSWORD;
  }

  /**
   * @param to 收件人邮箱
   * @param text 邮件正文
   * @param title 标题
   */
  /* 发送验证信息的邮件 */
  public boolean sendMail(String to, String text, String title) {
    try {
      final Properties props = new Properties();
      props.put("mail.smtp.auth", "true");
      //            注意发送邮件的方法中，发送给谁的，发送给对应的app，※
      //            要改成对应的app。扣扣的改成qq的，网易的要改成网易的。※
      props.put("mail.smtp.host", "smtp.qq.com");
      //            props.put("mail.smtp.host", "smtp.163.com");

      // 发件人的账号
      props.put("mail.user", USER);
      // 发件人的密码
      props.put("mail.password", PASSWORD);

      // 构建授权信息，用于进行SMTP进行身份验证
      Authenticator authenticator =
          new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
              // 用户名、密码
              String userName = props.getProperty("mail.user");
              String password = props.getProperty("mail.password");
              return new PasswordAuthentication(userName, password);
            }
          };
      // 使用环境属性和授权信息，创建邮件会话
      Session mailSession = Session.getInstance(props, authenticator);
      // 创建邮件消息
      MimeMessage message = new MimeMessage(mailSession);
      // 设置发件人
      String username = props.getProperty("mail.user");
      InternetAddress form = new InternetAddress(username);
      message.setFrom(form);

      // 设置收件人
      InternetAddress toAddress = new InternetAddress(to);
      message.setRecipient(Message.RecipientType.TO, toAddress);

      // 设置邮件标题
      message.setSubject(title);

      // 设置邮件的内容体
      message.setContent(text, "text/html;charset=UTF-8");
      // 发送邮件
      Transport.send(message);
      return true;
    } catch (Exception e) {
      e.printStackTrace();
    }
    return false;
  }

  public static void main(String[] args) throws Exception { // 做测试用
    MailUtils mailUtils = new MailUtils();
    mailUtils.sendMail(
        "1950662032@qq.com", "验证码为：" + new GetCaptcha().getCode(6), "CGSystem验证码"); // 填写接收邮箱※
    System.out.println("发送成功");
  }
}
