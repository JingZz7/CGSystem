package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Problem;
import java.util.List;

public interface IProblemService extends IService<Problem> {

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 查找题目
   * @date 2022/11/14 20:50
   */
  public List<Problem> findProblem(String problemName);

  /**
   * @param problemId: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据id查找
   * @date 2022/11/14 20:50
   */
  public List<Problem> getProblemById(String problemId);

  /**
   * @param problemName: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据名字查找
   * @date 2022/11/14 20:51
   */
  public List<Problem> getProblemListByName(String problemName);

  /**
   * @param difficulty: * @return List<Problem>
   * @author ZJ
   * @description TODO 根据难度查找
   * @date 2022/11/14 20:51
   */
  public List<Problem> getProblemsByDifficulty(String difficulty);
}
