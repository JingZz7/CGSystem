package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_favorite")
public class Favorite {

  @TableId(value = "pk_favorite_id", type = IdType.ASSIGN_ID)
  private String pkFavoriteId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;

  public Favorite(String studentId, String problemId) {
    this.studentId = studentId;
    this.problemId = problemId;
  }

  public Favorite() {}

  public Favorite(String pkFavoriteId, String studentId, String problemId) {
    this.pkFavoriteId = pkFavoriteId;
    this.studentId = studentId;
    this.problemId = problemId;
  }

  @Override
  public String toString() {
    return "Favorite{"
        + "pkFavoriteId='"
        + pkFavoriteId
        + '\''
        + ", studentId='"
        + studentId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public String getPkFavoriteId() {
    return pkFavoriteId;
  }

  public void setPkFavoriteId(String pkFavoriteId) {
    this.pkFavoriteId = pkFavoriteId;
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
