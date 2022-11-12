package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.ProblemDao;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.service.IProblemService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
public class IProblemServiceImpl extends ServiceImpl<ProblemDao, Problem>
    implements IProblemService {

  @Autowired private ProblemDao problemDao;

  @Override
  public List<Problem> findProblem(String problemName) {
    LambdaQueryWrapper<Problem> lqw = new LambdaQueryWrapper<>();
    lqw.like(Strings.isNotEmpty(problemName), Problem::getName, problemName);

    List<Problem> problems = problemDao.selectList(lqw);

    return problems;
  }

  @Override
  public List<Problem> getProblemListByName(String problemName) {
    LambdaQueryWrapper<Problem> lqw = new LambdaQueryWrapper<>();
    lqw.like(Problem::getName, problemName);
    List<Problem> problems = problemDao.selectList(lqw);

    if (problems == null) {
      return null;
    }
    return problems;
  }

  @Override
  public List<Problem> getProblemsByDifficulty(String difficulty) {
    if (!difficulty.equals("all")) {
      //      int diff = Integer.parseInt(difficulty);
      LambdaQueryWrapper<Problem> lqw =
          new LambdaQueryWrapper<Problem>()
              .eq(Problem::getDifficulty, difficulty)
              .eq(Problem::getDeleted, 0);
      List<Problem> problems = problemDao.selectList(lqw);
      if (problems == null) {
        return null;
      }
      return problems;
    }
    List<Problem> problems =
        problemDao.selectList(new LambdaQueryWrapper<Problem>().eq(Problem::getDeleted, 0));
    if (problems == null) {
      return null;
    }
    return problems;
  }
}
