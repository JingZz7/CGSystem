package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Administrator;

public interface IAdministratorService extends IService<Administrator> {

  public Boolean login(String name, String password);
}
