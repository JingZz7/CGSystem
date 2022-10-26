package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.ClasssDao;
import com.zhiyixingnan.domain.Classs;
import com.zhiyixingnan.service.IClasssService;
import org.springframework.stereotype.Service;

@Service
public class IClasssServiceImpl extends ServiceImpl<ClasssDao, Classs> implements IClasssService {}
