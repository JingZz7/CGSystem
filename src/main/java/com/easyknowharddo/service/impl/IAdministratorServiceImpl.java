package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.AdministratorDao;
import com.easyknowharddo.dao.ClassesDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.Classes;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.IAdministratorService;
import com.easyknowharddo.service.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class IAdministratorServiceImpl extends ServiceImpl<AdministratorDao, Administrator>
    implements IAdministratorService {

  @Autowired private AdministratorDao administratorDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TeacherDao teacherDao;
  @Autowired private TutorDao tutorDao;
  @Autowired private ClassesDao classesDao;

  /**
   * @param map:
   * @param student:
   * @param type: * @return HashMap<Object,Object>
   * @author ZJ
   * @description TODO 分页查找学生分类，仅仅为了减少单个函数代码量
   * @date 2022/11/28 10:25
   */
  public HashMap<Object, Object> getAccountByTypeStudent(
      HashMap<Object, Object> map, Student student, String type) {
    map.put("pkStudentId", student.getPkStudentId());
    map.put("id", student.getId());
    map.put("name", student.getName());
    map.put("password", student.getPassword());
    map.put("phone", student.getPhone());
    map.put("email", student.getEmail());
    map.put("classId", student.getClassId());
    map.put("deleted", student.getDeleted());
    map.put("type", type);
    return map;
  }

  /**
   * @param map:
   * @param teacher:
   * @param type: * @return HashMap<Object,Object>
   * @author ZJ
   * @description TODO 分页查找教师分类，仅仅为了减少单个函数代码量
   * @date 2022/11/28 10:26
   */
  public HashMap<Object, Object> getAccountByTypeTeacher(
      HashMap<Object, Object> map, Teacher teacher, String type) {
    map.put("pkTeacherId", teacher.getPkTeacherId());
    map.put("id", teacher.getId());
    map.put("name", teacher.getName());
    map.put("password", teacher.getPassword());
    map.put("phone", teacher.getPhone());
    map.put("email", teacher.getEmail());
    map.put("deleted", teacher.getDeleted());
    map.put("type", type);
    return map;
  }

  /**
   * @param map:
   * @param tutor:
   * @param type: * @return HashMap<Object,Object>
   * @author ZJ
   * @description TODO 分页查找助教分类，仅仅为了减少单个函数代码量
   * @date 2022/11/28 10:26
   */
  public HashMap<Object, Object> getAccountByTypeTutor(
      HashMap<Object, Object> map, Tutor tutor, String type) {
    map.put("pkTutorId", tutor.getPkTutorId());
    map.put("id", tutor.getId());
    map.put("name", tutor.getName());
    map.put("password", tutor.getPassword());
    map.put("phone", tutor.getPhone());
    map.put("email", tutor.getEmail());
    map.put("type", type);
    return map;
  }

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

    if (administrator == null) return false;

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
    if (administratorDao.selectOne(lambdaQueryWrapper) == null) return false;
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
    if (administratorDao.selectOne(lambdaQueryWrapper) == null) return false;
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
   * @param pageSize: * @return Object
   * @author ZJ
   * @description TODO [管理员]获取用户列表(账户管理)
   * @date 2022/11/17 11:13
   */
  @Override
  public Object administratorGetAccountList(int currentPage, int pageSize) {
    List<Student> students =
        studentDao.selectList(
            new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Teacher> teachers =
        teacherDao.selectList(
            new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0)); // deleted为1的表示已被逻辑删除了
    List<Tutor> tutors = tutorDao.selectList(null);
    List<HashMap<String, String>> list = new ArrayList<>();
    for (Student student : students) {
      HashMap<String, String> map = new HashMap<>();
      map.put("pkStudentId", student.getPkStudentId());
      map.put("type", "student");
      map.put("id", student.getId());
      map.put("name", student.getName());
      map.put(
          "className",
          classesDao
              .selectOne(
                  new LambdaQueryWrapper<Classes>()
                      .eq(Classes::getId, student.getClassId())
                      .eq(Classes::getDeleted, 0))
              .getName());
      map.put("phone", student.getPhone());
      map.put("email", student.getEmail());
      list.add(map);
    }
    for (Teacher teacher : teachers) {
      HashMap<String, String> map = new HashMap<>();
      map.put("pkStudentId", teacher.getPkTeacherId());
      map.put("type", "teacher");
      map.put("id", teacher.getId());
      map.put("name", teacher.getName());
      map.put("phone", teacher.getPhone());
      map.put("email", teacher.getEmail());
      list.add(map);
    }
    for (Tutor tutor : tutors) {
      HashMap<String, String> map = new HashMap<>();
      map.put("pkStudentId", tutor.getPkTutorId());
      map.put("type", "tutor");
      map.put("id", tutor.getId());
      map.put("name", tutor.getName());
      map.put("phone", tutor.getPhone());
      map.put("email", tutor.getEmail());
      list.add(map);
    }

    return list;
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
    if (type.equals("student")) {
      List<Student> students =
          studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
      List<Object> list = new ArrayList<>();
      for (Student student : students) {
        HashMap<Object, Object> map = new HashMap<>();
        map = getAccountByTypeStudent(map, student, type);
        list.add(map);
      }
      return PageUtils.pageObject(list, currentPage, pageSize);
    } else if (type.equals("teacher")) {
      List<Teacher> teachers =
          teacherDao.selectList(new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0));
      List<Object> list = new ArrayList<>();
      for (Teacher teacher : teachers) {
        HashMap<Object, Object> map = new HashMap<>();
        map = getAccountByTypeTeacher(map, teacher, type);
        list.add(map);
      }
      return PageUtils.pageObject(list, currentPage, pageSize);
    } else if (type.equals("tutor")) {
      List<Tutor> tutors = tutorDao.selectList(null);
      List<Object> list = new ArrayList<>();
      for (Tutor tutor : tutors) {
        HashMap<Object, Object> map = new HashMap<>();
        map = getAccountByTypeTutor(map, tutor, type);
        list.add(map);
      }
      return PageUtils.pageObject(list, currentPage, pageSize);
    }
    List<Object> objects = new ArrayList<>();
    List<Student> students =
        studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
    List<Teacher> teachers =
        teacherDao.selectList(new LambdaQueryWrapper<Teacher>().eq(Teacher::getDeleted, 0));
    List<Tutor> tutors = tutorDao.selectList(null);
    for (Student student : students) {
      HashMap<Object, Object> map = new HashMap<>();
      map = getAccountByTypeStudent(map, student, type);
      objects.add(map);
    }
    for (Teacher teacher : teachers) {
      HashMap<Object, Object> map = new HashMap<>();
      map = getAccountByTypeTeacher(map, teacher, type);
      objects.add(map);
    }
    for (Tutor tutor : tutors) {
      HashMap<Object, Object> map = new HashMap<>();
      map = getAccountByTypeTutor(map, tutor, type);
      objects.add(map);
    }
    return PageUtils.pageObject(objects, currentPage, pageSize);
  }

  /**
   * @param id:
   * @param password:
   * @param email:
   * @param phone:
   * @param className: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]编辑账户(账户管理)
   * @date 2022/11/21 0:01
   */
  @Override
  public Boolean editAccount(
      String id, String password, String email, String phone, String className) {

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
      student.setClassId(
          classesDao
              .selectOne(
                  new LambdaQueryWrapper<Classes>()
                      .eq(Classes::getName, className)
                      .eq(Classes::getDeleted, 0))
              .getId());
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
   * @param phone:
   * @param className: a * @return Boolean
   * @author ZJ
   * @description TODO [管理员]添加账户(账户管理)
   * @date 2022/11/21 17:01
   */
  @Override
  public Boolean addAccount(
      String type,
      String id,
      String name,
      String password,
      String email,
      String phone,
      String className) {

    if (studentDao.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
            != null
        || teacherDao.selectOne(
                new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0))
            != null
        || tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null)
      return false;

    if (type.equals("student")) {

      if (studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 1))
          != null) {
        Student student =
            studentDao.selectOne(
                new LambdaQueryWrapper<Student>()
                    .eq(Student::getId, id)
                    .eq(Student::getDeleted, 1));
        student.setName(name);
        student.setPassword(password);
        student.setEmail(email);
        student.setPhone(phone);
        student.setDeleted(0);
        student.setClassId(
            classesDao
                .selectOne(new LambdaQueryWrapper<Classes>().eq(Classes::getName, className))
                .getId());
        studentDao.updateById(student);
        return true;
      }

      Student student = new Student();
      student.setId(id);
      student.setName(name);
      student.setPassword(password);
      student.setEmail(email);
      student.setPhone(phone);
      student.setDeleted(0);
      student.setClassId(
          classesDao
              .selectOne(new LambdaQueryWrapper<Classes>().eq(Classes::getName, className))
              .getId());
      studentDao.insert(student);
      return true;
    } else if (type.equals("teacher")) {

      if (teacherDao.selectOne(
              new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 1))
          != null) {
        Teacher teacher =
            teacherDao.selectOne(
                new LambdaQueryWrapper<Teacher>()
                    .eq(Teacher::getId, id)
                    .eq(Teacher::getDeleted, 1));
        teacher.setName(name);
        teacher.setPassword(password);
        teacher.setEmail(email);
        teacher.setPhone(phone);
        teacher.setDeleted(0);
        teacherDao.updateById(teacher);
        return true;
      }

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
   * @param id: a * return Boolean
   * @author ZJ
   * @description TODO [管理员]重置密码(账户管理)
   * @date 2022/11/20 23:50
   */
  @Override
  public Boolean resetPassword(String id) {
    if (studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
        != null) {
      Student student =
          studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
      student.setPassword("123456");
      studentDao.updateById(student);
      return true;
    } else if (teacherDao.selectOne(
            new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0))
        != null) {
      Teacher teacher =
          teacherDao.selectOne(
              new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0));
      teacher.setPassword("123456");
      teacherDao.updateById(teacher);
      return true;
    } else if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
      tutor.setPassword("123456");
      tutorDao.updateById(tutor);
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

    if (student == null && teacher == null && tutor == null) return false;

    if (student != null)
      studentDao.delete(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
    else if (teacher != null)
      teacherDao.delete(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id));
    else tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
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
                  != null)) return false;

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
      if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null)
        tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    }
    return true;
  }

  /**
   * @param id: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]根据id查询账号(账户管理)
   * @date 2022/11/20 22:17
   */
  @Override
  public PageInfo<?> getAccountById(String id, int currentPage, int pageSize) {
    if (studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
        != null) {
      List<Student> students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));

      return PageUtils.pageStudent(students, currentPage, pageSize);
    }

    if (teacherDao.selectOne(
            new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0))
        != null) {
      List<Teacher> teachers =
          teacherDao.selectList(
              new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0));
      return PageUtils.pageTeacher(teachers, currentPage, pageSize);
    }

    if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      List<Tutor> tutors =
          tutorDao.selectList(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
      return PageUtils.pageTutor(tutors, currentPage, pageSize);
    }
    // 返回一个空的List ?
    return new PageInfo<List<?>>(new ArrayList<>());
  }

  /**
   * @param name:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]根据姓名查询账号(账户管理)
   * @date 2022/11/20 22:39
   */
  @Override
  public PageInfo<?> getAccountByName(String name, int currentPage, int pageSize) {
    // 模糊查询
    List<Object> objects = new ArrayList<>();
    // 查找包含name的学生
    if (studentDao.selectList(
            new LambdaQueryWrapper<Student>()
                .eq(Student::getDeleted, 0)
                .like(Student::getName, name))
        != null) {
      List<Student> students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>()
                  .eq(Student::getDeleted, 0)
                  .like(Student::getName, name));

      for (Student student : students) objects.add(student);
    }
    // 查询包含name的教师
    if (teacherDao.selectList(
            new LambdaQueryWrapper<Teacher>()
                .eq(Teacher::getDeleted, 0)
                .like(Teacher::getName, name))
        != null) {
      List<Teacher> teachers =
          teacherDao.selectList(
              new LambdaQueryWrapper<Teacher>()
                  .eq(Teacher::getDeleted, 0)
                  .like(Teacher::getName, name));

      for (Teacher teacher : teachers) objects.add(teacher);
    }
    // 查询包含name的助教
    if (tutorDao.selectList(new LambdaQueryWrapper<Tutor>().like(Tutor::getName, name)) != null) {
      List<Tutor> tutors =
          tutorDao.selectList(new LambdaQueryWrapper<Tutor>().like(Tutor::getName, name));
      for (Tutor tutor : tutors) objects.add(tutor);
    }
    // 不为空，开始分页操作
    if (!objects.isEmpty()) return PageUtils.pageObject(objects, currentPage, pageSize);
    // 如果object为空，返回一个空List
    return new PageInfo<List<?>>(new ArrayList<>());
  }

  /**
   * @param id:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]是否存在
   * @date 2022/12/3 18:45
   */
  @Override
  public Boolean isAdministratorExist(String id) {
    if (administratorDao.selectOne(
            new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id))
        != null) {
      return true;
    }
    return false;
  }

  /**
   * @param id:
   * @return List<HashMap < String, String>>
   * @author ZJ
   * @description TODO [学生]展示个人信息(个人中心)
   * @date 2022/12/3 18:29
   */
  @Override
  public List<HashMap<String, String>> displayPersonalInformation(String id) {
    HashMap<String, String> map = new HashMap<>();
    Administrator administrator =
        administratorDao.selectOne(
            new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id));
    map.put("id", id);
    map.put("name", administrator.getName());
    map.put("email", administrator.getEmail());
    map.put("phone", administrator.getPhone());
    List<HashMap<String, String>> list = new ArrayList<>();
    list.add(map);
    return list;
  }

  /**
   * @param id:
   * @param phone:
   * @param email:
   * @return Boolean
   * @author ZJ
   * @description TODO [管理员]修改电话和邮箱(个人中心)
   * @date 2022/12/4 23:32
   */
  @Override
  public Boolean modifyPhoneAndEmailById(String id, String phone, String email) {
    Boolean flag = isAdministratorExist(id);
    if (!flag) {
      return false;
    }
    Administrator administrator =
        administratorDao.selectOne(
            new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id));
    administrator.setPhone(phone);
    administrator.setEmail(email);
    administratorDao.updateById(administrator);
    return true;
  }

  /**
   * @param id:
   * @param password:
   * @return Boolean
   * @author ZJ
   * @description TODO [管理员]修改密码(个人中心)
   * @date 2022/12/4 23:45
   */
  @Override
  public Boolean modifyPasswordById(String id, String password) {
    Boolean flag = isAdministratorExist(id);
    if (!flag) {
      return false;
    }
    Administrator administrator =
        administratorDao.selectOne(
            new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id));
    administrator.setPassword(password);
    administratorDao.updateById(administrator);
    return true;
  }
}
