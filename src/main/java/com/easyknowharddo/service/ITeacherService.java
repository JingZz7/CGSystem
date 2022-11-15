package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Teacher;
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
   * @param : * @return List<Object>
   * @author ZJ
   * @description TODO [教师]获取账户列表(账户管理)
   * @date 2022/11/14 20:56
   */
  public List<Object> teacherGetAccountList();

  /**
   * @param id: * @return List<Object>
   * @author ZJ
   * @description TODO [教师]根据工号查询(账户管理)
   * @date 2022/11/14 20:57
   */
  public List<Object> teacherGetAccountById(String id);

  /**
   * @param name: * @return List<Object>
   * @author ZJ
   * @description TODO [教师]根据姓名查询(账户管理)
   * @date 2022/11/14 20:57
   */
  public List<Object> teacherGetAccountByName(String name);

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
   * @param problemId: * @return List<HashMap<String,String>>
   * @author ZJ
   * @description TODO [教师]查看评论(查看评论)
   * @date 2022/11/14 20:58
   */
  public List<HashMap<String, String>> teacherViewReview(String problemId);

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
   * @description TODO [教师]批量删除题目(题目管理)
   * @date 2022/11/14 23:55
   */
  public Boolean bulkDeleteProblem(List<String> ids);

  /**
   * @param difficulty: * @return List<Problem>
   * @author ZJ
   * @description TODO [教师]根据难度查询(题库管理)
   * @date 2022/11/15 0:17
   */
  public List<Problem> getListByDifficulty(String difficulty);
}
