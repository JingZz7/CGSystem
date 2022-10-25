package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_problem_description")
public class ProblemDescription {

  @TableId(value = "pk_problem_description_id", type = IdType.AUTO)
  private BigInteger PKProblemDescriptionId;

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

  @TableField(exist = false)
  private List<ProblemDescription> problemDescriptionList;
}
