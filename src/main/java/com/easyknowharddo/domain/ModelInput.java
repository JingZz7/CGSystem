package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;

@TableName("t_model_input")
public class ModelInput {

  @TableId(value = "pk_model_input_id", type = IdType.ASSIGN_ID)
  private String pkModelInputId;

  @TableField("student_id")
  private String studentId;

  @TableField("homework_chapter")
  private String homeworkChapter;

  @TableField("homework_score")
  private BigDecimal homeworkScore;

  public ModelInput() {}

  public ModelInput(
      String pkModelInputId, String studentId, String homeworkChapter, BigDecimal homeworkScore) {
    this.pkModelInputId = pkModelInputId;
    this.studentId = studentId;
    this.homeworkChapter = homeworkChapter;
    this.homeworkScore = homeworkScore;
  }

  public String getPkModelInputId() {
    return pkModelInputId;
  }

  public void setPkModelInputId(String pkModelInputId) {
    this.pkModelInputId = pkModelInputId;
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
        + "pkModelInputId='"
        + pkModelInputId
        + '\''
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
