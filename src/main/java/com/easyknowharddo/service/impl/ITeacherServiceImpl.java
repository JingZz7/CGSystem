package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.AdministratorDao;
import com.easyknowharddo.dao.CommentStudentDao;
import com.easyknowharddo.dao.ModelOutputKnowledgeDao;
import com.easyknowharddo.dao.ModelOutputScoreDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.dao.StudentDao;
import com.easyknowharddo.dao.TeacherDao;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.CommentStudent;
import com.easyknowharddo.domain.ModelOutputKnowledge;
import com.easyknowharddo.domain.ModelOutputScore;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.ITeacherService;
import com.easyknowharddo.service.utils.PageUtils;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;

@Service
public class ITeacherServiceImpl extends ServiceImpl<TeacherDao, Teacher>
        implements ITeacherService {

    @Autowired
    private TeacherDao teacherDao;
    @Autowired
    private StudentDao studentDao;
    @Autowired
    private TutorDao tutorDao;
    @Autowired
    private AdministratorDao administratorDao;
    @Autowired
    private ProblemDao problemDao;
    @Autowired
    private CommentStudentDao commentStudentDao;
    @Autowired
    private ModelOutputScoreDao modelOutputScoreDao;
    @Autowired
    private ModelOutputKnowledgeDao modelOutputKnowledgeDao;

    /**
     * @param id: * @return Student
     * @author ZJ
     * @description TODO 通过id查找单个学生，Deleted必须为0
     * @date 2022/11/28 11:58
     */
    public Student selectOneStudentByIdAndDeleted0(String id) {
        return studentDao.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 0));
    }

    /**
     * @param id: * @return Student
     * @author ZJ
     * @description TODO 通过id查找单个学生，Deleted必须为1
     * @date 2022/11/28 13:30
     */
    public Student selectOneStudentByIdAndDeleted1(String id) {
        return studentDao.selectOne(
                new LambdaQueryWrapper<Student>().eq(Student::getId, id).eq(Student::getDeleted, 1));
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
     * @param classId: a * @return List<Student>
     * @author ZJ
     * @description TODO 根据班级名查询该班学生
     * @date 2022/11/28 13:42
     */
    public List<Student> selectStudentByClassName(String classId) {
        return studentDao.selectList(
                new LambdaQueryWrapper<Student>()
                        .eq(Student::getClassId, classId)
                        .eq(Student::getDeleted, 0));
    }

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
        if (teacher == null) return false;
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
        if (teacherDao.selectOne(lambdaQueryWrapper) == null) return false;
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
        if (teacherDao.selectOne(lambdaQueryWrapper) == null) return false;
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
     * @param pageSize:    a * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]获取账户列表(账户管理)
     * @date 2022/11/16 17:13
     */
    @Override
    public PageInfo<?> teacherGetAccountList(int currentPage, int pageSize) {
        List<Student> students =
                studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
        List<Tutor> tutors = tutorDao.selectList(null);
        List<Object> objects = new ArrayList<>();
        for (Student student : students) objects.add(student);
        for (Tutor tutor : tutors) objects.add(tutor);
        return PageUtils.pageObject(objects, currentPage, pageSize);
    }

    /**
     * @param id:
     * @param currentPage:
     * @param pageSize:    a * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据工号查询(账户管理)
     * @date 2022/11/16 17:22
     */
    @Override
    public PageInfo<?> teacherGetAccountById(String id, int currentPage, int pageSize) {
        List<Object> objects = new ArrayList<>();
        if (selectOneStudentByIdAndDeleted0(id) != null) objects.add(selectOneStudentByIdAndDeleted0(id));
        if (selectOneTutorById(id) != null) objects.add(selectOneTutorById(id));
        return PageUtils.pageObject(objects, currentPage, pageSize);
    }

    /**
     * @param name:
     * @param currentPage:
     * @param pageSize:    * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据姓名查询(账户管理)
     * @date 2022/11/16 17:27
     */
    @Override
    public PageInfo<?> teacherGetAccountByName(String name, int currentPage, int pageSize) {
        List<Object> objects = new ArrayList<>();
        List<Student> students =
                studentDao.selectList(
                        new LambdaQueryWrapper<Student>()
                                .eq(Student::getDeleted, 0)
                                .and(i -> i.like(Student::getName, name)));
        if (!students.isEmpty()) for (Student student : students) objects.add(student);
        List<Tutor> tutors =
                tutorDao.selectList(new LambdaQueryWrapper<Tutor>().like(Tutor::getName, name));
        if (!tutors.isEmpty()) for (Tutor tutor : tutors) objects.add(tutor);
        return PageUtils.pageObject(objects, currentPage, pageSize);
    }

    /**
     * @param type:
     * @param currentPage:
     * @param pageSize:    * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据类型查询(账户管理)
     * @date 2022/11/17 10:17
     */
    @Override
    public PageInfo<?> teacherGetAccountByType(String type, int currentPage, int pageSize) {
        if (type.equals("student")) {
            List<Student> students =
                    studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
            return PageUtils.pageStudent(students, currentPage, pageSize);
        } else if (type.equals("tutor")) {
            List<Tutor> tutors = tutorDao.selectList(null);
            return PageUtils.pageTutor(tutors, currentPage, pageSize);
        }
        List<Object> objects = new ArrayList<>();
        List<Student> students =
                studentDao.selectList(new LambdaQueryWrapper<Student>().eq(Student::getDeleted, 0));
        List<Tutor> tutors = tutorDao.selectList(null);
        for (Student student : students) objects.add(student);
        for (Tutor tutor : tutors) objects.add(tutor);
        return PageUtils.pageObject(objects, currentPage, pageSize);
    }

    /**
     * @param type:
     * @param id:
     * @param name:
     * @param password:
     * @param email:
     * @param phone:    * @return Boolean
     * @author ZJ
     * @description TODO TODO [教师]添加账户(账户管理)
     * @date 2022/11/20 21:28
     */
    @Override
    public Boolean teacherAddAccount(
            String type, String id, String name, String password, String email, String phone) {
        if (selectOneStudentByIdAndDeleted0(id) != null || selectOneTutorById(id) != null) return false;
        if (type.equals("student")) {
            if (selectOneStudentByIdAndDeleted1(id) != null) {
                Student student = selectOneStudentByIdAndDeleted1(id);
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
                && tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) == null) return false;
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
        for (String id : ids)
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
            } else if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null)
                tutorDao.delete(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
            else return false;
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
        for (String id : ids)
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
            } else return false;
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
            if (toIndex > total) toIndex = total;
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
     * @param pageSize:    a * @return PageInfo<HashMap<String,String>>
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
            if (toIndex > total) toIndex = total;
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
     * @param pageSize:    a * @return PageInfo<Problem>
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
            if (toIndex > total) toIndex = total;
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
                == null) return false;
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
        if (ids.isEmpty()) return false;
        for (String problemId : ids) {
            if (problemDao.selectOne(
                    new LambdaQueryWrapper<Problem>()
                            .eq(Problem::getId, problemId)
                            .eq(Problem::getDeleted, 0))
                    == null) continue;
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
     * @param pageSize:    * @return PageInfo<Problem>
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
                if (toIndex > total) toIndex = total;
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
            if (toIndex > total) toIndex = total;
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
     * @param label:      * @return Boolean
     * @author ZJ
     * @description TODO [教师]编辑题目(题库管理)
     * @date 2022/11/15 17:03
     */
    @Override
    public Boolean editProblem(String id, String name, String difficulty, String label) {
        if (problemDao.selectOne(
                new LambdaQueryWrapper<Problem>().eq(Problem::getId, id).eq(Problem::getDeleted, 0))
                == null) return false;
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
                != null) return false;
        if (difficulty.length() > 1) return false;
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
        Integer[] i = new Integer[10];
        for (ModelOutputScore modelOutputScore : modelOutputScores)
            if (modelOutputScore.getExamScore().compareTo(new BigDecimal("0")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("10")) == -1) i[0]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("10")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("20")) == -1) i[1]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("20")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("30")) == -1) i[2]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("30")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("40")) == -1) i[3]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("40")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("50")) == -1) i[4]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("50")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("60")) == -1) i[5]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("60")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("70")) == -1) i[6]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("70")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("80")) == -1) i[7]++;
            else if (modelOutputScore.getExamScore().compareTo(new BigDecimal("80")) == 1
                    && modelOutputScore.getExamScore().compareTo(new BigDecimal("90")) == -1) i[8]++;
            else i[9]++;

        List<Integer> list = new ArrayList<>();
        for (Integer index : i) list.add(index);

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
        Integer[] i = new Integer[10];
        List<Student> students = new ArrayList<>();
        if (className.equals("通信一班")) students = selectStudentByClassName("080301");
        else if (className.equals("通信二班")) students = selectStudentByClassName("080302");
        else if (className.equals("通信三班")) students = selectStudentByClassName("080303");
        else if (className.equals("通信四班")) students = selectStudentByClassName("080304");

        for (Student student : students) {
            if (modelOutputScoreDao.selectOne(
                    new LambdaQueryWrapper<ModelOutputScore>()
                            .eq(ModelOutputScore::getStudentId, student.getId()))
                    == null) continue;
            BigDecimal examScore =
                    modelOutputScoreDao
                            .selectOne(
                                    new LambdaQueryWrapper<ModelOutputScore>()
                                            .eq(ModelOutputScore::getStudentId, student.getId()))
                            .getExamScore(); // student学生对应的成绩
            if (examScore.compareTo(new BigDecimal("0")) == 1
                    && examScore.compareTo(new BigDecimal("10")) == -1) i[0]++;
            else if (examScore.compareTo(new BigDecimal("10")) == 1
                    && examScore.compareTo(new BigDecimal("20")) == -1) i[1]++;
            else if (examScore.compareTo(new BigDecimal("20")) == 1
                    && examScore.compareTo(new BigDecimal("30")) == -1) i[2]++;
            else if (examScore.compareTo(new BigDecimal("30")) == 1
                    && examScore.compareTo(new BigDecimal("40")) == -1) i[3]++;
            else if (examScore.compareTo(new BigDecimal("40")) == 1
                    && examScore.compareTo(new BigDecimal("50")) == -1) i[4]++;
            else if (examScore.compareTo(new BigDecimal("50")) == 1
                    && examScore.compareTo(new BigDecimal("60")) == -1) i[5]++;
            else if (examScore.compareTo(new BigDecimal("60")) == 1
                    && examScore.compareTo(new BigDecimal("70")) == -1) i[6]++;
            else if (examScore.compareTo(new BigDecimal("70")) == 1
                    && examScore.compareTo(new BigDecimal("80")) == -1) i[7]++;
            else if (examScore.compareTo(new BigDecimal("80")) == 1
                    && examScore.compareTo(new BigDecimal("90")) == -1) i[8]++;
            else i[9]++;
        }

        List<Integer> list = new ArrayList<>();
        for (Integer index : i) list.add(index);
        return list;
    }

    /**
     * @param id: * @return List<BigDecimal>
     * @author ZJ
     * @description TODO [教师]获取学生知识点成绩扇形图
     * @date 2022/11/22 21:58
     */
    @Override
    public List<BigDecimal> getKnowledgePointGrade(String id) {
        List<ModelOutputKnowledge> modelOutputKnowledges =
                modelOutputKnowledgeDao.selectList(
                        new LambdaQueryWrapper<ModelOutputKnowledge>()
                                .eq(ModelOutputKnowledge::getStudentId, id));
        List<HashMap<String, BigDecimal>> list = new ArrayList<>();
        int[] index = new int[11];
        int i = 0;
        for (ModelOutputKnowledge modelOutputKnowledge : modelOutputKnowledges) {
            HashMap<String, BigDecimal> map = new HashMap<>();
            if (modelOutputKnowledge.getKnowledgePointId().equals("1")) {
                map.put("继承", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[10] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("2")) {
                map.put("构造函数", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[9] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("3")) {
                map.put("类与对象", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[8] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("4")) {
                map.put("结构体", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[7] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("5")) {
                map.put("指针", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[6] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("6")) {
                map.put("函数", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[5] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("7")) {
                map.put("字符串", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[4] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("8")) {
                map.put("数组", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[3] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("9")) {
                map.put("循环", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[2] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("10")) {
                map.put("控制结构", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                list.add(map);
                index[1] = i;
            } else if (modelOutputKnowledge.getKnowledgePointId().equals("11")) {
                map.put("语言基础", modelOutputKnowledge.getForecast().multiply(new BigDecimal(100)));
                index[0] = i;
                list.add(map);
            }
            ++i;
        }

        return ITeacherServiceImpl.customSortList(list, index);
    }

    /**
     * @param id:
     * @return Boolean
     * @author ZJ
     * @description TODO [教师]是否存在
     * @date 2022/12/3 19:03
     */
    @Override
    public Boolean isTeacherExist(String id) {
        if (teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted, 0)) != null) {
            return true;
        }
        return false;
    }

    /**
     * @param id:
     * @return List<HashMap < String, String>>
     * @author ZJ
     * @description TODO [教师]展示个人信息(个人中心)
     * @date 2022/12/3 19:05
     */
    @Override
    public List<HashMap<String, String>> displayPersonalInformation(String id) {
        HashMap<String, String> map = new HashMap<>();
        Teacher teacher =
                teacherDao.selectOne(new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, id).eq(Teacher::getDeleted,
                        0));
        map.put("id", id);
        map.put("name", teacher.getName());
        map.put("email", teacher.getEmail());
        map.put("phone", teacher.getPhone());
        List<HashMap<String, String>> list = new ArrayList<>();
        list.add(map);
        return list;
    }

    /**
     * @param platformDataStatistics:
     * @param index:
     * @return List<BigDecimal>
     * @author ZJ
     * @description TODO 对扇形图排序，顺序为[语言基础、控制结构、循环、数组、字符串、函数、指针、结构体、类与对象、构造函数、继承]
     * @date 2022/12/3 18:16
     */
    private static List<BigDecimal> customSortList(List<HashMap<String, BigDecimal>> platformDataStatistics,
                                                   int[] index) {
        List<BigDecimal> list = new ArrayList<BigDecimal>();
        for (int i = 0; i < 11; ++i) {
            Collection<BigDecimal> values = platformDataStatistics.get(index[i]).values();//获取一个Hashmap中的value数组
            for (BigDecimal ii : values) {
                list.add(ii);
            }
        }
        return list;
    }
}
