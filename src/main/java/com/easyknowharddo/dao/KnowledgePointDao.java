package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easyknowharddo.domain.KnowledgePoint;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface KnowledgePointDao extends BaseMapper<KnowledgePoint> {
}
