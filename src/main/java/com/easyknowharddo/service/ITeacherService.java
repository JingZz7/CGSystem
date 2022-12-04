package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Teacher;
import com.github.pagehelper.PageInfo;

import java.math.BigDecimal;
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
     * @param pageSize:    a * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]获取账户列表(账户管理)
     * @date 2022/11/16 17:13
     */
    public PageInfo<?> teacherGetAccountList(int currentPage, int pageSize);

    /**
     * @param id:
     * @param currentPage:
     * @param pageSize:    a * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据工号查询(账户管理)
     * @date 2022/11/16 17:22
     */
    public PageInfo<?> teacherGetAccountById(String id, int currentPage, int pageSize);

    /**
     * @param name:
     * @param currentPage:
     * @param pageSize:    * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据姓名查询(账户管理)
     * @date 2022/11/16 17:27
     */
    public PageInfo<?> teacherGetAccountByName(String name, int currentPage, int pageSize);

    /**
     * @param type:
     * @param currentPage:
     * @param pageSize:    * @return PageInfo<?>
     * @author ZJ
     * @description TODO [教师]根据类型查询(账户管理)
     * @date 2022/11/17 10:17
     */
    public PageInfo<?> teacherGetAccountByType(String type, int currentPage, int pageSize);

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
    public Boolean teacherAddAccount(
            String type, String id, String name, String password, String email, String phone);

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
     * @param problemId: * @return PageInfo<HashMap<String,String>>
     * @author ZJ
     * @description TODO [教师]根据问题id搜索评论(查看评论)
     * @date 2022/11/14 20:58
     */
    public PageInfo<HashMap<String, String>> teacherGetReviewByProblemId(
            String problemId, int currentPage, int pageSize);

    /**
     * @param currentPage:
     * @param pageSize:    a * @return List<HashMap<String,String>>
     * @author ZJ
     * @description TODO [教师]获取评论列表(查看评论)
     * @date 2022/11/17 10:39
     */
    public PageInfo<HashMap<String, String>> teacherGetReviewList(int currentPage, int pageSize);

    /**
     * @param id: * @return PageInfo<HashMap<String,String>>
     * @author ZJ
     * @description TODO [教师]查看具体评论信息(查看评论)
     * @date 2022/11/20 20:29
     */
    public List<HashMap<String, String>> teacherViewDetailReview(String id);

    /**
     * @param currentPage:
     * @param pageSize:    * @return PageInfo<Problem>
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
     * @param pageSize:    * @return PageInfo<Problem>
     * @author ZJ
     * @description TODO [教师]根据难度查询(题库管理)
     * @date 2022/11/16 17:03
     */
    public PageInfo<Problem> getListByDifficulty(String difficulty, int currentPage, int pageSize);

    /**
     * @param id:
     * @param name:
     * @param difficulty:
     * @param label:      * @return Boolean
     * @author ZJ
     * @description TODO [教师]编辑题目(题库管理)
     * @date 2022/11/15 17:03
     */
    public Boolean editProblem(String id, String name, String difficulty, String label);

    /**
     * @param id:
     * @param name:
     * @param label:
     * @param difficulty: * @return Boolean
     * @author ZJ
     * @description TODO [教师]添加题目
     * @date 2022/11/20 21:06
     */
    public Boolean addProblem(String id, String name, String label, String difficulty);

    /**
     * @param : * @return List<Integer>
     * @author ZJ
     * @description TODO [教师]获取成绩分布
     * @date 2022/11/22 17:34
     */
    public List<Integer> gradeDistribution();

    /**
     * @param className: * @return List<Integer>
     * @author ZJ
     * @description TODO [教师]根据班级获取成绩分布
     * @date 2022/11/22 21:30
     */
    public List<Integer> gradeDistributionByClass(String className);

    /**
     * @param id: * @return List<BigDecimal>
     * @author ZJ
     * @description TODO [教师]获取学生知识点成绩扇形图
     * @date 2022/11/22 21:58
     */
    public List<BigDecimal> getKnowledgePointGrade(String id);

    /**
     * @param id:
     * @return Boolean
     * @author ZJ
     * @description TODO [教师]是否存在
     * @date 2022/12/3 19:03
     */
    public Boolean isTeacherExist(String id);

    /**
     * @param id:
     * @return List<HashMap < String, String>>
     * @author ZJ
     * @description TODO [教师]展示个人信息(个人中心)
     * @date 2022/12/3 19:05
     */
    public List<HashMap<String, String>> displayPersonalInformation(String id);

    /**
     * @param id:
     * @param phone:
     * @param email:
     * @return Boolean
     * @author ZJ
     * @description TODO [教师]修改电话和邮箱(个人中心)
     * @date 2022/12/4 23:32
     */
    public Boolean modifyPhoneAndEmailById(String id, String phone, String email);

    /**
     * @param id:
     * @param password:
     * @return Boolean
     * @author ZJ
     * @description TODO [教师]修改密码(个人中心)
     * @date 2022/12/4 23:45
     */
    public Boolean modifyPasswordById(String id,String password);
}
