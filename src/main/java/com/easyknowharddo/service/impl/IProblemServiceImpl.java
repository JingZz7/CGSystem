package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IProblemService;
import com.easyknowharddo.service.utils.PageUtils;
import com.github.pagehelper.PageInfo;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据id查询问题(题库管理)
   * @date 2022/11/16 16:45
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
   * @param problemName:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO [教师]根据名称查询问题(题库管理)
   * @date 2022/11/16 16:53
   */
  @Override
  public PageInfo<?> getProblemListByName(String problemName, int currentPage, int pageSize) {
    LambdaQueryWrapper<Problem> lambdaQueryWrapper = new LambdaQueryWrapper<>();
    lambdaQueryWrapper.eq(Problem::getDeleted, 0).like(Problem::getName, problemName);
    List<Problem> problems = problemDao.selectList(lambdaQueryWrapper);
    return PageUtils.pageProblem(problems, currentPage, pageSize);
  }
}
