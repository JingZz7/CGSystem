package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.TeacherDao;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.service.ITeacherService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherDao, Teacher>
    implements ITeacherService {

  @Autowired private TeacherDao teacherDao;

  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(name), Teacher::getName, name);
    Teacher teacher = teacherDao.selectOne(lqw);

    if (teacher == null) {
      return false;
    }

    return password.equals(teacher.getPassword());
  }

  @Override
  public Boolean isExistTeacher(String id, String password) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Teacher::getDeleted, 0)
            .and(i -> i.eq(Teacher::getId, id).eq(Teacher::getPassword, password));
    if (teacherDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean isTeacherPhone(String phone) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Teacher::getPhone, phone);
    if (teacherDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Teacher::getPhone, phone);
    Teacher teacher = teacherDao.selectOne(lqw);
    teacher.setPassword(password);
    teacherDao.updateById(teacher);
    return true;
  }
}
