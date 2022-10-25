package com.zhiyixingnan.domain;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

import java.math.BigInteger;
import java.util.List;

@Data
@TableName("t_problem")
public class Problem {

    @TableId(value = "pk_problem_id",type = IdType.AUTO)
    private BigInteger PKProblemId;

    @TableField("id")
    private String id;

    @TableField("knowledge_point_id")
    private String KnowledgePointId;

    @TableField("name")
    private String name;

    @TableField("difficulty")
    private char difficulty;

    @TableField("label")
    private String label;

    @TableField(exist = false)
    private List<Problem> problemList;
}
