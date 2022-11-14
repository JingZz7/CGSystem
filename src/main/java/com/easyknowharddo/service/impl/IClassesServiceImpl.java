package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ClassesDao;
import com.easyknowharddo.domain.Classes;
import com.easyknowharddo.service.IClassesService;
import org.springframework.stereotype.Service;

@Service
public class IClassesServiceImpl extends ServiceImpl<ClassesDao, Classes>
    implements IClassesService {}
