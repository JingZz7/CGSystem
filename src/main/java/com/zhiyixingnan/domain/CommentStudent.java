package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_comment_student")
public class CommentStudent {

  @TableId(value = "pk_comment_student_id", type = IdType.ASSIGN_ID)
  private String PKCommentStudentId;

  @TableField("description")
  private String description;

  @TableField("student_id")
  private String StudentId;

  @TableField("problem_id")
  private String problemId;

  public CommentStudent() {}

  public CommentStudent(
      String PKCommentStudentId, String description, String studentId, String problemId) {
    this.PKCommentStudentId = PKCommentStudentId;
    this.description = description;
    StudentId = studentId;
    this.problemId = problemId;
  }

  @Override
  public String toString() {
    return "CommentStudent{"
        + "PKCommentStudentId='"
        + PKCommentStudentId
        + '\''
        + ", description='"
        + description
        + '\''
        + ", StudentId='"
        + StudentId
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public String getPKCommentStudentId() {
    return PKCommentStudentId;
  }

  public void setPKCommentStudentId(String PKCommentStudentId) {
    this.PKCommentStudentId = PKCommentStudentId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getStudentId() {
    return StudentId;
  }

  public void setStudentId(String studentId) {
    StudentId = studentId;
  }

  public String getProblemId() {
    return problemId;
  }

  public void setProblemId(String problemId) {
    this.problemId = problemId;
  }
}
