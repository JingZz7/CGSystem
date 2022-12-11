package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Administrator;
import com.github.pagehelper.PageInfo;
import java.util.HashMap;
import java.util.List;

public interface IAdministratorService extends IService<Administrator> {

  /**
   * @param name:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 登录
   * @date 2022/11/14 20:32
   */
  public Boolean login(String name, String password);

  /**
   * @param id:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 管理员是否存在
   * @date 2022/11/14 20:33
   */
  public Boolean isExistAdministrator(String id, String password);

  /**
   * @param phone: * @return Boolean
   * @author ZJ
   * @description TODO 验证管理员手机号
   * @date 2022/11/14 20:34
   */
  public Boolean isAdministratorPhone(String phone);

  /**
   * @param phone:
   * @param password: * @return Boolean
   * @author ZJ
   * @description TODO 更新密码
   * @date 2022/11/14 20:36
   */
  public Boolean updatePasswordByPhone(String phone, String password);

  /**
   * @param currentPage:
   * @param pageSize: * @return Object
   * @author ZJ
   * @description TODO [管理员]获取用户列表(账户管理)
   * @date 2022/11/17 11:13
   */
  public Object administratorGetAccountList(int currentPage, int pageSize);

  /**
   * @param type:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]分类查找(账户管理)
   * @date 2022/11/17 11:20
   */
  public PageInfo<?> getAccountByType(String type, int currentPage, int pageSize);

  /**
   * @param id:
   * @param password:
   * @param email:
   * @param phone:
   * @param className: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]编辑账户(账户管理)
   * @date 2022/11/21 0:01
   */
  public Boolean editAccount(
      String id, String password, String email, String phone, String className);

  /**
   * @param type:
   * @param id:
   * @param name:
   * @param password:
   * @param email:
   * @param phone:
   * @param className: a * @return Boolean
   * @author ZJ
   * @description TODO [管理员]添加账户(账户管理)
   * @date 2022/11/21 17:01
   */
  public Boolean addAccount(
      String type,
      String id,
      String name,
      String password,
      String email,
      String phone,
      String className);

  /**
   * @param id: a * return Boolean
   * @author ZJ
   * @description TODO [管理员]重置密码(账户管理)
   * @date 2022/11/20 23:50
   */
  public Boolean resetPassword(String id);

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]批量重置密码(账户管理)
   * @date 2022/11/14 20:40
   */
  public Boolean bulkResetPasswords(List<String> ids);

  /**
   * @param id: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]删除账号(账户管理)
   * @date 2022/11/14 20:41
   */
  public Boolean deleteAccount(String id);

  /**
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [管理员]批量删除账号(账户管理)
   * @date 2022/11/14 20:41
   */
  public Boolean bulkDeleteAccount(List<String> ids);

  /**
   * @param id: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]根据id查询账号(账户管理)
   * @date 2022/11/20 22:17
   */
  public PageInfo<?> getAccountById(String id, int currentPage, int pageSize);

  /**
   * @param name:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<?>
   * @author ZJ
   * @description TODO [管理员]根据姓名查询账号(账户管理)
   * @date 2022/11/20 22:39
   */
  public PageInfo<?> getAccountByName(String name, int currentPage, int pageSize);

  /**
   * @param id:
   * @return Boolean
   * @author ZJ
   * @description TODO [管理员]是否存在
   * @date 2022/12/3 18:45
   */
  public Boolean isAdministratorExist(String id);

  /**
   * @param id:
   * @return List<HashMap < String, String>>
   * @author ZJ
   * @description TODO [管理员]展示个人信息(个人中心)
   * @date 2022/12/3 18:29
   */
  public List<HashMap<String, String>> displayPersonalInformation(String id);

  /**
   * @param id:
   * @param phone:
   * @param email:
   * @return Boolean
   * @author ZJ
   * @description TODO [管理员]修改电话和邮箱(个人中心)
   * @date 2022/12/4 23:32
   */
  public Boolean modifyPhoneAndEmailById(String id, String phone, String email);

  /**
   * @param id:
   * @param password:
   * @return Boolean
   * @author ZJ
   * @description TODO [管理员]修改密码(个人中心)
   * @date 2022/12/4 23:45
   */
  public Boolean modifyPasswordById(String id, String password);
}
