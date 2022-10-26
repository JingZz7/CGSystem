package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_favorite")
public class Favorite {

    @TableId(value = "pk_favorite_id",type = IdType.AUTO)
    private BigInteger PKFavoriteId;

    @TableField("student_id")
    private String studentId;

    @TableField("problem_id")
    private String problemId;

    @TableField(exist = false)
    private List<Favorite> favoriteList;
}
