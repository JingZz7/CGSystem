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
@TableName("t_problem")
@NoArgsConstructor
@AllArgsConstructor
public class Problem {

  @TableId(value = "pk_problem_id", type = IdType.ASSIGN_ID)
  private String PKProblemId;

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
}
