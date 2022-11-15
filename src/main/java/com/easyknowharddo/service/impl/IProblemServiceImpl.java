package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IProblemService;
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
   * @param problemId: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据id查找
   * @date 2022/11/14 20:50
   */
  @Override
  public List<Problem> getProblemById(String problemId) {
    List<Problem> problems =
        problemDao.selectList(
            new LambdaQueryWrapper<Problem>()
                .eq(Problem::getId, problemId)
                .eq(Problem::getDeleted, 0));
    if (problems.isEmpty()) {
      return null;
    }
    return problems;
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
