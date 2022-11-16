package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IProblemService;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.LinkedList;
import java.util.List;

@Service
public class IProblemServiceImpl extends ServiceImpl<ProblemDao, Problem>
    implements IProblemService {

  @Autowired private ProblemDao problemDao;

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 查找题目
   * @date 2022/11/14 20:50
   */
  @Override
  public List<Problem> findProblem(String problemName) {
    LambdaQueryWrapper<Problem> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.like(Strings.isNotEmpty(problemName), Problem::getName, problemName);

    List<Problem> problems = problemDao.selectList(lambdaQueryWrapper);

    return problems;
  }

  /**
   * @param problemId:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [教师]根据id查询问题(题库管理)
   * @date 2022/11/16 16:45
   */
  @Override
  public PageInfo<Problem> getProblemById(String problemId, int currentPage, int pageSize) {
    List<Problem> problems =
        problemDao.selectList(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, problemId)
                .eq(Problem::getDeleted, 0));
    PageHelper.startPage(currentPage, pageSize);
    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
    int pageEnd =
            problems.size() < pageSize * currentPage ? problems.size() : pageSize * currentPage;
    List<Problem> pageResult = new LinkedList<>();
    if (problems.size() > pageStart) {
      pageResult = problems.subList(pageStart, pageEnd);
    } else {
      int i = problems.size() / pageSize;
      pageResult = problems.subList(i * pageSize, pageEnd);
    }
    PageInfo<Problem> pageInfo = new PageInfo<>(pageResult);
    return pageInfo;
  }

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据名字查找
   * @date 2022/11/14 20:51
   */
  @Override
  public List<Problem> getProblemListByName(String problemName) {
    LambdaQueryWrapper<Problem> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.like(Problem::getName, problemName);
    List<Problem> problems = problemDao.selectList(lambdaQueryWrapper);

    if (problems == null) {
      return null;
    }
    return problems;
  }
}
