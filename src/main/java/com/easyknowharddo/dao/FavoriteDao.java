package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easyknowharddo.domain.Favorite;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FavoriteDao extends BaseMapper<Favorite> {
}
