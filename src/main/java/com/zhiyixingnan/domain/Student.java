package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.baomidou.mybatisplus.core.metadata.IPage;
import lombok.Data;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_student")
public class Student {
  @TableId(value = "pk_t_student", type = IdType.AUTO)
  private BigInteger PKTStudent;

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

  @TableField(exist = false)
  private List<Student> studentList;
}
