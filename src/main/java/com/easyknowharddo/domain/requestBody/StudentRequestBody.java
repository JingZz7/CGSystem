package com.easyknowharddo.domain.requestBody;

import lombok.Data;

@Data
public class StudentRequestBody {

  @Data
  public static class loginStudent {
    String id;
    String password;
  }
}
