package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.math.BigDecimal;

@TableName("t_model_output_score")
public class ModelOutputScore {

  @TableId(value = "pk_model_output_score_id", type = IdType.ASSIGN_ID)
  private String pkModelOutputScore;

  @TableField("student_id")
  private String studentId;

  @TableField("exam_score")
  private BigDecimal examScore;

  public ModelOutputScore() {}

  @Override
  public String toString() {
    return "ModelOutputKScore{"
        + "pkModelOutputScore='"
        + pkModelOutputScore
        + '\''
        + ", studentId='"
        + studentId
        + '\''
        + ", examScore="
        + examScore
        + '}';
  }

  public String getPkModelOutputScore() {
    return pkModelOutputScore;
  }

  public void setPkModelOutputScore(String pkModelOutputScore) {
    this.pkModelOutputScore = pkModelOutputScore;
  }

  public String getStudentId() {
    return studentId;
  }

  public void setStudentId(String studentId) {
    this.studentId = studentId;
  }

  public BigDecimal getExamScore() {
    return examScore;
  }

  public void setExamScore(BigDecimal examScore) {
    this.examScore = examScore;
  }

  public ModelOutputScore(String pkModelOutputScore, String studentId, BigDecimal examScore) {
    this.pkModelOutputScore = pkModelOutputScore;
    this.studentId = studentId;
    this.examScore = examScore;
  }
}
