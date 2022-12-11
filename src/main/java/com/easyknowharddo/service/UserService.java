package com.easyknowharddo.service;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.easyknowharddo.dao.AdministratorDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserService {

  @Autowired private StudentDao studentDao;

  @Autowired private IStudentService iStudentService;

  @Autowired private TeacherDao teacherDao;

  @Autowired private ITeacherService iTeacherService;

  @Autowired private TutorDao tutorDao;

  @Autowired private ITutorService iTutorService;

  @Autowired private AdministratorDao administratorDao;

  @Autowired private IAdministratorService iAdministratorService;

  /**
   * @param id:
   * @return String
   * @author ZJ
   * @description TODO 获取密码
   * @date 2022/12/5 14:59
   */
  public String getPasswordById(String id) {
    if (iStudentService.isStudentExist(id)) {
      return studentDao
          .selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
          .getPassword();
    }
    if (iTeacherService.isTeacherExist(id)) {
      return teacherDao
          .selectOne(
              new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0))
          .getPassword();
    }
    if (iTutorService.isTutorExist(id)) {
      return tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)).getPassword();
    }
    if (iAdministratorService.isAdministratorExist(id)) {
      return administratorDao
          .selectOne(new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id))
          .getPassword();
    }
    return null;
  }
}
