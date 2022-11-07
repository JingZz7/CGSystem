package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Student;
import java.util.List;

public interface IStudentService extends IService<Student> {

  public List<Student> getStudentByClassName(String name);

  public Student login(String id, String password);

  public Boolean register(
      String id, String name, String password, String phone, String email, String classId);

  public IPage<Student> getPage(int currentPage, int pageSize);

  public Boolean isExistStudent(String id,String password);

  public Boolean isStudentPhone(String phone);

  public Boolean updatePasswordByPhone(String phone,String password);
}
