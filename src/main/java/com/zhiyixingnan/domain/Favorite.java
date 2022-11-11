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
@TableName("t_favorite")
@NoArgsConstructor
@AllArgsConstructor
public class Favorite {

  @TableId(value = "pk_favorite_id", type = IdType.ASSIGN_ID)
  private String PKFavoriteId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;

  public Favorite(String studentId, String problemId) {
    this.studentId = studentId;
    this.problemId = problemId;
  }

  @Override
  public String toString() {
    return "Favorite{"
        + "PKFavoriteId='"
        + PKFavoriteId
        + '\''
        + ", studentId='"
        + studentId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public String getPKFavoriteId() {
    return PKFavoriteId;
  }

  public void setPKFavoriteId(String PKFavoriteId) {
    this.PKFavoriteId = PKFavoriteId;
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
