package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

@NoArgsConstructor
@AllArgsConstructor
@TableName("t_comment_student")
public class CommentStudent {

  @TableId(value = "pk_comment_student_id", type = IdType.AUTO)
  private BigInteger PKCommentStudentId;

  @TableField("description")
  private String description;

  @TableField("student_id")
  private String StudentId;

  @TableField("problem_id")
  private String problemId;

  public BigInteger getPKCommentStudentId() {
    return PKCommentStudentId;
  }

  public void setPKCommentStudentId(BigInteger PKCommentStudentId) {
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

  @Override
  public String toString() {
    return "CommentStudent{"
        + "PKCommentStudentId="
        + PKCommentStudentId
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
}
