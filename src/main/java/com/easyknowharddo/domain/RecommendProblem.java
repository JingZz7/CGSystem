package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_recommend_problem")
public class RecommendProblem {

  @TableId(value = "pk_recommend_problem_id", type = IdType.ASSIGN_ID)
  private String pkRecommendProblemId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;

  public RecommendProblem() {}

  @Override
  public String toString() {
    return "RecommendProblem{"
        + "pkRecommendProblemId='"
        + pkRecommendProblemId
        + '\''
        + ", studentId='"
        + studentId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public String getPkRecommendProblemId() {
    return pkRecommendProblemId;
  }

  public void setPkRecommendProblemId(String pkRecommendProblemId) {
    this.pkRecommendProblemId = pkRecommendProblemId;
  }

  public String getStudentId() {
    return studentId;
  }

  public void setStudentId(String studentId) {
    this.studentId = studentId;
  }

  public String getProblemId() {
    return problemId;
  }

  public void setProblemId(String problemId) {
    this.problemId = problemId;
  }

  public RecommendProblem(String pkRecommendProblemId, String studentId, String problemId) {
    this.pkRecommendProblemId = pkRecommendProblemId;
    this.studentId = studentId;
    this.problemId = problemId;
  }
}
