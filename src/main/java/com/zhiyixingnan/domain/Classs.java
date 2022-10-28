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
@TableName("t_class")
@NoArgsConstructor
@AllArgsConstructor
public class Classs {

  @TableId(value = "pk_class_id", type = IdType.AUTO)
  private BigInteger PKClassId;

  @TableField("id")
  private String id;

  @TableField("name")
  private String name;
}
