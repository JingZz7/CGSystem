package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.TutorDao;
import com.zhiyixingnan.domain.Tutor;
import com.zhiyixingnan.service.ITutorService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ITutorServiceImpl extends ServiceImpl<TutorDao, Tutor> implements ITutorService {

  @Autowired private TutorDao tutorDao;

  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Tutor> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(name), Tutor::getName, name);
    Tutor tutor = tutorDao.selectOne(lqw);

    if (tutor == null) {
      return false;
    }

    return password.equals(tutor.getPassword());
  }
}
