package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

// @Data
@TableName("t_knowledge_point")
@NoArgsConstructor
@AllArgsConstructor
public class KnowledgePoint {

  @TableId(value = "pk_knowledge_point_id", type = IdType.AUTO)
  private BigInteger PKKnowledgePointId;

  @TableField("id")
  private String id;

  @TableField("name")
  private String name;

  @TableField("student_id")
  private String StudentId;

  @Override
  public String toString() {
    return "KnowledgePoint{"
        + "PKKnowledgePointId="
        + PKKnowledgePointId
        + ", id='"
        + id
        + '\''
        + ", name='"
        + name
        + '\''
        + ", StudentId='"
        + StudentId
        + '\''
        + '}';
  }

  public BigInteger getPKKnowledgePointId() {
    return PKKnowledgePointId;
  }

  public void setPKKnowledgePointId(BigInteger PKKnowledgePointId) {
    this.PKKnowledgePointId = PKKnowledgePointId;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public String getStudentId() {
    return StudentId;
  }

  public void setStudentId(String studentId) {
    StudentId = studentId;
  }
}
