package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigDecimal;
import java.math.BigInteger;

@TableName("t_model_input")
public class ModelInput {

  @TableId(value = "pk_model_input_id", type = IdType.AUTO)
  private BigInteger PKModelInputId;

  @TableField("student_id")
  private String studentId;

  @TableField("homework_chapter")
  private String homeworkChapter;

  @TableField("homework_score")
  private BigDecimal homeworkScore;

  public ModelInput() {}

  public ModelInput(
      BigInteger PKModelInputId,
      String studentId,
      String homeworkChapter,
      BigDecimal homeworkScore) {
    this.PKModelInputId = PKModelInputId;
    this.studentId = studentId;
    this.homeworkChapter = homeworkChapter;
    this.homeworkScore = homeworkScore;
  }

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
