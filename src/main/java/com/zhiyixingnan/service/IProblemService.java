package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Problem;

import java.util.List;

public interface IProblemService extends IService<Problem> {

  public List<Problem> findProblem(String problemName);
}
