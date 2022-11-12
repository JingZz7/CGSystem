package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Favorite;
import com.zhiyixingnan.domain.Problem;

import java.util.List;

public interface IFavoriteService extends IService<Favorite> {

  public List<Problem> getFavoriteProblemList(String studentId);

  public List<Problem> getProblemById(String studentId, String problemId);

  public List<Problem> getProblemByName(String studentId, String problemName);

  public Boolean collectProblem(String studentId, String problemId);

  public Boolean cancelCollectedProblem(String studentId, String problemId);

  public Boolean bulkDeleteCollectedProblem(String studentId, List<Integer> ids);
}
