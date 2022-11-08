package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.AdministratorDao;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IAdministratorService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IAdministratorServiceImpl extends ServiceImpl<AdministratorDao, Administrator>
    implements IAdministratorService {

  @Autowired private AdministratorDao administratorDao;

  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(name), Administrator::getName, name);
    Administrator administrator = administratorDao.selectOne(lqw);

    if (administrator == null) {
      return false;
    }

    return password.equals(administrator.getPassword());
  }

  @Override
  public Boolean isExistAdministrator(String id, String password) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getId, id).eq(Administrator::getPassword, password);
    if (administratorDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean isAdministratorPhone(String phone) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getPhone, phone);
    if (administratorDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getPhone, phone);
    Administrator administrator = administratorDao.selectOne(lqw);
    administrator.setPassword(password);
    administratorDao.updateById(administrator);
    return true;
  }
}
