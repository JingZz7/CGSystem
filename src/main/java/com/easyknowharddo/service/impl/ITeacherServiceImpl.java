package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.Problem;
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
  @Autowired private ProblemDao problemDao;
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
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [教师]删除账户(账户管理)
   * @date 2022/11/15 0:33
   */
  @Override
  public Boolean deleteAccount(String id) {
    if (studentDao.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
            == null
        && tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) == null) {
      return false;
    }
    if (studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id)) != null) {
      Student student =
          studentDao.selectOne(new LambdaQueryWrapper<Student>().eq(Student::getId, id));
      student.setDeleted(1);
      studentDao.updateById(student);
      return true;
    }
    tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    return true;
  }

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量删除账户(账户管理)
   * @date 2022/11/15 16:06
   */
  @Override
  public Boolean teacherBulkDeleteAccount(List<String> ids) {
    for (String id : ids) {
      if (studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
          != null) {
        Student student =
            studentDao.selectOne(
                new LambdaQueryWrapper<Student>()
                    .eq(Student::getId, id)
                    .eq(Student::getDeleted, 0));
        student.setDeleted(1);
        studentDao.updateById(student);
      } else if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
        tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
      } else {
        return false;
      }
    }
    return true;
  }

  /**
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [教师]重置密码(账户管理)
   * @date 2022/11/15 16:18
   */
  @Override
  public Boolean teacherResetPassword(String id) {
    if (studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
        != null) {
      Student student =
          studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
      student.setPassword("123456");
      studentDao.updateById(student);
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

  /**
   * @param problemId: * @return Boolean
   * @author ZJ
   * @description TODO [教师]删除题目(题库管理)
   * @date 2022/11/14 23:34
   */
  @Override
  public Boolean deleteProblem(String problemId) {
    if (problemDao.selectOne(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, problemId)
                .eq(Problem::getDeleted, 0))
        == null) {
      return false;
    }
    Problem problem =
        problemDao.selectOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId));
    problem.setDeleted(1);
    problemDao.updateById(problem);
    return true;
  }

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量删除题目(题目管理)
   * @date 2022/11/14 23:55
   */
  @Override
  public Boolean bulkDeleteProblem(List<String> ids) {
    if (ids.isEmpty()) {
      return false;
    }
    for (String problemId : ids) {
      if (problemDao.selectOne(
              new LambdaQueryWrapper<Problem>()
                  .eq(Problem::getId, problemId)
                  .eq(Problem::getDeleted, 0))
          == null) {
        continue;
      }
      Problem problem =
          problemDao.selectOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId));
      problem.setDeleted(1);
      problemDao.updateById(problem);
    }
    return true;
  }

  /**
   * @param difficulty: * @return List<Problem>
   * @author ZJ
   * @description TODO [教师]根据难度查询(题库管理)
   * @date 2022/11/15 0:17
   */
  @Override
  public List<Problem> getListByDifficulty(String difficulty) {
    if (!difficulty.equals("all")) {
      return problemDao.selectList(
          new LambdaQueryWrapper<Problem>()
              .eq(Problem::getDifficulty, difficulty)
              .eq(Problem::getDeleted, 0));
    }
    return problemDao.selectList(new LambdaQueryWrapper<Problem>().eq(Problem::getDeleted, 0));
  }
}
