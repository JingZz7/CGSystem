package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.AdministratorDao;
import com.easyknowharddo.dao.ClassesDao;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.ModelOutputKnowledgeDao;
import com.easyknowharddo.dao.ModelOutputScoreDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.Classes;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.ModelOutputKnowledge;
import com.easyknowharddo.domain.ModelOutputScore;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.IStudentService;
import com.easyknowharddo.service.utils.PageUtils;
import com.easyknowharddo.utils.GetCaptcha;
import com.easyknowharddo.utils.MailUtils;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

@Service
public class IStudentServiceImpl extends ServiceImpl<StudentDao, Student>
    implements IStudentService {

  @Autowired private ClassesDao classesDao;
  @Autowired private StudentDao studentDao;
  @Autowired private TeacherDao teacherDao;
  @Autowired private TutorDao tutorDao;
  @Autowired private AdministratorDao administratorDao;
  @Autowired private ProblemDao problemDao;
  @Autowired private CommentStudentDao commentStudentDao;
  @Autowired private ModelOutputScoreDao modelOutputScoreDao;
  @Autowired private ModelOutputKnowledgeDao modelOutputKnowledgeDao;

  /**
   * @param id: * @return Student
   * @author ZJ
   * @description TODO 通过id查找单个学生，Deleted必须为0
   * @date 2022/11/28 11:58
   */
  public Student selectOneStudentByIdAndDeleted(String id) {
    return studentDao.selectOne(
        new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
  }

  /**
   * @param id: * @return Teacher
   * @author ZJ
   * @description TODO 通过id查找单个教师，Deleted必须为0
   * @date 2022/11/28 11:59
   */
  public Teacher selectOneTeacherByIdAndDeleted(String id) {
    return teacherDao.selectOne(
        new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0));
  }

  /**
   * @param id: * @return Tutor
   * @author ZJ
   * @description TODO 通过id查找单个助教
   * @date 2022/11/28 12:01
   */
  public Tutor selectOneTutorById(String id) {
    return tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
  }

  /**
   * @param id: * @return Administrator
   * @author ZJ
   * @description TODO 通过id查找单个助教管理员
   * @date 2022/11/28 12:02
   */
  public Administrator selectOneAdministratorById(String id) {
    return administratorDao.selectOne(
        new LambdaQueryWrapper<Administrator>().eq(Administrator::getId, id));
  }

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
    if (studentDao.selectOne(lqw) != null) return false;

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
    return studentDao.selectOne(lqw) != null;
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
    return studentDao.selectOne(lambdaQueryWrapper) != null;
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
    if (selectOneStudentByIdAndDeleted(studentId) == null
        || problemDao.selectOne(
                new LambdaQueryWrapper<Problem>()
                    .eq(Problem::getId, problemId)
                    .eq(Problem::getDeleted, 0))
            == null) return false;

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
    if (problems.size() > pageStart) pageResult = problems.subList(pageStart, pageEnd);
    else {
      int i = problems.size() / pageSize;
      pageResult = problems.subList(i * pageSize, pageEnd);
    }
    PageInfo pageInfo = new PageInfo(pageResult);
    BeanUtils.copyProperties(page, pageInfo);
    return pageInfo;
  }

  /**
   * @param id:
   * @param currentPage:
   * @param pageSize: * @return Object
   * @author ZJ
   * @description TODO [学生]获取题目列表(刷题推荐)
   * @date 2022/11/22 16:04
   */
  @Override
  public Object getProblemsList(String id, int currentPage, int pageSize) {
    List<ModelOutputKnowledge> list =
        modelOutputKnowledgeDao.selectList(
            new LambdaQueryWrapper<ModelOutputKnowledge>()
                .eq(ModelOutputKnowledge::getStudentId, id));
    HashMap<String, BigDecimal> map = new HashMap<>();
    for (ModelOutputKnowledge modelOutputKnowledge : list)
      map.put(modelOutputKnowledge.getKnowledgePointId(), modelOutputKnowledge.getForecast());

    List<String> arrayList = new ArrayList<>(); // 存放知识点id

    for (Map.Entry<String, BigDecimal> vo : map.entrySet()) {
      BigDecimal b = new BigDecimal("0.5");
      // forecast大于0.5
      if (vo.getValue().compareTo(b) == 1) continue;
      arrayList.add(vo.getKey());
    }

    List<Problem> problems = new ArrayList<>(); // 存放推荐题目
    int len = arrayList.size();

    for (int i = 0; i < len; ++i) {
      List<Problem> problemList =
          problemDao.selectList(
              new LambdaQueryWrapper<Problem>()
                  .eq(Problem::getKnowledgePointId, arrayList.get(i))
                  .eq(Problem::getDeleted, 0)); // 第i个知识点的所有题目集合
      for (Problem problem : problemList) problems.add(problem);
    }

    return problems;
  }

  /**
   * @param problemId:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [学生]根据id查询问题(刷题推荐)
   * @date 2022/11/15 22:37
   */
  @Override
  public PageInfo<?> getProblemById(String problemId, int currentPage, int pageSize) {
    List<Problem> problems =
        problemDao.selectList(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, problemId)
                .eq(Problem::getDeleted, 0));
    return PageUtils.pageProblem(problems, currentPage, pageSize);
  }

  /**
   * @param id:
   * @param difficulty:
   * @param currentPage:
   * @param pageSize: a * @return Object
   * @author ZJ
   * @description TODO [学生]根据难度查询(刷题推荐)
   * @date 2022/11/15 22:44
   */
  @Override
  public Object getProblemsByDifficulty(
      String id, String difficulty, int currentPage, int pageSize) {
    if (!difficulty.equals("all")) {
      List<ModelOutputKnowledge> list =
          modelOutputKnowledgeDao.selectList(
              new LambdaQueryWrapper<ModelOutputKnowledge>()
                  .eq(ModelOutputKnowledge::getStudentId, id));
      HashMap<String, BigDecimal> map = new HashMap<>();
      for (ModelOutputKnowledge modelOutputKnowledge : list)
        map.put(modelOutputKnowledge.getKnowledgePointId(), modelOutputKnowledge.getForecast());
      List<String> arrayList = new ArrayList<>(); // 存放知识点id
      for (Map.Entry<String, BigDecimal> vo : map.entrySet()) {
        BigDecimal b = new BigDecimal("0.5");
        // forecast大于0.5
        if (vo.getValue().compareTo(b) == 1) continue;
        arrayList.add(vo.getKey());
      }
      List<Problem> problems = new ArrayList<>(); // 存放推荐题目
      int len = arrayList.size();

      for (int i = 0; i < len; ++i) {
        List<Problem> problemList =
            problemDao.selectList(
                new LambdaQueryWrapper<Problem>()
                    .eq(Problem::getKnowledgePointId, arrayList.get(i))
                    .eq(Problem::getDifficulty, difficulty.charAt(0))
                    .eq(Problem::getDeleted, 0)); // 第i个知识点的所有题目集合
        for (Problem problem : problemList) problems.add(problem);
      }
      return problems;
    }
    List<ModelOutputKnowledge> list =
        modelOutputKnowledgeDao.selectList(
            new LambdaQueryWrapper<ModelOutputKnowledge>()
                .eq(ModelOutputKnowledge::getStudentId, id));
    HashMap<String, BigDecimal> map = new HashMap<>();
    for (ModelOutputKnowledge modelOutputKnowledge : list)
      map.put(modelOutputKnowledge.getKnowledgePointId(), modelOutputKnowledge.getForecast());
    List<String> arrayList = new ArrayList<>(); // 存放知识点id
    for (Map.Entry<String, BigDecimal> vo : map.entrySet()) {
      BigDecimal b = new BigDecimal("0.5");
      // forecast大于0.5
      if (vo.getValue().compareTo(b) == 1) continue;
      arrayList.add(vo.getKey());
    }
    List<Problem> problems = new ArrayList<>(); // 存放推荐题目
    int len = arrayList.size();
    for (int i = 0; i < len; ++i) {
      List<Problem> problemList =
          problemDao.selectList(
              new LambdaQueryWrapper<Problem>()
                  .eq(Problem::getKnowledgePointId, arrayList.get(i))
                  .eq(Problem::getDeleted, 0)); // 第i个知识点的所有题目集合
      for (Problem problem : problemList) problems.add(problem);
    }
    return problems;
  }

  /**
   * @param id: * @return String
   * @author ZJ
   * @description TODO 获取随机验证码(忘记密码)
   * @date 2022/11/21 14:36
   */
  @Override
  public String getCaptchaById(String id) {

    if (selectOneStudentByIdAndDeleted(id) == null
        && selectOneTeacherByIdAndDeleted(id) == null
        && selectOneTutorById(id) == null
        && selectOneAdministratorById(id) == null) return "学号错误";

    String code = new GetCaptcha().getCode(6);

    if (selectOneStudentByIdAndDeleted(id) != null)
      new MailUtils()
          .sendMail(selectOneStudentByIdAndDeleted(id).getEmail(), "验证码为：" + code, "CGSystem验证码");
    else if (selectOneTeacherByIdAndDeleted(id) != null)
      new MailUtils()
          .sendMail(selectOneTeacherByIdAndDeleted(id).getEmail(), "验证码为：" + code, "CGSystem验证码");
    else if (selectOneTutorById(id) != null)
      new MailUtils()
          .sendMail(selectOneTutorById(id).getEmail(), "验证码为：" + code, "CGSystem" + "验证码");
    else
      new MailUtils()
          .sendMail(selectOneAdministratorById(id).getEmail(), "验证码为：" + code, "CGSystem验证码");

    return code;
  }

  /**
   * @param id:
   * @param password: a * @return Boolean
   * @author ZJ
   * @description TODO 忘记密码
   * @date 2022/11/21 16:48
   */
  @Override
  public Boolean forgotPassword(String id, String password) {
    if (selectOneStudentByIdAndDeleted(id) == null
        && selectOneTeacherByIdAndDeleted(id) == null
        && selectOneTutorById(id) == null
        && selectOneAdministratorById(id) == null) return false;

    if (selectOneStudentByIdAndDeleted(id) != null) {
      Student student = selectOneStudentByIdAndDeleted(id);
      student.setPassword(password);
      studentDao.updateById(student);
      return true;
    } else if (selectOneTeacherByIdAndDeleted(id) != null) {
      Teacher teacher = selectOneTeacherByIdAndDeleted(id);
      teacher.setPassword(password);
      teacherDao.updateById(teacher);
      return true;
    } else if (selectOneTutorById(id) != null) {
      Tutor tutor = selectOneTutorById(id);
      tutor.setPassword(password);
      tutorDao.updateById(tutor);
      return true;
    } else {
      Administrator administrator = selectOneAdministratorById(id);
      administrator.setPassword(password);
      administratorDao.updateById(administrator);
      return true;
    }
  }

  /**
   * @param id: * @return BigDecimal
   * @author ZJ
   * @description TODO [学生]获取期末成绩预测
   * @date 2022/11/22 22:43
   */
  @Override
  public BigDecimal getFinalForecast(String id) {
    return modelOutputScoreDao
        .selectOne(
            new LambdaQueryWrapper<ModelOutputScore>().eq(ModelOutputScore::getStudentId, id))
        .getExamScore();
  }

  /**
   * @param id:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]是否存在
   * @date 2022/12/3 18:45
   */
  @Override
  public Boolean isStudentExist(String id) {
    if (studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0))
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
    Student student =
        studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
    map.put("id", id);
    map.put("name", student.getName());
    map.put(
        "class",
        classesDao
            .selectOne(
                new LambdaQueryWrapper<Classes>()
                    .eq(Classes::getId, student.getClassId())
                    .eq(Classes::getDeleted, 0))
            .getName());
    map.put("email", student.getEmail());
    map.put("phone", student.getPhone());
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
   * @description TODO [学生]修改电话和邮箱(个人中心)
   * @date 2022/12/4 23:32
   */
  @Override
  public Boolean modifyPhoneAndEmailById(String id, String phone, String email) {
    Boolean flag = isStudentExist(id);
    if (!flag) {
      return false;
    }
    Student student =
        studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
    student.setPhone(phone);
    student.setEmail(email);
    studentDao.updateById(student);
    return true;
  }

  /**
   * @param id:
   * @param password:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]修改密码(个人中心)
   * @date 2022/12/4 23:45
   */
  @Override
  public Boolean modifyPasswordById(String id, String password) {
    Boolean flag = isStudentExist(id);
    if (!flag) {
      return false;
    }
    Student student =
        studentDao.selectOne(
            new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
    student.setPassword(password);
    studentDao.updateById(student);
    return true;
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
