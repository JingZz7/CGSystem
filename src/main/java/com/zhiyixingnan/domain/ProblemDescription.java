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

  @Override
  public String toString() {
    return "ProblemDescription{"
        + "PKProblemDescriptionId='"
        + PKProblemDescriptionId
        + '\''
        + ", description='"
        + description
        + '\''
        + ", inputForm='"
        + inputForm
        + '\''
        + ", outputForm='"
        + outputForm
        + '\''
        + ", sampleInput1='"
        + sampleInput1
        + '\''
        + ", sampleOutput1='"
        + sampleOutput1
        + '\''
        + ", sampleInput2='"
        + sampleInput2
        + '\''
        + ", sampleOutput2='"
        + sampleOutput2
        + '\''
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }

  public String getPKProblemDescriptionId() {
    return PKProblemDescriptionId;
  }

  public void setPKProblemDescriptionId(String PKProblemDescriptionId) {
    this.PKProblemDescriptionId = PKProblemDescriptionId;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public String getInputForm() {
    return inputForm;
  }

  public void setInputForm(String inputForm) {
    this.inputForm = inputForm;
  }

  public String getOutputForm() {
    return outputForm;
  }

  public void setOutputForm(String outputForm) {
    this.outputForm = outputForm;
  }

  public String getSampleInput1() {
    return sampleInput1;
  }

  public void setSampleInput1(String sampleInput1) {
    this.sampleInput1 = sampleInput1;
  }

  public String getSampleOutput1() {
    return sampleOutput1;
  }

  public void setSampleOutput1(String sampleOutput1) {
    this.sampleOutput1 = sampleOutput1;
  }

  public String getSampleInput2() {
    return sampleInput2;
  }

  public void setSampleInput2(String sampleInput2) {
    this.sampleInput2 = sampleInput2;
  }

  public String getSampleOutput2() {
    return sampleOutput2;
  }

  public void setSampleOutput2(String sampleOutput2) {
    this.sampleOutput2 = sampleOutput2;
  }

  public String getProblemId() {
    return problemId;
  }

  public void setProblemId(String problemId) {
    this.problemId = problemId;
  }
}
