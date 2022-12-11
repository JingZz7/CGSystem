package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@TableName("t_administrator")
@AllArgsConstructor
@NoArgsConstructor
public class Administrator {

  @TableId(value = "pk_administrator_id", type = IdType.ASSIGN_ID)
  private String pkAdministrator;

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

  public String getPkAdministrator() {
    return pkAdministrator;
  }

  public void setPkAdministrator(String pkAdministrator) {
    this.pkAdministrator = pkAdministrator;
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

  @Override
  public String toString() {
    return "Administrator{"
        + "pkAdministrator='"
        + pkAdministrator
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
}
