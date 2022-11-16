package com.easyknowharddo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
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
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]根据id查询问题(题库管理)
   * @date 2022/11/16 16:45
   */
  public PageInfo<Problem> getProblemById(String problemId, int currentPage, int pageSize);

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据名字查找
   * @date 2022/11/14 20:51
   */
  public List<Problem> getProblemListByName(String problemName);
}
