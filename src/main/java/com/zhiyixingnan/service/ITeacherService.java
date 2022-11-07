package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Teacher;

public interface ITeacherService extends IService<Teacher> {

  public Boolean login(String name, String password);

  public Boolean isExistTeacher(String id, String password);

  public Boolean isTeacherPhone(String phone);

  public Boolean updatePasswordByPhone(String phone, String password);
}
