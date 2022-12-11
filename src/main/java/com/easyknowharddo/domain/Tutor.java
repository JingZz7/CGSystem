package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_tutor")
public class Tutor {

  @TableId(value = "pk_tutor_id", type = IdType.ASSIGN_ID)
  private String pkTutorId;

  @TableField("id")
  private String id;

  @TableField("name")
  private String name;

  @TableField("password")
  private String password;

  @TableField("phone")
  private String phone;

  @TableField("email")
  private String email;

  public Tutor() {}

  public Tutor(
      String pkTutorId, String id, String name, String password, String phone, String email) {
    this.pkTutorId = pkTutorId;
    this.id = id;
    this.name = name;
    this.password = password;
    this.phone = phone;
    this.email = email;
  }

  @Override
  public String toString() {
    return "Tutor{"
        + "pkTutorId='"
        + pkTutorId
        + '\''
        + ", id='"
        + id
        + '\''
        + ", name='"
        + name
        + '\''
        + ", password='"
        + password
        + '\''
        + ", phone='"
        + phone
        + '\''
        + ", email='"
        + email
        + '\''
        + '}';
  }

  public String getPkTutorId() {
    return pkTutorId;
  }

  public void setPkTutorId(String pkTutorId) {
    this.pkTutorId = pkTutorId;
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

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }

  public String getEmail() {
    return email;
  }

  public void setEmail(String email) {
    this.email = email;
  }
}
