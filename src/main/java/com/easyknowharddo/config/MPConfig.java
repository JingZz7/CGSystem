package com.easyknowharddo.config;

import com.baomidou.mybatisplus.annotation.DbType;
import com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor;
import com.baomidou.mybatisplus.extension.plugins.inner.PaginationInnerInterceptor;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class MPConfig {
  /**
   * @param
   * @return com.baomidou.mybatisplus.extension.plugins.MybatisPlusInterceptor
   * @author ZJ
   * @description //TODO MyBatisPlus拦截器
   * @date 2022-10-26 13:45:26 13:45
   */
  @Bean
  public MybatisPlusInterceptor mybatisPlusInterceptor() {
    MybatisPlusInterceptor interceptor = new MybatisPlusInterceptor();
    interceptor.addInnerInterceptor(new PaginationInnerInterceptor(DbType.MYSQL));
    interceptor.addInnerInterceptor(new PaginationInnerInterceptor());
    return interceptor;
  }
}
