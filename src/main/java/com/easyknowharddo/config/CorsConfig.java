package com.easyknowharddo.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

/**
 * @author: ZJ @Date: 2022-11-05 10:31:03 10:31 @Description: CORS 配置允许前端跨域访问
 */
@Configuration
public class CorsConfig {
  private CorsConfiguration buildConfig() {
    CorsConfiguration corsConfiguration = new CorsConfiguration();
    /*是否允许请求带有验证信息*/
    corsConfiguration.setAllowCredentials(true);
    /*允许访问的客户端域名*/
    corsConfiguration.addAllowedOrigin("*"); // 1
    /*允许服务端访问的客户端请求头*/
    corsConfiguration.addAllowedHeader("*"); // 2
    /*允许访问的方法名,GET POST等*/
    corsConfiguration.addAllowedMethod("*"); // 3
    return corsConfiguration;
  }

  @Bean
  public CorsFilter corsFilter() {
    UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
    source.registerCorsConfiguration("/**", buildConfig()); // 4
    return new CorsFilter(source);
  }
}
