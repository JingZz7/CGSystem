package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.FavoriteDao;
import com.zhiyixingnan.domain.Favorite;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class IFavoriteServiceImpl extends ServiceImpl<FavoriteDao, Favorite>
    implements IFavoriteService {

  @Autowired private FavoriteDao favoriteDao;

  @Override
  public Boolean collectProblem(String studentId, String problemId) {
    //    favoriteDao.insert(new Favorite(studentId, problemId));
    if (favoriteDao.selectOne(
            new LambdaQueryWrapper<Favorite>()
                .eq(Favorite::getStudentId, studentId)
                .eq(Favorite::getProblemId, problemId))
        != null) {
      return false;
    }
    favoriteDao.insert(new Favorite(studentId, problemId));
    return true;
  }

  @Override
  public Boolean cancelCollectedProblem(String studentId, String problemId) {
    if (favoriteDao.selectOne(
            new LambdaQueryWrapper<Favorite>()
                .eq(Favorite::getStudentId, studentId)
                .eq(Favorite::getProblemId, problemId))
        == null) {
      return false;
    }
    favoriteDao.delete(
        new LambdaQueryWrapper<Favorite>()
            .eq(Favorite::getStudentId, studentId)
            .eq(Favorite::getProblemId, problemId));
    return true;
  }
}
