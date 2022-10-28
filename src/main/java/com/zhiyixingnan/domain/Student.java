package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_student")
@NoArgsConstructor
@AllArgsConstructor
public class Student {
  @TableId(value = "pk_student_id", type = IdType.AUTO)
  private BigInteger PKStudentId;

  @TableField(value = "id")
  private String id;

  @TableField("name")
  private String name;

  @TableField("password")
  private String password;

  @TableField("phone")
  private String phone;

  @TableField("email")
  private String email;

  @TableField("class_id")
  private String classId;
}
