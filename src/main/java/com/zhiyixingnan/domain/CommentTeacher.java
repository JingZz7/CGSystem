package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_comment_teacher")
public class CommentTeacher {

  @TableId(value = "pk_comment_teacher_id", type = IdType.AUTO)
  private BigInteger PKCommentTeacherId;

  @TableField("description")
  private String description;

  @TableField("teacher_id")
  private String teacherId;

  @TableField("problem_id")
  private String problemId;

  @TableField(exist = false)
  private List<CommentTeacher> commentTeacherList;
}
