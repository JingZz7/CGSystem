package com.zhiyixingnan.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhiyixingnan.domain.ModelOutputKScore;
import com.zhiyixingnan.domain.ModelOutputKnowledge;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ModelOutputScoreDao extends BaseMapper<ModelOutputKScore> {}
