package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Teacher;

public interface ITeacherService extends IService<Teacher> {

  public Boolean login(String name, String password);
}
