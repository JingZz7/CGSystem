package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import com.github.pagehelper.PageInfo;
import java.util.List;

public interface IProblemService extends IService<Problem> {

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 查找题目
   * @date 2022/11/14 20:50
   */
  public List<Problem> findProblem(String problemName);

  /**
   * @param problemId:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据id查询问题(题库管理)
   * @date 2022/11/16 16:45
   */
  public PageInfo<?> getProblemById(String problemId, int currentPage, int pageSize);

  /**
   * @param problemName:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据名称查询问题(题库管理)
   * @date 2022/11/16 16:53
   */
  public PageInfo<?> getProblemListByName(String problemName, int currentPage, int pageSize);
}
