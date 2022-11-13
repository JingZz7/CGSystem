package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.StudentDao;
import com.zhiyixingnan.dao.TeacherDao;
import com.zhiyixingnan.dao.TutorDao;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.domain.Tutor;
import com.zhiyixingnan.service.ITeacherService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherDao, Teacher>
    implements ITeacherService {

  @Autowired private TeacherDao teacherDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TutorDao tutorDao;

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

  @Override
  public List<Object> teacherGetAccountList() {
    List<Student> students =
        studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
    List<Tutor> tutors = tutorDao.selectList(null);
    ArrayList<Object> objects = new ArrayList<>();
    for (Student student : students) {
      objects.add(student);
    }
    for (Tutor tutor : tutors) {
      objects.add(tutor);
    }

    if (objects.isEmpty()) {
      return null;
    }
    return objects;
  }

  @Override
  public List<Object> teacherGetAccountById(String id) {
    ArrayList<Object> objects = new ArrayList<>();
    if (studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
        != null) {
      objects.add(
          studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0)));
    }
    if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      objects.add(tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)));
    }

    if (objects.isEmpty()) {
      return null;
    }
    return objects;
  }
}
