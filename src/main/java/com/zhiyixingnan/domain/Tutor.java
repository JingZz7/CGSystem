package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@TableName("t_tutor")
public class Tutor {

  @TableId(value = "pk_tutor_id", type = IdType.ASSIGN_ID)
  private String PKTutorId;

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

  @Override
  public String toString() {
    return "Tutor{"
        + "PKTutorId='"
        + PKTutorId
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

  public String getPKTutorId() {
    return PKTutorId;
  }

  public void setPKTutorId(String PKTutorId) {
    this.PKTutorId = PKTutorId;
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
