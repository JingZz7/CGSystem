package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

// @Data
@TableName("t_recommend_problem")
@NoArgsConstructor
@AllArgsConstructor
public class RecommendProblem {

  @TableId(value = "pk_recommend_problem_id", type = IdType.AUTO)
  private BigInteger PKRecommendProblemId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;

  @Override
  public String toString() {
    return "RecommendProblem{"
        + "PKRecommendProblemId="
        + PKRecommendProblemId
        + ", studentId='"
        + studentId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public BigInteger getPKRecommendProblemId() {
    return PKRecommendProblemId;
  }

  public void setPKRecommendProblemId(BigInteger PKRecommendProblemId) {
    this.PKRecommendProblemId = PKRecommendProblemId;
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
}
