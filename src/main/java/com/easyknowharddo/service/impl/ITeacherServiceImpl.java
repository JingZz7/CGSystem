package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
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
import com.github.pagehelper.Page;
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
   * @description TODO [教师]查看评论(查看评论)
   * @date 2022/11/14 20:58
   */
  @Override
  public PageInfo<HashMap<String, String>> teacherViewReview(
      String problemId, int currentPage, int pageSize) {
    List<CommentStudent> commentStudents =
        commentStudentDao.selectList(
            new LambdaQueryWrapper<CommentStudent>().eq(CommentStudent::getProblemId, problemId));
    List<HashMap<String, String>> list = new ArrayList<>();
    for (CommentStudent commentStudent : commentStudents) {
      HashMap<String, String> map = new HashMap<>();
      map.put(
          "studentName",
          studentDao
              .selectOne(
                  new LambdaQueryWrapper<Student>()
                      .eq(Student::getId, commentStudent.getStudentId()))
              .getName());
      map.put("description", commentStudent.getDescription());
      map.put("dataTime", commentStudent.getDateTime());
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
}
