package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_teacher")
public class Teacher {

    @TableId(value = "pk_t_teacher",type = IdType.AUTO)
    private BigInteger PKTTeacher;

    @TableField("id")
    private String id;

    @TableField("name")
    private String name;

    @TableField("password")
    private String password;

    @TableField("phone")
    private String phone;

    @TableField(exist = false)
    private List<Teacher> teacherList;
}
