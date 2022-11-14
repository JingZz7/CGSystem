package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.ITeacherService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherDao, Teacher>
    implements ITeacherService {

  @Autowired private TeacherDao teacherDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TutorDao tutorDao;
  @Autowired private CommentStudentDao commentStudentDao;

  /**
   * @param name:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 验证教师
   * @date 2022/11/14 20:54
   */
  @Override
  public Boolean login(String name, String password) {
    LambdaQueryWrapper<Teacher> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Strings.isNotEmpty(name), Teacher::getName, name);
    Teacher teacher = teacherDao.selectOne(lambdaQueryWrapper);

    if (teacher == null) {
      return false;
    }

    return password.equals(teacher.getPassword());
  }

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 教师是否存在
   * @date 2022/11/14 20:55
   */
  @Override
  public Boolean isExistTeacher(String id, String password) {
    LambdaQueryWrapper<Teacher> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper
        .eq(Teacher::getDeleted, 0)
        .and(i -> i.eq(Teacher::getId, id).eq(Teacher::getPassword, password));
    if (teacherDao.selectOne(lambdaQueryWrapper) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证教师手机
   * @date 2022/11/14 20:55
   */
  @Override
  public Boolean isTeacherPhone(String phone) {
    LambdaQueryWrapper<Teacher> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Teacher::getPhone, phone);
    if (teacherDao.selectOne(lambdaQueryWrapper) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:56
   */
  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Teacher> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Teacher::getPhone, phone);
    Teacher teacher = teacherDao.selectOne(lambdaQueryWrapper);
    teacher.setPassword(password);
    teacherDao.updateById(teacher);
    return true;
  }

  /**
   * @param : * @return List<Object>
   * @author ZJ
   * @description TODO [教师]获取账户列表(账户管理)
   * @date 2022/11/14 20:56
   */
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

  /**
   * @param id: * @return List<Object>
   * @author ZJ
   * @description TODO [教师]根据工号查询(账户管理)
   * @date 2022/11/14 20:57
   */
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

  /**
   * @param name: * @return List<Object>
   * @author ZJ
   * @description TODO [教师]根据姓名查询(账户管理)
   * @date 2022/11/14 20:57
   */
  @Override
  public List<Object> teacherGetAccountByName(String name) {
    ArrayList<Object> objects = new ArrayList<>();

    List<Student> students =
        studentDao.selectList(
            new LambdaQueryWrapper<Student>()
                .eq(Student::getDeleted, 0)
                .and(i -> i.like(Student::getName, name)));
    if (!students.isEmpty()) {
      for (Student student : students) {
        objects.add(student);
      }
    }

    List<Tutor> tutors =
        tutorDao.selectList(new LambdaQueryWrapper<Tutor>().like(Tutor::getName, name));
    if (!tutors.isEmpty()) {
      for (Tutor tutor : tutors) {
        objects.add(tutor);
      }
    }

    if (objects.isEmpty()) {
      return null;
    }
    return objects;
  }

  /**
   * @param problemId: * @return List<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]查看评论(查看评论)
   * @date 2022/11/14 20:58
   */
  @Override
  public List<HashMap<String, String>> teacherViewReview(String problemId) {

    if (commentStudentDao.selectList(
            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getProblemId, problemId))
        == null) {
      return null;
    }

    List<CommentStudent> commentStudents =
        commentStudentDao.selectList(
            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getProblemId, problemId));

    ArrayList<HashMap<String, String>> list = new ArrayList<>();

    for (CommentStudent commentStudent : commentStudents) {
      /** 这里一定要创建一个新的HashMap，使用同一个map对象加入list后会被覆盖 */
      HashMap<String, String> map = new HashMap<>();
      String name =
          studentDao
              .selectOne(
                  new LambdaQueryWrapper<Student>()
                      .eq(Student::getId, commentStudent.getStudentId())
                      .eq(Student::getDeleted, 0))
              .getName();
      map.put("name", name);
      map.put("description", commentStudent.getDescription());
      map.put("time", commentStudent.getDateTime());
      list.add(map);
    }
    return list;
  }
}
