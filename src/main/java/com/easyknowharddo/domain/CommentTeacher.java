package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigInteger;

@TableName("t_comment_teacher")
public class CommentTeacher {

  @TableId(value = "pk_comment_teacher_id", type = IdType.AUTO)
  private BigInteger pkCommentTeacherId;

  @TableField("description")
  private String description;

  @TableField("teacher_id")
  private String teacherId;

  @TableField("problem_id")
  private String problemId;

  public CommentTeacher() {}

  @Override
  public String toString() {
    return "CommentTeacher{"
        + "pkCommentTeacherId="
        + pkCommentTeacherId
        + ", description='"
        + description
        + '\''
        + ", teacherId='"
        + teacherId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public CommentTeacher(
      BigInteger pkCommentTeacherId, String description, String teacherId, String problemId) {
    this.pkCommentTeacherId = pkCommentTeacherId;
    this.description = description;
    this.teacherId = teacherId;
    this.problemId = problemId;
  }

  public BigInteger getPkCommentTeacherId() {
    return pkCommentTeacherId;
  }

  public void setPkCommentTeacherId(BigInteger pkCommentTeacherId) {
    this.pkCommentTeacherId = pkCommentTeacherId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getTeacherId() {
    return teacherId;
  }

  public void setTeacherId(String teacherId) {
    this.teacherId = teacherId;
  }

  public String getProblemId() {
    return problemId;
  }

  public void setProblemId(String problemId) {
    this.problemId = problemId;
  }
}
