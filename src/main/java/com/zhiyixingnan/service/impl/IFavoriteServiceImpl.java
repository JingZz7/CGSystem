package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.FavoriteDao;
import com.zhiyixingnan.domain.Favorite;
import com.zhiyixingnan.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IFavoriteServiceImpl extends ServiceImpl<FavoriteDao, Favorite>
    implements IFavoriteService {

  @Autowired private FavoriteDao favoriteDao;

  @Override
  public void collectProblem(String studentId, String problemId) {
    favoriteDao.insert(new Favorite(studentId, problemId));
  }
}
