package com.easyknowharddo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.github.pagehelper.PageInfo;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;

public interface IStudentService extends IService<Student> {

  /**
   * @param name: * @return List<Student>
   * @author ZJ
   * @description TODO 测试
   * @date 2022/11/14 20:53
   */
  public List<Student> getStudentByClassName(String name);

  /**
   * @param id:
   * @param password: * @return Student
   * @author ZJ
   * @description TODO 验证学生
   * @date 2022/11/14 20:49
   */
  public Student login(String id, String password);

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
  public Boolean register(
      String id, String name, String password, String phone, String email, String classId);

  /**
   * @param currentPage:
   * @param pageSize: * @return IPage<Student>
   * @author ZJ
   * @description TODO 分页测试
   * @date 2022/11/14 20:52
   */
  public IPage<Student> getPage(int currentPage, int pageSize);

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 学生是否存在
   * @date 2022/11/14 20:50
   */
  public Boolean isExistStudent(String id, String password);

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证学生手机
   * @date 2022/11/14 20:52
   */
  public Boolean isStudentPhone(String phone);

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:52
   */
  public Boolean updatePasswordByPhone(String phone, String password);

  /**
   * @param studentId:
   * @param problemId:
   * @param description: * @return Boolean
   * @author ZJ
   * @description TODO [学生]评论
   * @date 2022/11/14 20:52
   */
  public Boolean studentComment(String studentId, String problemId, String description);

  /**
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [学生]获取题目列表
   * @date 2022/11/15 20:53
   */
  public PageInfo<Problem> getProblemList(int currentPage, int pageSize);

  /**
   * @param id:
   * @param currentPage:
   * @param pageSize: * @return Object
   * @author ZJ
   * @description TODO [学生]获取题目列表(刷题推荐)
   * @date 2022/11/22 16:04
   */
  public Object getProblemsList(String id, int currentPage, int pageSize);

  /**
   * @param problemId:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [学生]根据id查询问题(刷题推荐)
   * @date 2022/11/15 22:37
   */
  public PageInfo<?> getProblemById(String problemId, int currentPage, int pageSize);

  /**
   * @param id:
   * @param difficulty:
   * @param currentPage:
   * @param pageSize: a * @return Object
   * @author ZJ
   * @description TODO [学生]根据难度查询(刷题推荐)
   * @date 2022/11/15 22:44
   */
  public Object getProblemsByDifficulty(
      String id, String difficulty, int currentPage, int pageSize);

  /**
   * @param id: * @return String
   * @author ZJ
   * @description TODO 获取随机验证码(忘记密码)
   * @date 2022/11/21 14:36
   */
  public String getCaptchaById(String id);

  /**
   * @param id:
   * @param password: a * @return Boolean
   * @author ZJ
   * @description TODO 忘记密码
   * @date 2022/11/21 16:48
   */
  public Boolean forgotPassword(String id, String password);

  /**
   * @param id: * @return BigDecimal
   * @author ZJ
   * @description TODO [学生]获取期末成绩预测
   * @date 2022/11/22 22:43
   */
  public BigDecimal getFinalForecast(String id);

  /**
   * @param id:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]是否存在
   * @date 2022/12/3 18:45
   */
  public Boolean isStudentExist(String id);

  /**
   * @param id:
   * @return List<HashMap < String, String>>
   * @author ZJ
   * @description TODO [学生]展示个人信息(个人中心)
   * @date 2022/12/3 18:29
   */
  public List<HashMap<String, String>> displayPersonalInformation(String id);

  /**
   * @param id:
   * @param phone:
   * @param email:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]修改电话和邮箱(个人中心)
   * @date 2022/12/4 23:32
   */
  public Boolean modifyPhoneAndEmailById(String id, String phone, String email);

  /**
   * @param id:
   * @param password:
   * @return Boolean
   * @author ZJ
   * @description TODO [学生]修改密码(个人中心)
   * @date 2022/12/4 23:45
   */
  public Boolean modifyPasswordById(String id, String password);
}
