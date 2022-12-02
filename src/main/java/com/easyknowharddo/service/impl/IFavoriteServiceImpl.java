package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.FavoriteDao;
import com.easyknowharddo.dao.ProblemDao;
import com.easyknowharddo.domain.Favorite;
import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.service.IFavoriteService;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class IFavoriteServiceImpl extends ServiceImpl<FavoriteDao, Favorite>
        implements IFavoriteService {

    @Autowired
    private FavoriteDao favoriteDao;
    @Autowired
    private ProblemDao problemDao;

    /**
     * @param studentId: * @return PageInfo<Problem>
     * @author ZJ
     * @description TODO [学生]获取题目列表(收藏夹)
     * @date 2022/11/15 22:16
     */
    @Override
    public PageInfo<Problem> getFavoriteProblemList(String studentId, int currentPage, int pageSize) {
        //    PageHelper.startPage(currentPage, pageSize);
        List<Favorite> favorites =
                favoriteDao.selectList(
                        new LambdaQueryWrapper<Favorite>().eq(Favorite::getStudentId, studentId));
        List<Problem> problems = new ArrayList<>();
        for (Favorite favorite : favorites) {
            if (problemDao.selectOne(
                    new LambdaQueryWrapper<Problem>()
                            .eq(Problem::getId, favorite.getProblemId())
                            .eq(Problem::getDeleted, 0))
                    == null) continue;
            Problem problem =
                    problemDao.selectOne(
                            new LambdaQueryWrapper<Problem>()
                                    .eq(Problem::getId, favorite.getProblemId())
                                    .eq(Problem::getDeleted, 0));
            //      BeanUtils.copyProperties(favorite, problem);
            problems.add(problem);
        }

        int total = problems.size();
        if (total > pageSize) {
            int toIndex = pageSize * currentPage;
            if (toIndex > total) toIndex = total;
            problems = problems.subList(pageSize * (currentPage - 1), toIndex);
        }
        Page<Problem> page = new Page<>(currentPage, pageSize);
        page.addAll(problems);
        page.setPages((total + pageSize - 1) / pageSize);
        page.setTotal(total);

        PageInfo<Problem> pageInfo = new PageInfo<>(page);
        return pageInfo;

        //    PageInfo<Problem> page = new PageInfo<>(problems);
        //    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
        //    int pageEnd =
        //            problems.size() < pageSize * currentPage ? problems.size() : pageSize *
        // currentPage;
        //    List<Problem> pageResult = new LinkedList<>();
        //    if (problems.size() > pageStart) {
        //      pageResult = problems.subList(pageStart, pageEnd);
        //    }
        //    PageInfo<Problem> pageInfo = new PageInfo<>(pageResult);
        //    BeanUtils.copyProperties(page, pageInfo);
        //    PageHelper.clearPage();
        //    return pageInfo;

        //    LambdaQueryWrapper<Favorite> favoriteLambdaQueryWrapper =
        //        new LambdaQueryWrapper<Favorite>().eq(Favorite::getStudentId, studentId);
        //    List<Favorite> list = favoriteDao.selectList(favoriteLambdaQueryWrapper);
        //    List<String> orders =
        // list.stream().map(Favorite::getProblemId).collect(Collectors.toList());
        //    List<Problem> problemList = new ArrayList<>();
        //    for (String order : orders) {
        //      LambdaQueryWrapper<Problem> problemLambdaQueryWrapper =
        //          new LambdaQueryWrapper<Problem>().eq(Problem::getId, order).eq(Problem::getDeleted,
        // 0);
        //      if (problemDao.selectOne(problemLambdaQueryWrapper) != null) {
        //        problemList.add(problemDao.selectOne(problemLambdaQueryWrapper));
        //      }
        //    }
        //    if (problemList == null) {
        //      return null;
        //    }
        //    return problemList;
    }

    /**
     * @param studentId:
     * @param problemId:
     * @param currentPage:
     * @param pageSize:    * @return IPage<Problem>
     * @author ZJ
     * @description TODO [学生]根据id查询问题(收藏夹)
     * @date 2022/11/15 22:55
     */
    @Override
    public PageInfo<Problem> getProblemById(
            String studentId, String problemId, int currentPage, int pageSize) {
        Favorite favorite =
                favoriteDao.selectOne(
                        new LambdaQueryWrapper<Favorite>()
                                .eq(Favorite::getStudentId, studentId)
                                .eq(Favorite::getProblemId, problemId));
        List<Problem> problems =
                problemDao.selectList(
                        new LambdaQueryWrapper<Problem>().eq(Problem::getId, favorite.getProblemId()));
        int total = problems.size();
        if (total > pageSize) {
            int toIndex = pageSize * currentPage;
            if (toIndex > total) toIndex = total;
            problems = problems.subList(pageSize * (currentPage - 1), toIndex);
        }
        Page<Problem> page = new Page<>(currentPage, pageSize);
        page.addAll(problems);
        page.setPages((total + pageSize - 1) / pageSize);
        page.setTotal(total);

        PageInfo<Problem> pageInfo = new PageInfo<>(page);
        return pageInfo;

        //    LambdaQueryWrapper<Favorite> favoriteLambdaQueryWrapper =
        //        new LambdaQueryWrapper<Favorite>()
        //            .eq(Favorite::getStudentId, studentId)
        //            .eq(Favorite::getProblemId, problemId);
        //    Favorite favorite = favoriteDao.selectOne(favoriteLambdaQueryWrapper);
        //    if (favorite != null) {
        //      LambdaQueryWrapper<Problem> problemLambdaQueryWrapper =
        //          new LambdaQueryWrapper<Problem>().eq(Problem::getId, favorite.getProblemId());
        //      Problem problem = problemDao.selectOne(problemLambdaQueryWrapper);
        //      List<Problem> problems = new ArrayList<>();
        //      problems.add(problem);
        //      return problems;
        //    }
        //    return null;
    }

    /**
     * @param studentId:
     * @param problemName:
     * @param currentPage:
     * @param pageSize:    a * @return PageInfo<Problem>
     * @author ZJ
     * @description TODO [学生]根据名称查询问题(收藏夹)
     * @date 2022/11/15 23:16
     */
    @Override
    public PageInfo<Problem> getProblemByName(
            String studentId, String problemName, int currentPage, int pageSize) {
        List<Favorite> favorites =
                favoriteDao.selectList(
                        new LambdaQueryWrapper<Favorite>().eq(Favorite::getStudentId, studentId));
        List<Problem> problems = new ArrayList<>();
        for (Favorite favorite : favorites)
            if (problemDao.selectOne(
                    new LambdaQueryWrapper<Problem>()
                            .eq(Problem::getId, favorite.getProblemId())
                            .eq(Problem::getDeleted, 0)
                            .like(Problem::getName, problemName))
                    != null) problems.add(
                    problemDao.selectOne(
                            new LambdaQueryWrapper<Problem>()
                                    .eq(Problem::getId, favorite.getProblemId())
                                    .eq(Problem::getDeleted, 0)
                                    .like(Problem::getName, problemName)));
        int total = problems.size();
        if (total > pageSize) {
            int toIndex = pageSize * currentPage;
            if (toIndex > total) toIndex = total;
            problems = problems.subList(pageSize * (currentPage - 1), toIndex);
        }
        Page<Problem> page = new Page<>(currentPage, pageSize);
        page.addAll(problems);
        page.setPages((total + pageSize - 1) / pageSize);
        page.setTotal(total);

        PageInfo<Problem> pageInfo = new PageInfo<>(page);
        return pageInfo;

        //    // 实现list分页
        //    PageHelper.startPage(currentPage, pageSize);
        //    int pageStart = currentPage == 1 ? 0 : (currentPage - 1) * pageSize;
        //    int pageEnd =
        //        problems.size() < pageSize * currentPage ? problems.size() : pageSize * currentPage;
        //    List<Problem> pageResult = new LinkedList<>();
        //    if (problems.size() > pageStart) {
        //      pageResult = problems.subList(pageStart, pageEnd);
        //    } else {
        //      int i = problems.size() / pageSize;
        //      pageResult = problems.subList(i * pageSize, pageEnd);
        //    }
        //    PageInfo<Problem> pageInfo = new PageInfo<>(pageResult);
        //    return pageInfo;

        //    LambdaQueryWrapper<Favorite> favoriteLambdaQueryWrapper =
        //        new LambdaQueryWrapper<Favorite>().eq(Favorite::getStudentId, studentId);
        //    List<Favorite> favorites = favoriteDao.selectList(favoriteLambdaQueryWrapper);
        //    List<Problem> problems = new ArrayList<>();
        //
        //    for (Favorite favorite : favorites) {
        //      LambdaQueryWrapper<Problem> problemLambdaQueryWrapper =
        //          new LambdaQueryWrapper<Problem>().eq(Problem::getId, favorite.getProblemId());
        //      problems.add(problemDao.selectOne(problemLambdaQueryWrapper));
        //    }
        //
        //    List<Problem> resultProblems = new ArrayList<>();
        //
        //    for (Problem problem : problems) {
        //      LambdaQueryWrapper<Problem> lambdaQueryWrapper =
        //          new LambdaQueryWrapper<Problem>()
        //              .eq(Problem::getId, problem.getId())
        //              .like(Problem::getName, problemName);
        //      if (problemDao.selectOne(lambdaQueryWrapper) != null) {
        //        resultProblems.add(problemDao.selectOne(lambdaQueryWrapper));
        //      }
        //    }
        //
        //    if (resultProblems == null) {
        //      return null;
        //    }
        //    return resultProblems;
    }

    /**
     * @param studentId:
     * @param problemId: * @return Boolean
     * @author ZJ
     * @description TODO [学生]收藏题目
     * @date 2022/11/14 20:48
     */
    @Override
    public Boolean collectProblem(String studentId, String problemId) {
        //    favoriteDao.insert(new Favorite(studentId, problemId));
        if (favoriteDao.selectOne(
                new LambdaQueryWrapper<Favorite>()
                        .eq(Favorite::getStudentId, studentId)
                        .eq(Favorite::getProblemId, problemId))
                != null) return false;
        favoriteDao.insert(new Favorite(studentId, problemId));
        return true;
    }

    /**
     * @param studentId:
     * @param problemId: * @return Boolean
     * @author ZJ
     * @description TODO [学生]取消收藏
     * @date 2022/11/14 20:48
     */
    @Override
    public Boolean cancelCollectedProblem(String studentId, String problemId) {
        if (favoriteDao.selectOne(
                new LambdaQueryWrapper<Favorite>()
                        .eq(Favorite::getStudentId, studentId)
                        .eq(Favorite::getProblemId, problemId))
                == null) return false;
        favoriteDao.delete(
                new LambdaQueryWrapper<Favorite>()
                        .eq(Favorite::getStudentId, studentId)
                        .eq(Favorite::getProblemId, problemId));
        return true;
    }

    /**
     * @param studentId:
     * @param ids:       * @return Boolean
     * @author ZJ
     * @description TODO [学生]批量删除收藏夹的题目
     * @date 2022/11/14 20:48
     */
    @Override
    public Boolean bulkDeleteCollectedProblem(String studentId, List<Integer> ids) {
        if (studentId == null || ids == null) return false;

        for (Integer id : ids)
            favoriteDao.delete(
                    new LambdaQueryWrapper<Favorite>()
                            .eq(Favorite::getStudentId, studentId)
                            .eq(Favorite::getProblemId, id));
        return true;
    }
}
