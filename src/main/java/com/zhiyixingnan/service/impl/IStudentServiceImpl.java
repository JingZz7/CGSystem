package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.ClasssDao;
import com.zhiyixingnan.dao.CommentStudentDao;
import com.zhiyixingnan.dao.ProblemDao;
import com.zhiyixingnan.dao.StudentDao;
import com.zhiyixingnan.domain.Classs;
import com.zhiyixingnan.domain.CommentStudent;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class IStudentServiceImpl extends ServiceImpl<StudentDao, Student>
    implements IStudentService {

  @Autowired private ClasssDao classsDao;
  @Autowired private StudentDao studentDao;
  @Autowired private ProblemDao problemDao;
  @Autowired private CommentStudentDao commentStudentDao;

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

  @Override
  public IPage<Student> getPage(int currentPage, int pageSize) {
    IPage page = new Page(currentPage, pageSize);
    studentDao.selectPage(page, null);
    return page;
  }

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

  @Override
  public Boolean isStudentPhone(String phone) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getPhone, phone);
    if (studentDao.selectOne(lqw) == null) {
      return false;
    }
    return true;
  }

  @Override
  public Boolean updatePasswordByPhone(String phone, String password) {
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getPhone, phone);
    Student student = studentDao.selectOne(lqw);
    student.setPassword(password);
    studentDao.updateById(student);
    return true;
  }

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
    commentStudentDao.insert(commentStudent);
    return true;
  }

  @Override
  public List<Student> getStudentByClassName(String name) {
    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Classs::getName, name);
    Classs classs = classsDao.selectOne(lqw);

    LambdaQueryWrapper<Student> lqw1 = new LambdaQueryWrapper<>();
    return studentDao.selectList(lqw1.eq(Student::getClassId, classs.getId()));
  }
}
