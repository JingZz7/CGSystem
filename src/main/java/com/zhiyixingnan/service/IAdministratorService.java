package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Administrator;

import java.util.List;

public interface IAdministratorService extends IService<Administrator> {

  public Boolean login(String name, String password);

  public Boolean isExistAdministrator(String id, String password);

  public Boolean isAdministratorPhone(String phone);

  public Boolean updatePasswordByPhone(String phone, String password);

  public List<Object> getList();

  public Boolean editAccount(String id, String password, String email, String phone);
}
