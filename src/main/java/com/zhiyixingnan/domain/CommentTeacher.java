package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigInteger;

// @Data
@TableName("t_comment_teacher")
// @NoArgsConstructor
// @AllArgsConstructor
public class CommentTeacher {

  @TableId(value = "pk_comment_teacher_id", type = IdType.AUTO)
  private BigInteger PKCommentTeacherId;

  @TableField("description")
  private String description;

  @TableField("teacher_id")
  private String teacherId;

  @TableField("problem_id")
  private String problemId;

  public CommentTeacher() {
  }

  public CommentTeacher(BigInteger PKCommentTeacherId, String description, String teacherId, String problemId) {
    this.PKCommentTeacherId = PKCommentTeacherId;
    this.description = description;
    this.teacherId = teacherId;
    this.problemId = problemId;
  }

  @Override
  public String toString() {
    return "CommentTeacher{"
        + "PKCommentTeacherId="
        + PKCommentTeacherId
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

  public BigInteger getPKCommentTeacherId() {
    return PKCommentTeacherId;
  }

  public void setPKCommentTeacherId(BigInteger PKCommentTeacherId) {
    this.PKCommentTeacherId = PKCommentTeacherId;
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
