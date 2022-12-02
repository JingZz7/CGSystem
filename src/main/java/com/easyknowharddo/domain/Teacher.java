package com.easyknowharddo.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;

@TableName("t_teacher")
public class Teacher {

    @TableId(value = "pk_teacher_id", type = IdType.ASSIGN_ID)
    private String pkTeacherId;

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

    public Teacher() {
    }

    @Override
    public String toString() {
        return "Teacher{"
                + "pkTeacherId='"
                + pkTeacherId
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
                + ", deleted="
                + deleted
                + '}';
    }

    public String getPkTeacherId() {
        return pkTeacherId;
    }

    public void setPkTeacherId(String pkTeacherId) {
        this.pkTeacherId = pkTeacherId;
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

    public Teacher(
            String pkTeacherId,
            String id,
            String name,
            String password,
            String phone,
            String email,
            int deleted) {
        this.pkTeacherId = pkTeacherId;
        this.id = id;
        this.name = name;
        this.password = password;
        this.phone = phone;
        this.email = email;
        this.deleted = deleted;
    }
}
