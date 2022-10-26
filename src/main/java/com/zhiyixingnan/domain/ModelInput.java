package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigDecimal;
import java.math.BigInteger;

@Data
@TableName("t_model_input")
public class ModelInput {

  @TableId(value = "pk_model_input_id", type = IdType.AUTO)
  private BigInteger PKModelInputId;

  @TableField("student_id")
  private String studentId;

  @TableField("homework_chapter")
  private String homeworkChapter;

  @TableField("homework_score")
  private BigDecimal homeworkScore;
}
