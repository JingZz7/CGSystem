package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.AdministratorDao;
import com.zhiyixingnan.dao.TutorDao;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Tutor;
import com.zhiyixingnan.service.IAdministratorService;
import com.zhiyixingnan.service.ITutorService;
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
}
