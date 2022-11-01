package com.zhiyixingnan.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.zhiyixingnan.domain.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface StudentDao extends BaseMapper<Student> {

  @Select("select * from t_student where id=#{id} and password=#{password}")
  public Student getResultByIdAndPassword(
      @Param("id") String id, @Param("password") String password);
}
