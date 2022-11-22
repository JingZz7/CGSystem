package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.ModelOutputKnowledgeDao;
import com.easyknowharddo.dao.ModelOutputScoreDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.ModelOutputKnowledge;
import com.easyknowharddo.domain.ModelOutputScore;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.ITeacherService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
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
  @Autowired private ModelOutputScoreDao modelOutputScoreDao;
  @Autowired private ModelOutputKnowledgeDao modelOutputKnowledgeDao;

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
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]获取账户列表(账户管理)
   * @date 2022/11/16 17:13
   */
  @Override
  public PageInfo<Object> teacherGetAccountList(int currentPage, int pageSize) {
    List<Student> students =
        studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
    List<Tutor> tutors = tutorDao.selectList(null);
    List<Object> objects = new ArrayList<>();
    for (Student student : students) {
      objects.add(student);
    }
    for (Tutor tutor : tutors) {
      objects.add(tutor);
    }
    int total = objects.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      objects = objects.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Object> page = new Page<>(currentPage, pageSize);
    page.addAll(objects);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Object> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param id:
   * @param currentPage:
   * @param pageSize: a * @retrn PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]根据工号查询(账户管理)
   * @date 2022/11/16 17:22
   */
  @Override
  public PageInfo<Object> teacherGetAccountById(String id, int currentPage, int pageSize) {
    List<Object> objects = new ArrayList<>();
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
    int total = objects.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      objects = objects.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Object> page = new Page<>(currentPage, pageSize);
    page.addAll(objects);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Object> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param name:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]根据姓名查询(账户管理)
   * @date 2022/11/16 17:27
   */
  @Override
  public PageInfo<Object> teacherGetAccountByName(String name, int currentPage, int pageSize) {
    List<Object> objects = new ArrayList<>();
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
    int total = objects.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      objects = objects.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Object> page = new Page<>(currentPage, pageSize);
    page.addAll(objects);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Object> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param type:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据类型查询(账户管理)
   * @date 2022/11/17 10:17
   */
  @Override
  public PageInfo<?> teacherGetAccountByType(String type, int currentPage, int pageSize) {
    if (type.equals("student")) {
      List<Student> students =
          studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
      int total = students.size();
      if (total > pageSize) {
        int toIndex = pageSize * currentPage;
        if (toIndex > total) {
          toIndex = total;
        }
        students = students.subList(pageSize * (currentPage - 1), toIndex);
      }
      com.github.pagehelper.Page<Student> page = new Page<>(currentPage, pageSize);
      page.addAll(students);
      page.setPages((total + pageSize - 1) / pageSize);
      page.setTotal(total);

      PageInfo<Student> pageInfo = new PageInfo<>(page);
      return pageInfo;
    } else if (type.equals("tutor")) {
      List<Tutor> tutors = tutorDao.selectList(null);
      int total = tutors.size();
      if (total > pageSize) {
        int toIndex = pageSize * currentPage;
        if (toIndex > total) {
          toIndex = total;
        }
        tutors = tutors.subList(pageSize * (currentPage - 1), toIndex);
      }
      com.github.pagehelper.Page<Tutor> page = new Page<>(currentPage, pageSize);
      page.addAll(tutors);
      page.setPages((total + pageSize - 1) / pageSize);
      page.setTotal(total);

      PageInfo<Tutor> pageInfo = new PageInfo<>(page);
      return pageInfo;
    }
    List<Object> objects = new ArrayList<>();
    List<Student> students =
        studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
    List<Tutor> tutors = tutorDao.selectList(null);
    for (Student student : students) {
      objects.add(student);
    }
    for (Tutor tutor : tutors) {
      objects.add(tutor);
    }
    int total = objects.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      objects = objects.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Object> page = new Page<>(currentPage, pageSize);
    page.addAll(objects);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Object> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param type:
   * @param id:
   * @param name:
   * @param password:
   * @param email:
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO TODO [教师]添加账户(账户管理)
   * @date 2022/11/20 21:28
   */
  @Override
  public Boolean teacherAddAccount(
      String type, String id, String name, String password, String email, String phone) {
    if (studentDao.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
            != null
        || tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      return false;
    }

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
      student.setClassId("未分配");
      studentDao.insert(student);
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
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量重置密码(账户管理)
   * @date 2022/11/15 16:34
   */
  @Override
  public Boolean teacherBulkResetPassword(List<String> ids) {
    for (String id : ids) {
      if (studentDao.selectOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
          != null) {
        Student student =
            studentDao.selectOne(
                new LambdaQueryWrapper<Student>()
                    .eq(Student::getId, id)
                    .eq(Student::getDeleted, 0));
        student.setPassword("123456");
        studentDao.updateById(student);
      } else if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
        Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
        tutor.setPassword("123456");
        tutorDao.updateById(tutor);
      } else {
        return false;
      }
    }
    return true;
  }

  /**
   * @param problemId: * @return PageInfo<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]根据问题id搜索评论(查看评论)
   * @date 2022/11/14 20:58
   */
  @Override
  public PageInfo<HashMap<String, String>> teacherGetReviewByProblemId(
      String problemId, int currentPage, int pageSize) {

    List<CommentStudent> commentStudents =
        commentStudentDao.selectList(
            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getProblemId, problemId));
    List<HashMap<String, String>> list = new ArrayList<>();
    for (CommentStudent commentStudent : commentStudents) {
      HashMap<String, String> map = new HashMap<>();
      map.put("id", commentStudent.getPkCommentStudentId());
      map.put("problemId", problemId);
      map.put(
          "name",
          problemDao
              .selectOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId))
              .getName());
      map.put("studentId", commentStudent.getStudentId());
      map.put(
          "difficulty",
          String.valueOf(
              problemDao
                  .selectOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId))
                  .getDifficulty()));
      map.put(
          "label",
          problemDao
              .selectOne(new LambdaQueryWrapper<Problem>().eq(Problem::getId, problemId))
              .getLabel());
      map.put("dateTime", commentStudent.getDateTime());
      list.add(map);
    }
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<HashMap<String, String>> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<HashMap<String, String>> pageInfo = new PageInfo<>(page);
    return pageInfo;

    //    List<CommentStudent> commentStudents =
    //        commentStudentDao.selectList(
    //            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getProblemId,
    // problemId));
    //    List<HashMap<String, String>> list = new ArrayList<>();
    //    for (CommentStudent commentStudent : commentStudents) {
    //      HashMap<String, String> map = new HashMap<>();
    //      map.put(
    //          "studentName",
    //          studentDao
    //              .selectOne(
    //                  new LambdaQueryWrapper<Student>()
    //                      .eq(Student::getId, commentStudent.getStudentId()))
    //              .getName());
    //      map.put("description", commentStudent.getDescription());
    //      map.put("dataTime", commentStudent.getDateTime());
    //      list.add(map);
    //    }
    //    int total = list.size();
    //    if (total > pageSize) {
    //      int toIndex = pageSize * currentPage;
    //      if (toIndex > total) {
    //        toIndex = total;
    //      }
    //      list = list.subList(pageSize * (currentPage - 1), toIndex);
    //    }
    //    com.github.pagehelper.Page<HashMap<String, String>> page = new Page<>(currentPage,
    // pageSize);
    //    page.addAll(list);
    //    page.setPages((total + pageSize - 1) / pageSize);
    //    page.setTotal(total);
    //
    //    PageInfo<HashMap<String, String>> pageInfo = new PageInfo<>(page);
    //    return pageInfo;
  }

  /**
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]获取评论列表(查看评论)
   * @date 2022/11/17 10:39
   */
  @Override
  public PageInfo<HashMap<String, String>> teacherGetReviewList(int currentPage, int pageSize) {
    List<HashMap<String, String>> objects = new ArrayList<>();
    List<CommentStudent> commentStudents = commentStudentDao.selectList(null);
    for (CommentStudent commentStudent : commentStudents) {
      HashMap<String, String> map = new HashMap<>();
      String problemId = commentStudent.getProblemId();
      map.put("id", commentStudent.getPkCommentStudentId());
      map.put("dateTime", commentStudent.getDateTime());
      map.put("problemId", problemId);
      map.put("studentId", commentStudent.getStudentId());
      Problem problem =
          problemDao.selectOne(
              new LambdaQueryWrapper<Problem>()
                  .eq(Problem::getId, problemId)
                  .eq(Problem::getDeleted, 0));
      map.put("name", problem.getName());
      map.put("difficulty", String.valueOf(problem.getDifficulty()));
      map.put("chapter", problem.getKnowledgePointId());
      map.put("label", problem.getLabel());
      objects.add(map);
    }
    int total = objects.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      objects = objects.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<HashMap<String, String>> page = new Page<>(currentPage, pageSize);
    page.addAll(objects);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<HashMap<String, String>> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param id: * @return List<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]查看具体评论信息(查看评论)
   * @date 2022/11/20 20:29
   */
  @Override
  public List<HashMap<String, String>> teacherViewDetailReview(String id) {
    CommentStudent commentStudent =
        commentStudentDao.selectOne(
            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getPkCommentStudentId, id));
    HashMap<String, String> map = new HashMap<>();
    map.put("description", commentStudent.getDescription());
    List<HashMap<String, String>> list = new ArrayList<>();
    list.add(map);
    return list;
  }

  /**
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]获取题目列表(题库管理)
   * @date 2022/11/16 16:20
   */
  @Override
  public PageInfo<Problem> getProblemList(int currentPage, int pageSize) {
    List<Problem> problems =
        problemDao.selectList(new LambdaQueryWrapper<Problem>().eq(Problem::getDeleted, 0));
    int total = problems.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      problems = problems.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Problem> page = new Page<>(currentPage, pageSize);
    page.addAll(problems);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Problem> pageInfo = new PageInfo<>(page);
    return pageInfo;
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
   * @param difficulty:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]根据难度查询(题库管理)
   * @date 2022/11/16 17:03
   */
  @Override
  public PageInfo<Problem> getListByDifficulty(String difficulty, int currentPage, int pageSize) {
    if (!difficulty.equals("all")) {
      List<Problem> problems =
          problemDao.selectList(
              new LambdaQueryWrapper<Problem>()
                  .eq(Problem::getDifficulty, difficulty)
                  .eq(Problem::getDeleted, 0));
      int total = problems.size();
      if (total > pageSize) {
        int toIndex = pageSize * currentPage;
        if (toIndex > total) {
          toIndex = total;
        }
        problems = problems.subList(pageSize * (currentPage - 1), toIndex);
      }
      com.github.pagehelper.Page<Problem> page = new Page<>(currentPage, pageSize);
      page.addAll(problems);
      page.setPages((total + pageSize - 1) / pageSize);
      page.setTotal(total);

      PageInfo<Problem> pageInfo = new PageInfo<>(page);
      return pageInfo;
    }
    List<Problem> problems =
        problemDao.selectList(new LambdaQueryWrapper<Problem>().eq(Problem::getDeleted, 0));
    int total = problems.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      problems = problems.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Problem> page = new Page<>(currentPage, pageSize);
    page.addAll(problems);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Problem> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param id:
   * @param name:
   * @param difficulty:
   * @param label: * @return Boolean
   * @author ZJ
   * @description TODO [教师]编辑题目(题库管理)
   * @date 2022/11/15 17:03
   */
  @Override
  public Boolean editProblem(String id, String name, String difficulty, String label) {
    if (problemDao.selectOne(
            new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 0))
        == null) {
      return false;
    }
    Problem problem =
        problemDao.selectOne(
            new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 0));
    problem.setLabel(label);
    problem.setDifficulty(difficulty.charAt(0));
    problem.setName(name);
    problemDao.updateById(problem);
    return true;
  }

  /**
   * @param id:
   * @param name:
   * @param label:
   * @param difficulty: * @return Boolean
   * @author ZJ
   * @description TODO [教师]添加题目
   * @date 2022/11/20 21:06
   */
  @Override
  public Boolean addProblem(String id, String name, String label, String difficulty) {
    if (problemDao.selectOne(
            new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 0))
        != null) {
      return false;
    }
    if (difficulty.length() > 1) {
      return false;
    }
    if (problemDao.selectOne(
            new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 1))
        != null) {
      Problem problem =
          problemDao.selectOne(
              new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 1));
      problem.setName(name);
      problem.setLabel(label);
      problem.setDifficulty(difficulty.charAt(0));
      problem.setKnowledgePointId("x");
      problem.setDeleted(0);
      problemDao.updateById(problem);
      return true;
    }
    Problem problem = new Problem();
    problem.setId(id);
    problem.setDeleted(0);
    problem.setName(name);
    problem.setLabel(label);
    problem.setDifficulty(difficulty.charAt(0));
    problem.setKnowledgePointId("x");
    problemDao.insert(problem);
    return true;
  }

  @Override
  public List<Integer> gradeDistribution() {
    List<ModelOutputScore> modelOutputScores = modelOutputScoreDao.selectList(null);
    int total1 = 0;
    int total2 = 0;
    int total3 = 0;
    int total4 = 0;
    int total5 = 0;
    int total6 = 0;
    int total7 = 0;
    int total8 = 0;
    int total9 = 0;
    int total10 = 0;
    for (ModelOutputScore modelOutputScore : modelOutputScores) {
      if (modelOutputScore.getExamScore().compareTo(new BigDecimal("0")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("10")) == -1) {
        total1++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("10")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("20")) == -1) {
        total2++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("20")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("30")) == -1) {
        total3++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("30")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("40")) == -1) {
        total4++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("40")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("50")) == -1) {
        total5++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("50")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("60")) == -1) {
        total6++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("60")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("70")) == -1) {
        total7++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("70")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("80")) == -1) {
        total8++;
      } else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("80")) == 1
          && modelOutputScore.getExamScore().compareTo(new BigDecimal("90")) == -1) {
        total9++;
      } else {
        total10++;
      }
    }

    List<Integer> list = new ArrayList<>();
    list.add(total1);
    list.add(total2);
    list.add(total3);
    list.add(total4);
    list.add(total5);
    list.add(total6);
    list.add(total7);
    list.add(total8);
    list.add(total9);
    list.add(total10);

    return list;
  }

  /**
   * @param className: * @return List<Integer>
   * @author ZJ
   * @description TODO [教师]根据班级获取成绩分布
   * @date 2022/11/22 21:30
   */
  @Override
  public List<Integer> gradeDistributionByClass(String className) {
    int total1 = 0;
    int total2 = 0;
    int total3 = 0;
    int total4 = 0;
    int total5 = 0;
    int total6 = 0;
    int total7 = 0;
    int total8 = 0;
    int total9 = 0;
    int total10 = 0;
    List<Student> students = new ArrayList<>();
    if (className.equals("通信一班")) {
      students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>()
                  .eq(Student::getClassId, "080301")
                  .eq(Student::getDeleted, 0));
    } else if (className.equals("通信二班")) {
      students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>()
                  .eq(Student::getClassId, "080302")
                  .eq(Student::getDeleted, 0));
    } else if (className.equals("通信三班")) {
      students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>()
                  .eq(Student::getClassId, "080303")
                  .eq(Student::getDeleted, 0));
    } else if (className.equals("通信四班")) {
      students =
          studentDao.selectList(
              new LambdaQueryWrapper<Student>()
                  .eq(Student::getClassId, "080304")
                  .eq(Student::getDeleted, 0));
    }

    for (Student student : students) {
      if (modelOutputScoreDao.selectOne(
              new LambdaQueryWrapper<ModelOutputScore>()
                  .eq(ModelOutputScore::getStudentId, student.getId()))
          == null) {
        continue;
      }
      BigDecimal examScore =
          modelOutputScoreDao
              .selectOne(
                  new LambdaQueryWrapper<ModelOutputScore>()
                      .eq(ModelOutputScore::getStudentId, student.getId()))
              .getExamScore(); // student学生对应的成绩
      if (examScore.compareTo(new BigDecimal("0")) == 1
          && examScore.compareTo(new BigDecimal("10")) == -1) {
        total1++;
      } else if (examScore.compareTo(new BigDecimal("10")) == 1
          && examScore.compareTo(new BigDecimal("20")) == -1) {
        total2++;
      } else if (examScore.compareTo(new BigDecimal("20")) == 1
          && examScore.compareTo(new BigDecimal("30")) == -1) {
        total3++;
      } else if (examScore.compareTo(new BigDecimal("30")) == 1
          && examScore.compareTo(new BigDecimal("40")) == -1) {
        total4++;
      } else if (examScore.compareTo(new BigDecimal("40")) == 1
          && examScore.compareTo(new BigDecimal("50")) == -1) {
        total5++;
      } else if (examScore.compareTo(new BigDecimal("50")) == 1
          && examScore.compareTo(new BigDecimal("60")) == -1) {
        total6++;
      } else if (examScore.compareTo(new BigDecimal("60")) == 1
          && examScore.compareTo(new BigDecimal("70")) == -1) {
        total7++;
      } else if (examScore.compareTo(new BigDecimal("70")) == 1
          && examScore.compareTo(new BigDecimal("80")) == -1) {
        total8++;
      } else if (examScore.compareTo(new BigDecimal("80")) == 1
          && examScore.compareTo(new BigDecimal("90")) == -1) {
        total9++;
      } else {
        total10++;
      }
    }

    List<Integer> list = new ArrayList<>();
    list.add(total1);
    list.add(total2);
    list.add(total3);
    list.add(total4);
    list.add(total5);
    list.add(total6);
    list.add(total7);
    list.add(total8);
    list.add(total9);
    list.add(total10);
    return list;
  }

  /**
   * @param id: * @return List<Object>
   * @author ZJ
   * @description TODO [教师]获取学生知识点成绩扇形图
   * @date 2022/11/22 21:58
   */
  @Override
  public List<Object> getKnowledgePointGrade(String id) {
    List<ModelOutputKnowledge> modelOutputKnowledges =
        modelOutputKnowledgeDao.selectList(
            new LambdaQueryWrapper<ModelOutputKnowledge>()
                .eq(ModelOutputKnowledge::getStudentId, id));
    List<Object> list = new ArrayList<>();
    for (ModelOutputKnowledge modelOutputKnowledge : modelOutputKnowledges) {
      HashMap<Object, Object> map = new HashMap<>();
      if (modelOutputKnowledge.getKnowledgePointId().equals("1")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "继承");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("2")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "构造函数");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("3")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "类与对象");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("4")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "结构体");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("5")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "指针");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("6")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "函数");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("7")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "字符串");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("8")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "数组");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("9")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "循环");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("10")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "控制结构");
        list.add(map);
      } else if (modelOutputKnowledge.getKnowledgePointId().equals("11")) {
        map.put("value", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
        map.put("name", "语言基础");
        list.add(map);
      }
    }

    return list;
  }
}
