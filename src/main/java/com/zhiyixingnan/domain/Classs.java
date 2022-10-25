package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_class")
public class Classs {

    @TableId(value = "pk_t_class",type = IdType.AUTO)
    private BigInteger PKTClass;

    @TableField("id")
    private String id;

    @TableField("name")
    private String name;

    @TableField(exist = false)
    private List<Classs> classsList;
}
