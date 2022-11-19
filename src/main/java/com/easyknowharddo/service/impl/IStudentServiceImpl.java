package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ClassesDao;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.domain.Classes;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.service.IStudentService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;

@Service
public class IStudentServiceImpl extends ServiceImpl<StudentDao, Student>
    implements IStudentService {

  @Autowired private ClassesDao classesDao;
  @Autowired private StudentDao studentDao;
  @Autowired private ProblemDao problemDao;
  @Autowired private CommentStudentDao commentStudentDao;

  /**
   * @param id:
   * @param password: * @return Student
   * @author ZJ
   * @description TODO 验证学生
   * @date 2022/11/14 20:49
   */
  @Override
  public Student login(String id, String password) {
    //    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    //    lqw.eq(Strings.isNotEmpty(name), Student::getName, name);
    //    Student student = studentDao.selectOne(lqw);
    //    if (student == null) {
    //      return false;
    //    }
    //    return password.equals(student.getPassword());

    return studentDao.getResultByIdAndPassword(id, password);
  }

  /**
   * @param id:
   * @param name:
   * @param password:
   * @param phone:
   * @param email:
   * @param classId: * @return Boolean
   * @author ZJ
   * @description TODO 注册
   * @date 2022/11/14 20:50
   */
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

  /**
   * @param currentPage:
   * @param pageSize: * @return IPage<Student>
   * @author ZJ
   * @description TODO 分页测试
   * @date 2022/11/14 20:52
   */
  @Override
  public IPage<Student> getPage(int currentPage, int pageSize) {
    IPage page = new Page(currentPage, pageSize);
    studentDao.selectPage(page, null);
    return page;
  }

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 学生是否存在
   * @date 2022/11/14 20:50
   */
  @Override
  public Boolean isExistStudent(String id, String password) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getDeleted, 0)
        .and(i -> i.eq(Student::getId, id).eq(Student::getPassword, password));
    if (studentDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证学生手机
   * @date 2022/11/14 20:52
   */
  @Override
  public Boolean isStudentPhone(String phone) {
    LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Student::getPhone, phone);
    if (studentDao.selectOne(lambdaQueryWrapper) == null) {
      return false;
    }
    return true;
  }

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:52
   */
  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Student> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Student::getPhone, phone);
    Student student = studentDao.selectOne(lambdaQueryWrapper);
    student.setPassword(password);
    studentDao.updateById(student);
    return true;
  }

  /**
   * @param studentId:
   * @param problemId:
   * @param description: * @return Boolean
   * @author ZJ
   * @description TODO [学生]评论
   * @date 2022/11/14 20:52
   */
  @Override
  public Boolean studentComment(String studentId, String problemId, String description) {

    if (studentDao.selectOne(
                new LambdaQueryWrapper<Student>()
                    .eq(Student::getId, studentId)
                    .eq(Student::getDeleted, 0))
            == null
        || problemDao.selectOne(
                new LambdaQueryWrapper<Problem>()
                    .eq(Problem::getId, problemId)
                    .eq(Problem::getDeleted, 0))
            == null) {
      return false;
    }

    CommentStudent commentStudent = new CommentStudent();
    commentStudent.setStudentId(studentId);
    commentStudent.setProblemId(problemId);
    commentStudent.setDescription(description);
    DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    java.util.Date date = new Date();
    String dateTime = df.format(date);
    commentStudent.setDateTime(dateTime);
    commentStudentDao.insert(commentStudent);
    return true;
  }

  /**
   * @param currentPage:
   * @param pageSize: * @return IPage<Problem>
   * @author ZJ
   * @description TODO [学生]获取题目列表
   * @date 2022/11/15 20:53
   */
  @Override
  public PageInfo<Problem> getProblemList(int currentPage, int pageSize) {
    PageHelper.startPage(currentPage, pageSize);
    List<Problem> problems =
        problemDao.selectList(new LambdaQueryWrapper<Problem>().eq(Problem::getDeleted, 0));
    PageInfo<Problem> page = new PageInfo<>(problems);
    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
    int pageEnd =
        problems.size() < pageSize * currentPage ? problems.size() : pageSize * currentPage;
    List<Problem> pageResult = new LinkedList<>();
    if (problems.size() > pageStart) {
      pageResult = problems.subList(pageStart, pageEnd);
    } else {
      int i = problems.size() / pageSize;
      pageResult = problems.subList(i * pageSize, pageEnd);
    }
    PageInfo pageInfo = new PageInfo(pageResult);
    BeanUtils.copyProperties(page, pageInfo);
    return pageInfo;
  }

  /**
   * @param problemId:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [学生]根据id查询问题(刷题推荐)
   * @date 2022/11/15 22:37
   */
  @Override
  public PageInfo<Problem> getProblemById(String problemId, int currentPage, int pageSize) {
    List<Problem> problems =
        problemDao.selectList(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, problemId)
                .eq(Problem::getDeleted, 0));
    int total = problems.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) {
        toIndex = total;
      }
      problems = problems.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Problem> page =
        new com.github.pagehelper.Page<>(currentPage, pageSize);
    page.addAll(problems);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Problem> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param difficulty:
   * @param currentPage:
   * @param pageSize: a * @return IPage<Problem>
   * @author ZJ
   * @description TODO [学生]根据难度查询(刷题推荐)
   * @date 2022/11/15 22:44
   */
  @Override
  public PageInfo<Problem> getProblemsByDifficulty(
      String difficulty, int currentPage, int pageSize) {
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
      com.github.pagehelper.Page<Problem> page =
          new com.github.pagehelper.Page<>(currentPage, pageSize);
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
    com.github.pagehelper.Page<Problem> page =
        new com.github.pagehelper.Page<>(currentPage, pageSize);
    page.addAll(problems);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Problem> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param name: * @return List<Student>
   * @author ZJ
   * @description TODO 测试
   * @date 2022/11/14 20:53
   */
  @Override
  public List<Student> getStudentByClassName(String name) {
    LambdaQueryWrapper<Classes> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Classes::getName, name);
    Classes classes = classesDao.selectOne(lambdaQueryWrapper);

    LambdaQueryWrapper<Student> lqw1 = new LambdaQueryWrapper<>();
    return studentDao.selectList(lqw1.eq(Student::getClassId, classes.getId()));
  }
}
