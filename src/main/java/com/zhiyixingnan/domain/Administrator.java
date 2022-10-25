package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_administrator")
public class Administrator {

    @TableId(value = "pk_administrator_id",type = IdType.AUTO)
    private BigInteger PKAdministrator;

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

    @TableField(exist = false)
    private List<Administrator> administratorList;
}
