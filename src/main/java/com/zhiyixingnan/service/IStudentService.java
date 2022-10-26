package com.zhiyixingnan.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.zhiyixingnan.domain.Student;

import java.util.List;

public interface IStudentService extends IService<Student> {

    public List<Student> getStudentByClassName(String name);
}