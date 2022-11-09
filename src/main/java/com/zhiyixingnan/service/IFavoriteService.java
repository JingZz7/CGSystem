package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Favorite;

public interface IFavoriteService extends IService<Favorite> {

  public Boolean collectProblem(String studentId, String problemId);

  public Boolean cancelCollectedProblem(String studentId,String problemId);
}
