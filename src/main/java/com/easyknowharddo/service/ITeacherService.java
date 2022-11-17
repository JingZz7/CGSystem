package com.easyknowharddo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Teacher;
import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.List;

public interface ITeacherService extends IService<Teacher> {

  /**
   * @param name:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 验证教师
   * @date 2022/11/14 20:54
   */
  public Boolean login(String name, String password);

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 教师是否存在
   * @date 2022/11/14 20:55
   */
  public Boolean isExistTeacher(String id, String password);

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证教师手机
   * @date 2022/11/14 20:55
   */
  public Boolean isTeacherPhone(String phone);

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:56
   */
  public Boolean updatePasswordByPhone(String phone, String password);

  /**
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]获取账户列表(账户管理)
   * @date 2022/11/16 17:13
   */
  public PageInfo<Object> teacherGetAccountList(int currentPage, int pageSize);

  /**
   * @param id:
   * @param currentPage:
   * @param pageSize: a * @retrn PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]根据工号查询(账户管理)
   * @date 2022/11/16 17:22
   */
  public PageInfo<Object> teacherGetAccountById(String id, int currentPage, int pageSize);

  /**
   * @param name:
   * @param currentPage:
   * @param pageSize:  * @return PageInfo<Object>
   * @author ZJ
   * @description TODO [教师]根据姓名查询(账户管理)
   * @date 2022/11/16 17:27
   */
  public PageInfo<Object> teacherGetAccountByName(String name, int currentPage, int pageSize);

  /**
   * @param type:
   * @param currentPage:
   * @param pageSize:  * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据类型查询(账户管理)
   * @date 2022/11/17 10:17
   */
  public PageInfo<?> teacherGetAccountByType(String type, int currentPage, int pageSize);

  /**
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [教师]删除账户(账户管理)
   * @date 2022/11/15 0:33
   */
  public Boolean deleteAccount(String id);

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量删除账户(账户管理)
   * @date 2022/11/15 16:06
   */
  public Boolean teacherBulkDeleteAccount(List<String> ids);

  /**
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [教师]重置密码(账户管理)
   * @date 2022/11/15 16:18
   */
  public Boolean teacherResetPassword(String id);

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量重置密码(账户管理)
   * @date 2022/11/15 16:34
   */
  public Boolean teacherBulkResetPassword(List<String> ids);

  /**
   * @param problemId: * @return List<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]查看评论(查看评论)
   * @date 2022/11/14 20:58
   */
  public List<HashMap<String, String>> teacherViewReview(String problemId);

  /**
   * @param : a * return List<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]获取评论列表(查看评论)
   * @date 2022/11/15 20:13
   */
  public List<HashMap<String, String>> teacherGetReviewList();

  /**
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]获取题目列表(题库管理)
   * @date 2022/11/16 17:00
   */
  public PageInfo<Problem> getProblemList(int currentPage, int pageSize);

  /**
   * @param problemId: * @return Boolean
   * @author ZJ
   * @description TODO [教师]删除题目(题库管理)
   * @date 2022/11/14 23:34
   */
  public Boolean deleteProblem(String problemId);

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [教师]批量删除题目(题库管理)
   * @date 2022/11/14 23:55
   */
  public Boolean bulkDeleteProblem(List<String> ids);

  /**
   * @param difficulty:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]根据难度查询(题库管理)
   * @date 2022/11/16 17:03
   */
  public PageInfo<Problem> getListByDifficulty(String difficulty, int currentPage, int pageSize);

  /**
   * @param id:
   * @param name:
   * @param difficulty:
   * @param label: * @return Boolean
   * @author ZJ
   * @description TODO [教师]编辑题目(题库管理)
   * @date 2022/11/15 17:03
   */
  public Boolean editProblem(String id, String name, String difficulty, String label);
}
