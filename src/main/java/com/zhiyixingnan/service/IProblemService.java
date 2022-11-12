package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Problem;
import java.util.List;

public interface IProblemService extends IService<Problem> {

  public List<Problem> findProblem(String problemName);

  public List<Problem> getProblemById(String problemId);

  public List<Problem> getProblemListByName(String problemName);

  public List<Problem> getProblemsByDifficulty(String difficulty);
}
