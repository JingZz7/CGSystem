package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_class")
public class Classes {

  @TableId(value = "pk_class_id", type = IdType.ASSIGN_ID)
  private String pkClassId;

  @TableField("id")
  private String id;

  @TableField("name")
  private String name;

  public Classes() {}

  public Classes(String pkClassId, String id, String name) {
    this.pkClassId = pkClassId;
    this.id = id;
    this.name = name;
  }

  public String getPkClassId() {
    return pkClassId;
  }

  public void setPkClassId(String pkClassId) {
    this.pkClassId = pkClassId;
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
    return "Classes{"
        + "pkClassId='"
        + pkClassId
        + '\''
        + ", id='"
        + id
        + '\''
        + ", name='"
        + name
        + '\''
        + '}';
  }
}
