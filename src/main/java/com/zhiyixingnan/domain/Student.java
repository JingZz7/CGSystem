package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_student")
public class Student {
  @TableId(value = "pk_student_id", type = IdType.ASSIGN_ID)
  private String PKStudentId;

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

  @TableField("deleted")
  private int deleted;

  public Student() {}

  public Student(
      String PKStudentId,
      String id,
      String name,
      String password,
      String phone,
      String email,
      String classId,
      int deleted) {
    this.PKStudentId = PKStudentId;
    this.id = id;
    this.name = name;
    this.password = password;
    this.phone = phone;
    this.email = email;
    this.classId = classId;
    this.deleted = deleted;
  }

  @Override
  public String toString() {
    return "Student{"
        + "PKStudentId='"
        + PKStudentId
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
        + ", classId='"
        + classId
        + '\''
        + ", deleted="
        + deleted
        + '}';
  }

  public String getPKStudentId() {
    return PKStudentId;
  }

  public void setPKStudentId(String PKStudentId) {
    this.PKStudentId = PKStudentId;
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

  public String getClassId() {
    return classId;
  }

  public void setClassId(String classId) {
    this.classId = classId;
  }

  public int getDeleted() {
    return deleted;
  }

  public void setDeleted(int deleted) {
    this.deleted = deleted;
  }
}
