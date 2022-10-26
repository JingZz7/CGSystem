package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigInteger;

@Data
@TableName("t_model_output")
public class ModelOutput {

  @TableId(value = "pk_model_output_id", type = IdType.AUTO)
  private BigInteger PKModelOutputId;

  @TableField("student_id")
  private String studentId;

  @TableField("chapter_id")
  private String chapterId;

  @TableField("class_id")
  private String classId;

  @TableField("forecast")
  private Integer forecast;
}
