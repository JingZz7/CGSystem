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

@Data
@NoArgsConstructor
@AllArgsConstructor
@TableName("t_model_output_knowledge")
public class ModelOutputKnowledge {

  @TableId(value = "pk_model_output_knowledge_id", type = IdType.AUTO)
  private BigInteger PKModelOutputKnowledgeId;

  @TableField("student_id")
  private String studentId;

  @TableField("knowledge_point_id")
  private String knowledgePointId;

  @TableField("forecast")
  private BigDecimal forecast;
}
