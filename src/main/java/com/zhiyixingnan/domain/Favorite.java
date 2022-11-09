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
@TableName("t_favorite")
@NoArgsConstructor
@AllArgsConstructor
public class Favorite {

  @TableId(value = "pk_favorite_id", type = IdType.ASSIGN_ID)
  private String PKFavoriteId;

  @TableField("student_id")
  private String studentId;

  @TableField("problem_id")
  private String problemId;

  public Favorite(String studentId, String problemId) {
    this.studentId = studentId;
    this.problemId = problemId;
  }
}
