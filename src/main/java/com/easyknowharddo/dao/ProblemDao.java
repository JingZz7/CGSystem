package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easyknowharddo.domain.Problem;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProblemDao extends BaseMapper<Problem> {
}
