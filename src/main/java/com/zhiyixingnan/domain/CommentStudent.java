package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_comment_student")
public class CommentStudent {

  @TableId(value = "pk_comment_student_id", type = IdType.AUTO)
  private BigInteger PKCommentStudentId;

  @TableField("description")
  private String description;

  @TableField("student_id")
  private String StudentId;

  @TableField("problem_id")
  private String problemId;

  @TableField(exist = false)
  private List<CommentStudent> commentStudentList;
}
