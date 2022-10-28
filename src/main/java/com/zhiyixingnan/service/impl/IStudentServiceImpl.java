package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.ClasssDao;
import com.zhiyixingnan.dao.StudentDao;
import com.zhiyixingnan.domain.Classs;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IStudentServiceImpl extends ServiceImpl<StudentDao, Student>
    implements IStudentService {

  @Autowired private ClasssDao classsDao;

  @Autowired private StudentDao studentDao;

  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(name), Student::getName, name);
    Student student = studentDao.selectOne(lqw);

    if (student == null) {
      return false;
    }

    return password.equals(student.getPassword());
  }

  @Override
  public Boolean register(
      String id, String name, String password, String phone, String email, String classId) {

    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Strings.isNotEmpty(id), Student::getId, id);
    if (studentDao.selectOne(lqw) != null) {
      return false;
    }

    Student student = new Student();
    student.setId(id);
    student.setName(name);
    student.setPassword(password);
    student.setPhone(phone);
    student.setEmail(email);
    student.setClassId(classId);

    return studentDao.insert(student) > 0;
  }

  @Override
  public List<Student> getStudentByClassName(String name) {
    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Classs::getName, name);
    Classs classs = classsDao.selectOne(lqw);

    LambdaQueryWrapper<Student> lqw1 = new LambdaQueryWrapper<>();
    return studentDao.selectList(lqw1.eq(Student::getClassId, classs.getId()));
  }
}
