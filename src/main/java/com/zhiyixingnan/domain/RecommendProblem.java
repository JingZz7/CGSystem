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
@TableName("t_recommend_problem")
@NoArgsConstructor
@AllArgsConstructor
public class RecommendProblem {

  @TableId(value = "pk_recommend_problem_id", type = IdType.AUTO)
  private BigInteger PKRecommendProblemId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;
}
