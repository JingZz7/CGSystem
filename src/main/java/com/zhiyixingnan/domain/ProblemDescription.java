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
@TableName("t_problem_description")
@NoArgsConstructor
@AllArgsConstructor
public class ProblemDescription {

  @TableId(value = "pk_problem_description_id", type = IdType.ASSIGN_ID)
  private String PKProblemDescriptionId;

  @TableField("description")
  private String description;

  @TableField("input_form")
  private String inputForm;

  @TableField("output_form")
  private String outputForm;

  @TableField("sample_input_1")
  private String sampleInput1;

  @TableField("sample_output_1")
  private String sampleOutput1;

  @TableField("sample_input_2")
  private String sampleInput2;

  @TableField("sample_output_2")
  private String sampleOutput2;

  @TableField("problem_id")
  private String problemId;
}
