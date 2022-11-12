package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.AdministratorDao;
import com.zhiyixingnan.dao.StudentDao;
import com.zhiyixingnan.dao.TeacherDao;
import com.zhiyixingnan.dao.TutorDao;
import com.zhiyixingnan.domain.Administrator;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.domain.Teacher;
import com.zhiyixingnan.domain.Tutor;
import com.zhiyixingnan.service.IAdministratorService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class IAdministratorServiceImpl extends ServiceImpl<AdministratorDao, Administrator>
    implements IAdministratorService {

  @Autowired private AdministratorDao administratorDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TeacherDao teacherDao;
  @Autowired private TutorDao tutorDao;

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

  @Override
  public Boolean isExistAdministrator(String id, String password) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getId, id).eq(Administrator::getPassword, password);
    if (administratorDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean isAdministratorPhone(String phone) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getPhone, phone);
    if (administratorDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Administrator::getPhone, phone);
    Administrator administrator = administratorDao.selectOne(lqw);
    administrator.setPassword(password);
    administratorDao.updateById(administrator);
    return true;
  }

  @Override
  public List<Object> getList() {
    List<Student> students =
        studentDao.selectList(
            new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Teacher> teachers =
        teacherDao.selectList(
            new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Tutor> tutors = tutorDao.selectList(null);
    ArrayList<Object> objects = new ArrayList<>();
    objects.add(students);
    objects.add(teachers);
    objects.add(tutors);

    if (objects == null) {
      return null;
    }
    return objects;
  }

  @Override
  public Boolean editAccount(String id, String password, String email, String phone) {

    LambdaQueryWrapper<Student> lqw1 = new LambdaQueryWrapper<Student>().eq(Student::getId, id);
    LambdaQueryWrapper<Teacher> lqw2 = new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id);
    LambdaQueryWrapper<Tutor> lqw3 = new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id);

    Student student = studentDao.selectOne(lqw1);
    Teacher teacher = teacherDao.selectOne(lqw2);
    Tutor tutor = tutorDao.selectOne(lqw3);

    if (student != null) {
      student.setPassword(password);
      student.setEmail(email);
      student.setPhone(phone);
      studentDao.updateById(student);
      return true;
    } else if (teacher != null) {
      teacher.setPassword(password);
      teacher.setEmail(email);
      teacher.setPhone(phone);
      teacherDao.updateById(teacher);
      return true;
    } else if (tutor != null) {
      tutor.setPassword(password);
      tutor.setEmail(email);
      tutor.setPhone(phone);
      tutorDao.updateById(tutor);
      return true;
    }
    return false;
  }
}
