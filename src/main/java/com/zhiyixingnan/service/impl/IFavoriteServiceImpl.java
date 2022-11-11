package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.FavoriteDao;
import com.zhiyixingnan.dao.ProblemDao;
import com.zhiyixingnan.domain.Favorite;
import com.zhiyixingnan.domain.Problem;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IFavoriteService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Service
public class IFavoriteServiceImpl extends ServiceImpl<FavoriteDao, Favorite>
    implements IFavoriteService {

  @Autowired private FavoriteDao favoriteDao;
  @Autowired private ProblemDao problemDao;

  @Override
  public List<Problem> getFavoriteProblemList(String studentId) {
    LambdaQueryWrapper<Favorite> lqw =
        new LambdaQueryWrapper<Favorite>().eq(Favorite::getStudentId, studentId);
    List<Favorite> list = favoriteDao.selectList(lqw);
    List<String> orders = list.stream().map(Favorite::getProblemId).collect(Collectors.toList());
    List<Problem> problemList = new ArrayList<>();
    for (String order : orders) {
      LambdaQueryWrapper<Problem> lqw1 =
          new LambdaQueryWrapper<Problem>().eq(Problem::getId, order).eq(Problem::getDeleted, 0);
      if (problemDao.selectOne(lqw1) != null) {
        problemList.add(problemDao.selectOne(lqw1));
      }
    }
    if (problemList == null) {
      return null;
    }
    return problemList;
  }

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

  @Override
  public Boolean bulkDeleteCollectedProblem(String studentId, List<Integer> ids) {
    if (studentId == null || ids == null) {
      return false;
    }

    for (Integer id : ids) {
      favoriteDao.delete(
          new LambdaQueryWrapper<Favorite>()
              .eq(Favorite::getStudentId, studentId)
              .eq(Favorite::getProblemId, id));
    }
    return true;
  }
}