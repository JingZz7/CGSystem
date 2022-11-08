package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Administrator;

public interface IAdministratorService extends IService<Administrator> {

  public Boolean login(String name, String password);

  public Boolean isExistAdministrator(String id,String password);

  public Boolean isAdministratorPhone(String phone);

  public Boolean updatePasswordByPhone(String phone, String password);
}
