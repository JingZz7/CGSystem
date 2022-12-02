package com.easyknowharddo.utils;

import com.auth0.jwt.JWT;
import com.auth0.jwt.JWTVerifier;
import com.auth0.jwt.algorithms.Algorithm;
import com.auth0.jwt.interfaces.DecodedJWT;
import com.easyknowharddo.domain.Student;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class TokenUtil {

  private static final long EXPIRE_TIME = 150 * 60 * 1000;
  private static final String TOKEN_SECRET = "tokenqkj"; // 密钥盐

  /**
   * 签名生成
   *
   * @param student
   * @return
   */
  public static String sign(Student student) {

    String token = null;
    try {
      Date expiresAt = new Date(System.currentTimeMillis() + EXPIRE_TIME);
      token =
          JWT.create()
              .withIssuer("auth0")
              .withClaim("id", student.getId())
              .withExpiresAt(expiresAt)
              // 使用了HMAC256加密算法。
              .sign(Algorithm.HMAC256(TOKEN_SECRET));
    } catch (Exception e) {
      e.printStackTrace();
    }
    return token;
  }

  /**
   * 签名验证
   *
   * @param token
   * @return
   */
  public static List<String> verify(String token) {

    try {
      JWTVerifier verifier =
          JWT.require(Algorithm.HMAC256(TOKEN_SECRET)).withIssuer("auth0").build();
      DecodedJWT jwt = verifier.verify(token);
      System.out.println("认证通过：");
      System.out.println("issuer: " + jwt.getIssuer());
      System.out.println("id: " + jwt.getClaim("id").asString());
      System.out.println("过期时间：      " + jwt.getExpiresAt());
      List<String> list = new ArrayList<>();
      list.add("true");
      list.add(jwt.getClaim("id").asString());
      return list;
    } catch (Exception e) {
      List<String> list = new ArrayList<>();
      list.add("false");
      return list;
    }
  }
}
