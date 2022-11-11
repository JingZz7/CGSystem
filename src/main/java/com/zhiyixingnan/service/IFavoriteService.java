package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Favorite;

import java.util.List;

public interface IFavoriteService extends IService<Favorite> {

  public Boolean collectProblem(String studentId, String problemId);

  public Boolean cancelCollectedProblem(String studentId, String problemId);

  public Boolean bulkDeleteCollectedProblem(String studentId, List<Integer> ids);
}
