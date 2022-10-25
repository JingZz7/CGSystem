package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_tutor")
public class Tutor {

    @TableId(value = "pk_tutor_id",type = IdType.AUTO)
    private BigInteger PKTutorId;

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
    private List<Tutor> tutorList;
}
