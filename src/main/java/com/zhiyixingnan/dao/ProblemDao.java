package com.zhiyixingnan.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhiyixingnan.domain.problem;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.beans.factory.parsing.Problem;

@Mapper
public interface ProblemDao extends BaseMapper<problem> {
}
