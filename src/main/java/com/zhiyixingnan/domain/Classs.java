package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_class")
public class Classs {

  @TableId(value = "pk_class_id", type = IdType.ASSIGN_ID)
  private String PKClassId;

  @TableField("id")
  private String id;

  @TableField("name")
  private String name;

  public Classs() {}

  public Classs(String PKClassId, String id, String name) {
    this.PKClassId = PKClassId;
    this.id = id;
    this.name = name;
  }

  @Override
  public String toString() {
    return "Classs{"
        + "PKClassId='"
        + PKClassId
        + '\''
        + ", id='"
        + id
        + '\''
        + ", name='"
        + name
        + '\''
        + '}';
  }

  public String getPKClassId() {
    return PKClassId;
  }

  public void setPKClassId(String PKClassId) {
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
}
