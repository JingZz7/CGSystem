package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_problem_description")
public class ProblemDescription {

  @TableId(value = "pk_problem_description_id", type = IdType.ASSIGN_ID)
  private String pkProblemDescriptionId;

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

  @TableField("problem_id")
  private String problemId;

  public ProblemDescription() {}

  public ProblemDescription(
      String pkProblemDescriptionId,
      String description,
      String inputForm,
      String outputForm,
      String sampleInput1,
      String sampleOutput1,
      String problemId) {
    this.pkProblemDescriptionId = pkProblemDescriptionId;
    this.description = description;
    this.inputForm = inputForm;
    this.outputForm = outputForm;
    this.sampleInput1 = sampleInput1;
    this.sampleOutput1 = sampleOutput1;
    this.problemId = problemId;
  }

  public String getPkProblemDescriptionId() {
    return pkProblemDescriptionId;
  }

  public void setPkProblemDescriptionId(String pkProblemDescriptionId) {
    this.pkProblemDescriptionId = pkProblemDescriptionId;
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

  public String getProblemId() {
    return problemId;
  }

  public void setProblemId(String problemId) {
    this.problemId = problemId;
  }

  @Override
  public String toString() {
    return "ProblemDescription{"
        + "pkProblemDescriptionId='"
        + pkProblemDescriptionId
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
        + ", problemId='"
        + problemId
        + '\''
        + '}';
  }
}
