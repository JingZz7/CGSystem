package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.easyknowharddo.domain.Student;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

@Mapper
public interface StudentDao extends BaseMapper<Student> {

  /**
   * @param id:
   * @param password: * @return Student
   * @author ZJ
   * @description TODO 通过id和password查找
   * @date 2022/11/14 20:19
   */
  @Select("select * from t_student where id=#{id} and password=#{password}")
  public Student getResultByIdAndPassword(
      @Param("id") String id, @Param("password") String password);
}
