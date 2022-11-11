package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigDecimal;
import java.math.BigInteger;

// @Data
@TableName("t_model_input")
@NoArgsConstructor
@AllArgsConstructor
public class ModelInput {

  @TableId(value = "pk_model_input_id", type = IdType.AUTO)
  private BigInteger PKModelInputId;

  @TableField("student_id")
  private String studentId;

  @TableField("homework_chapter")
  private String homeworkChapter;

  @TableField("homework_score")
  private BigDecimal homeworkScore;

  public BigInteger getPKModelInputId() {
    return PKModelInputId;
  }

  public void setPKModelInputId(BigInteger PKModelInputId) {
    this.PKModelInputId = PKModelInputId;
  }

  public String getStudentId() {
    return studentId;
  }

  public void setStudentId(String studentId) {
    this.studentId = studentId;
  }

  public String getHomeworkChapter() {
    return homeworkChapter;
  }

  public void setHomeworkChapter(String homeworkChapter) {
    this.homeworkChapter = homeworkChapter;
  }

  public BigDecimal getHomeworkScore() {
    return homeworkScore;
  }

  public void setHomeworkScore(BigDecimal homeworkScore) {
    this.homeworkScore = homeworkScore;
  }

  @Override
  public String toString() {
    return "ModelInput{"
        + "PKModelInputId="
        + PKModelInputId
        + ", studentId='"
        + studentId
        + '\''
        + ", homeworkChapter='"
        + homeworkChapter
        + '\''
        + ", homeworkScore="
        + homeworkScore
        + '}';
  }
}
