package com.zhiyixingnan;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan("filter/SqlInjectFilter")
public class CgSystemApplication {

  public static void main(String[] args) {
    SpringApplication.run(CgSystemApplication.class, args);
  }
}
