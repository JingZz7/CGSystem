package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

//@Data
@TableName("t_teacher")
@NoArgsConstructor
@AllArgsConstructor
public class Teacher {

  @TableId(value = "pk_teacher_id", type = IdType.AUTO)
  private BigInteger PKTeacherId;

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

  @TableField("deleted")
  private int deleted;

  @Override
  public String toString() {
    return "Teacher{" +
            "PKTeacherId=" + PKTeacherId +
            ", id='" + id + '\'' +
            ", name='" + name + '\'' +
            ", password='" + password + '\'' +
            ", phone='" + phone + '\'' +
            ", email='" + email + '\'' +
            ", deleted=" + deleted +
            '}';
  }

  public BigInteger getPKTeacherId() {
    return PKTeacherId;
  }

  public void setPKTeacherId(BigInteger PKTeacherId) {
    this.PKTeacherId = PKTeacherId;
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

  public int getDeleted() {
    return deleted;
  }

  public void setDeleted(int deleted) {
    this.deleted = deleted;
  }
}
