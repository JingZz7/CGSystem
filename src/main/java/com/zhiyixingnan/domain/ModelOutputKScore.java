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

//@Data
@TableName("t_model_output_score")
@NoArgsConstructor
@AllArgsConstructor
public class ModelOutputKScore {

  @TableId(value = "pk_model_output_score_id", type = IdType.AUTO)
  private BigInteger PKModelOutputScore;

  @TableField("student_id")
  private String studentId;

  @TableField("exam_score")
  private BigDecimal examScore;

  public BigInteger getPKModelOutputScore() {
    return PKModelOutputScore;
  }

  public void setPKModelOutputScore(BigInteger PKModelOutputScore) {
    this.PKModelOutputScore = PKModelOutputScore;
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

  @Override
  public String toString() {
    return "ModelOutputKScore{" +
            "PKModelOutputScore=" + PKModelOutputScore +
            ", studentId='" + studentId + '\'' +
            ", examScore=" + examScore +
            '}';
  }
}
