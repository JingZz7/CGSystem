package com.easyknowharddo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

@SpringBootApplication
@ServletComponentScan
@EnableAspectJAutoProxy
public class CgSystemApplication {
  public static void main(String[] args) {
    SpringApplication.run(CgSystemApplication.class, args);
  }
}
