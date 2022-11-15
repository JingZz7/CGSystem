package com.easyknowharddo.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Favorite;
import com.easyknowharddo.domain.Problem;
import com.github.pagehelper.PageInfo;

import java.util.List;

public interface IFavoriteService extends IService<Favorite> {

  /**
   * @param studentId: * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [学生]获取题目列表(收藏夹)
   * @date 2022/11/15 22:16
   */
  public PageInfo<Problem> getFavoriteProblemList(String studentId, int currentPage, int pageSize);

  /**
   * @param studentId:
   * @param problemId:
   * @param currentPage:
   * @param pageSize:  * @return IPage<Problem>
   * @author ZJ
   * @description TODO [学生]根据id查询问题(收藏夹)
   * @date 2022/11/15 22:55
   */
  public IPage<Problem> getProblemById(
      String studentId, String problemId, int currentPage, int pageSize);

  /**
   * @param studentId:
   * @param problemName:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<Problem>
   * @author ZJ
   * @description TODO [学生]根据名称查询问题(收藏夹)
   * @date 2022/11/15 23:16
   */
  public PageInfo<Problem> getProblemByName(
      String studentId, String problemName, int currentPage, int pageSize);

  /**
   * @param studentId:
   * @param problemId: * @return Boolean
   * @author ZJ
   * @description TODO [学生]收藏题目
   * @date 2022/11/14 20:48
   */
  public Boolean collectProblem(String studentId, String problemId);

  /**
   * @param studentId:
   * @param problemId: * @return Boolean
   * @author ZJ
   * @description TODO [学生]取消收藏
   * @date 2022/11/14 20:48
   */
  public Boolean cancelCollectedProblem(String studentId, String problemId);

  /**
   * @param studentId:
   * @param ids: * @return Boolean
   * @author ZJ
   * @description TODO [学生]批量删除收藏夹的题目
   * @date 2022/11/14 20:48
   */
  public Boolean bulkDeleteCollectedProblem(String studentId, List<Integer> ids);
}
