package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.StudentDao;
import com.zhiyixingnan.domain.Student;
import com.zhiyixingnan.service.IStudentService;
import org.springframework.stereotype.Service;

@Service
public class IStudentServiceImpl extends ServiceImpl<StudentDao, Student>
    implements IStudentService {}
