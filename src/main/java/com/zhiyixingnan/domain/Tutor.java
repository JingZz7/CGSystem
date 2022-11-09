package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import java.math.BigInteger;

@Data
@TableName("t_tutor")
@NoArgsConstructor
@AllArgsConstructor
public class Tutor {

    @TableId(value = "pk_tutor_id",type = IdType.ASSIGN_ID)
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

}
