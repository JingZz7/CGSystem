package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_problem")
public class Problem {

  @TableId(value = "pk_problem_id", type = IdType.ASSIGN_ID)
  private String pkProblemId;

  @TableField("id")
  private String id;

  @TableField("knowledge_point_id")
  private String KnowledgePointId;

  @TableField("name")
  private String name;

  @TableField("difficulty")
  private char difficulty;

  @TableField("label")
  private String label;

  @TableField("deleted")
  private Integer deleted;

  public Problem() {}

  @Override
  public String toString() {
    return "Problem{"
        + "pkProblemId='"
        + pkProblemId
        + '\''
        + ", id='"
        + id
        + '\''
        + ", KnowledgePointId='"
        + KnowledgePointId
        + '\''
        + ", name='"
        + name
        + '\''
        + ", difficulty="
        + difficulty
        + ", label='"
        + label
        + '\''
        + ", deleted="
        + deleted
        + '}';
  }

  public String getPkProblemId() {
    return pkProblemId;
  }

  public void setPkProblemId(String pkProblemId) {
    this.pkProblemId = pkProblemId;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getKnowledgePointId() {
    return KnowledgePointId;
  }

  public void setKnowledgePointId(String knowledgePointId) {
    KnowledgePointId = knowledgePointId;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public char getDifficulty() {
    return difficulty;
  }

  public void setDifficulty(char difficulty) {
    this.difficulty = difficulty;
  }

  public String getLabel() {
    return label;
  }

  public void setLabel(String label) {
    this.label = label;
  }

  public Integer getDeleted() {
    return deleted;
  }

  public void setDeleted(Integer deleted) {
    this.deleted = deleted;
  }

  public Problem(
      String pkProblemId,
      String id,
      String knowledgePointId,
      String name,
      char difficulty,
      String label,
      Integer deleted) {
    this.pkProblemId = pkProblemId;
    this.id = id;
    KnowledgePointId = knowledgePointId;
    this.name = name;
    this.difficulty = difficulty;
    this.label = label;
    this.deleted = deleted;
  }
}
