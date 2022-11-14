package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Tutor;

public interface ITutorService extends IService<Tutor> {

  public Boolean login(String name, String password);

  public Boolean isExistTutor(String id, String password);
}
