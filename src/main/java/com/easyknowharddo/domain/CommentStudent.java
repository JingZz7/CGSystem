package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_comment_student")
public class CommentStudent {

  @TableId(value = "pk_comment_student_id", type = IdType.ASSIGN_ID)
  private String pkCommentStudentId;

  @TableField("description")
  private String description;

  @TableField("student_id")
  private String StudentId;

  @TableField("problem_id")
  private String problemId;

  @TableField("date_time")
  private String dateTime;

  public CommentStudent() {}

  public String getPkCommentStudentId() {
    return pkCommentStudentId;
  }

  public void setPkCommentStudentId(String pkCommentStudentId) {
    this.pkCommentStudentId = pkCommentStudentId;
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

  public String getDateTime() {
    return dateTime;
  }

  public void setDateTime(String dateTime) {
    this.dateTime = dateTime;
  }

  @Override
  public String toString() {
    return "CommentStudent{"
        + "pkCommentStudentId='"
        + pkCommentStudentId
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
        + ", dateTime='"
        + dateTime
        + '\''
        + '}';
  }

  public CommentStudent(
      String pkCommentStudentId,
      String description,
      String studentId,
      String problemId,
      String dateTime) {
    this.pkCommentStudentId = pkCommentStudentId;
    this.description = description;
    StudentId = studentId;
    this.problemId = problemId;
    this.dateTime = dateTime;
  }
}
