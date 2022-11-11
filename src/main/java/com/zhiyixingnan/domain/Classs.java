package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

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

  public BigInteger getPKClassId() {
    return PKClassId;
  }

  public void setPKClassId(BigInteger PKClassId) {
    this.PKClassId = PKClassId;
  }

  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  @Override
  public String toString() {
    return "Classs{"
        + "PKClassId="
        + PKClassId
        + ", id='"
        + id
        + '\''
        + ", name='"
        + name
        + '\''
        + '}';
  }
}
