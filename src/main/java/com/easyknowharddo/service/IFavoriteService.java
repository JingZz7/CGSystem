package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Favorite;
import com.easyknowharddo.domain.Problem;
import java.util.List;

public interface IFavoriteService extends IService<Favorite> {

  /**
   * @param studentId: * @return List<Problem>
   * @author ZJ
   * @description TODO [学生]获取题目列表(收藏夹)
   * @date 2022/11/14 20:43
   */
  public List<Problem> getFavoriteProblemList(String studentId);

  /**
   * @param studentId:
   * @param problemId: * @return List<Problem>
   * @author ZJ
   * @description TODO [学生]根据id查询问题(收藏夹)
   * @date 2022/11/14 20:44
   */
  public List<Problem> getProblemById(String studentId, String problemId);

  /**
   * @param studentId:
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO [学生]根据名称查询问题(收藏夹)
   * @date 2022/11/14 20:46
   */
  public List<Problem> getProblemByName(String studentId, String problemName);

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
