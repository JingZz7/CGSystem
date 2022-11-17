package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.AdministratorDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.IAdministratorService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@Service
public class IAdministratorServiceImpl extends ServiceImpl<AdministratorDao, Administrator>
    implements IAdministratorService {

  @Autowired private AdministratorDao administratorDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TeacherDao teacherDao;
  @Autowired private TutorDao tutorDao;

  /**
   * @param name:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 登录
   * @date 2022/11/14 20:32
   */
  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Administrator> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Strings.isNotEmpty(name), Administrator::getName, name);
    Administrator administrator = administratorDao.selectOne(lambdaQueryWrapper);

    if (administrator == null) {
      return false;
    }

    return password.equals(administrator.getPassword());
  }

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 管理员是否存在
   * @date 2022/11/14 20:33
   */
  @Override
  public Boolean isExistAdministrator(String id, String password) {
    LambdaQueryWrapper<Administrator> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Administrator::getId, id).eq(Administrator::getPassword, password);
    if (administratorDao.selectOne(lambdaQueryWrapper) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证管理员手机号
   * @date 2022/11/14 20:34
   */
  @Override
  public Boolean isAdministratorPhone(String phone) {
    LambdaQueryWrapper<Administrator> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Administrator::getPhone, phone);
    if (administratorDao.selectOne(lambdaQueryWrapper) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:36
   */
  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Administrator> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Administrator::getPhone, phone);
    Administrator administrator = administratorDao.selectOne(lambdaQueryWrapper);
    administrator.setPassword(password);
    administratorDao.updateById(administrator);
    return true;
  }

  /**
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Object>
   * @author ZJ
   * @description TODO [管理员]获取用户列表(账户管理)
   * @date 2022/11/17 11:13
   */
  @Override
  public PageInfo<Object> administratorGetAccountList(int currentPage, int pageSize) {
    List<Student> students =
        studentDao.selectList(
            new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Teacher> teachers =
        teacherDao.selectList(
            new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Tutor> tutors = tutorDao.selectList(null);
    ArrayList<Object> objects = new ArrayList<>();
    for (Student student : students) {
      objects.add(student);
    }
    for (Teacher teacher : teachers) {
      objects.add(teacher);
    }
    for (Tutor tutor : tutors) {
      objects.add(tutor);
    }
    PageHelper.startPage(currentPage, pageSize);
    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
    int pageEnd = objects.size() < pageSize * currentPage ? objects.size() : pageSize * currentPage;
    List<Object> pageResult = new LinkedList<>();
    if (objects.size() > pageStart) {
      pageResult = objects.subList(pageStart, pageEnd);
    } else {
      int i = objects.size() / pageSize;
      pageResult = objects.subList(i * pageSize, pageEnd);
    }
    PageInfo<Object> pageInfo = new PageInfo<>(pageResult);
    return pageInfo;
  }

  /**
   * @param type:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]分类查找(账户管理)
   * @date 2022/11/17 11:20
   */
  @Override
  public PageInfo<?> getAccountByType(String type, int currentPage, int pageSize) {
    ArrayList<Object> objects = new ArrayList<>();
    if (type.equals("student")) {
      List<Student> students =
          studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
      PageHelper.startPage(currentPage, pageSize);
      int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
      int pageEnd =
          students.size() < pageSize * currentPage ? students.size() : pageSize * currentPage;
      List<Student> pageResult = new LinkedList<>();
      if (students.size() > pageStart) {
        pageResult = students.subList(pageStart, pageEnd);
      } else {
        int i = students.size() / pageSize;
        pageResult = students.subList(i * pageSize, pageEnd);
      }
      PageInfo<Student> pageInfo = new PageInfo<>(pageResult);
      return pageInfo;
    } else if (type.equals("teacher")) {
      List<Teacher> teachers =
          teacherDao.selectList(new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0));
      PageHelper.startPage(currentPage, pageSize);
      int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
      int pageEnd =
          teachers.size() < pageSize * currentPage ? teachers.size() : pageSize * currentPage;
      List<Teacher> pageResult = new LinkedList<>();
      if (teachers.size() > pageStart) {
        pageResult = teachers.subList(pageStart, pageEnd);
      } else {
        int i = teachers.size() / pageSize;
        pageResult = teachers.subList(i * pageSize, pageEnd);
      }
      PageInfo<Teacher> pageInfo = new PageInfo<>(pageResult);
      return pageInfo;
    } else if (type.equals("tutor")) {
      List<Tutor> tutors = tutorDao.selectList(null);
      PageHelper.startPage(currentPage, pageSize);
      int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
      int pageEnd = tutors.size() < pageSize * currentPage ? tutors.size() : pageSize * currentPage;
      List<Tutor> pageResult = new LinkedList<>();
      if (tutors.size() > pageStart) {
        pageResult = tutors.subList(pageStart, pageEnd);
      } else {
        int i = tutors.size() / pageSize;
        pageResult = tutors.subList(i * pageSize, pageEnd);
      }
      PageInfo<Tutor> pageInfo = new PageInfo<>(pageResult);
      return pageInfo;
    }
    List<Student> students =
        studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
    List<Teacher> teachers =
        teacherDao.selectList(new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0));
    List<Tutor> tutors = tutorDao.selectList(null);
    for (Student student : students) {
      objects.add(student);
    }
    for (Teacher teacher : teachers) {
      objects.add(teacher);
    }
    for (Tutor tutor : tutors) {
      objects.add(tutor);
    }
    PageHelper.startPage(currentPage, pageSize);
    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
    int pageEnd = objects.size() < pageSize * currentPage ? objects.size() : pageSize * currentPage;
    List<Object> pageResult = new LinkedList<>();
    if (objects.size() > pageStart) {
      pageResult = objects.subList(pageStart, pageEnd);
    } else {
      int i = objects.size() / pageSize;
      pageResult = objects.subList(i * pageSize, pageEnd);
    }
    PageInfo<Object> pageInfo = new PageInfo<>(pageResult);
    return pageInfo;
  }

  /**
   * @param id:
   * @param password:
   * @param email:
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]编辑账户(账户管理)
   * @date 2022/11/14 20:39
   */
  @Override
  public Boolean editAccount(String id, String password, String email, String phone) {

    LambdaQueryWrapper<Student> lambdaQueryWrapper1 =
        new LambdaQueryWrapper<Student>().eq(Student::getId, id);
    LambdaQueryWrapper<Teacher> lambdaQueryWrapper2 =
        new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id);
    LambdaQueryWrapper<Tutor> lambdaQueryWrapper3 =
        new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id);

    Student student = studentDao.selectOne(lambdaQueryWrapper1);
    Teacher teacher = teacherDao.selectOne(lambdaQueryWrapper2);
    Tutor tutor = tutorDao.selectOne(lambdaQueryWrapper3);

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

  /**
   * @param type:
   * @param id:
   * @param name:
   * @param password:
   * @param email:
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]添加账户(账户管理)
   * @date 2022/11/14 20:39
   */
  @Override
  public Boolean addAccount(
      String type, String id, String name, String password, String email, String phone) {

    if (studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id)) != null
        || teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id)) != null
        || tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      return false;
    }

    if (type.equals("student")) {
      Student student = new Student();
      student.setId(id);
      student.setName(name);
      student.setPassword(password);
      student.setEmail(email);
      student.setPhone(phone);
      student.setDeleted(0);
      student.setClassId("未分配");
      studentDao.insert(student);
      return true;
    } else if (type.equals("teacher")) {
      Teacher teacher = new Teacher();
      teacher.setId(id);
      teacher.setName(name);
      teacher.setPassword(password);
      teacher.setEmail(email);
      teacher.setPhone(phone);
      teacher.setDeleted(0);
      teacherDao.insert(teacher);
      return true;
    } else if (type.equals("tutor")) {
      Tutor tutor = new Tutor();
      tutor.setId(id);
      tutor.setName(name);
      tutor.setPassword(password);
      tutor.setEmail(email);
      tutor.setPhone(phone);
      tutorDao.insert(tutor);
      return true;
    }

    return false;
  }

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]批量重置密码(账户管理)
   * @date 2022/11/14 20:40
   */
  @Override
  public Boolean bulkResetPasswords(List<String> ids) {
    for (String id : ids) {
      if (studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id)) != null) {
        Student student =
            studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
        student.setPassword("123456");
        studentDao.updateById(student);
      }

      if (teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id)) != null) {
        Teacher teacher =
            teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id));
        teacher.setPassword("123456");
        teacherDao.updateById(teacher);
      }

      if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
        Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
        tutor.setPassword("123456");
        tutorDao.updateById(tutor);
      }
    }
    return true;
  }

  /**
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]删除账号(账户管理)
   * @date 2022/11/14 20:41
   */
  @Override
  public Boolean deleteAccount(String id) {
    Student student =
        studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
    Teacher teacher =
        teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id));
    Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));

    if (student == null && teacher == null && tutor == null) {
      return false;
    }

    if (student != null) {
      studentDao.delete(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
    } else if (teacher != null) {
      teacherDao.delete(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id));
    } else {
      tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    }
    return true;
  }

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]批量删除账号(账户管理)
   * @date 2022/11/14 20:41
   */
  @Override
  public Boolean bulkDeleteAccount(List<String> ids) {
    for (String id : ids) {
      // 三个都为空，返回false，学生的deleted已经为1或者教师的deleted已经为1，返回false
      if ((studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id)) == null
              && teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id))
                  == null
              && tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) == null)
          || (studentDao.selectOne(
                      new LambdaQueryWrapper<Student>()
                          .eq(Student::getId, id)
                          .eq(Student::getDeleted, 1))
                  != null
              || teacherDao.selectOne(
                      new LambdaQueryWrapper<Teacher>()
                          .eq(Teacher::getId, id)
                          .eq(Teacher::getDeleted, 1))
                  != null)) {
        return false;
      }

      // 学生和教师进行逻辑删除，助教进行物理删除
      if (studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id)) != null) {
        Student student =
            studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
        student.setDeleted(1);
        studentDao.updateById(student);
      }
      if (teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id)) != null) {
        Teacher teacher =
            teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id));
        teacher.setDeleted(1);
        teacherDao.updateById(teacher);
      }
      if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
        tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
      }
    }
    return true;
  }
}
