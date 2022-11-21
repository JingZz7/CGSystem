package com.easyknowharddo.utils;

public class GetCaptcha {
  public String getCode(int length) {
    String code = "";
    for (int i = 0; i < length; i++) {
      boolean boo = (int) (Math.random() * 2) == 0;
      if (boo) {
        code += String.valueOf((int) (Math.random() * 10));
      } else {
        int temp = (int) (Math.random() * 2) == 0 ? 65 : 97;
        char ch = (char) (Math.random() * 26 + temp);
        code += String.valueOf(ch);
      }
    }
    return code;
  }
}
