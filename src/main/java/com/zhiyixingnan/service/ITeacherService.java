package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Teacher;

import java.util.List;

public interface ITeacherService extends IService<Teacher> {

  public Boolean login(String name, String password);

  public Boolean isExistTeacher(String id, String password);

  public Boolean isTeacherPhone(String phone);

  public Boolean updatePasswordByPhone(String phone, String password);

  public List<Object> teacherGetAccountList();

  public List<Object> teacherGetAccountById(String id);
}
