package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

import java.math.BigDecimal;

@TableName("t_model_output_knowledge")
public class ModelOutputKnowledge {

  @TableId(value = "pk_model_output_knowledge_id", type = IdType.ASSIGN_ID)
  private String pkModelOutputKnowledgeId;

  @TableField("student_id")
  private String studentId;

  @TableField("knowledge_point_id")
  private String knowledgePointId;

  @TableField("forecast")
  private BigDecimal forecast;

  public ModelOutputKnowledge() {}

  public ModelOutputKnowledge(
      String pkModelOutputKnowledgeId,
      String studentId,
      String knowledgePointId,
      BigDecimal forecast) {
    this.pkModelOutputKnowledgeId = pkModelOutputKnowledgeId;
    this.studentId = studentId;
    this.knowledgePointId = knowledgePointId;
    this.forecast = forecast;
  }

  public String getPkModelOutputKnowledgeId() {
    return pkModelOutputKnowledgeId;
  }

  public void setPkModelOutputKnowledgeId(String pkModelOutputKnowledgeId) {
    this.pkModelOutputKnowledgeId = pkModelOutputKnowledgeId;
  }

  public String getStudentId() {
    return studentId;
  }

  public void setStudentId(String studentId) {
    this.studentId = studentId;
  }

  public String getKnowledgePointId() {
    return knowledgePointId;
  }

  public void setKnowledgePointId(String knowledgePointId) {
    this.knowledgePointId = knowledgePointId;
  }

  public BigDecimal getForecast() {
    return forecast;
  }

  public void setForecast(BigDecimal forecast) {
    this.forecast = forecast;
  }

  @Override
  public String toString() {
    return "ModelOutputKnowledge{"
        + "pkModelOutputKnowledgeId='"
        + pkModelOutputKnowledgeId
        + '\''
        + ", studentId='"
        + studentId
        + '\''
        + ", knowledgePointId='"
        + knowledgePointId
        + '\''
        + ", forecast="
        + forecast
        + '}';
  }
}
