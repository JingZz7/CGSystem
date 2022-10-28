package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

@Data
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
}
