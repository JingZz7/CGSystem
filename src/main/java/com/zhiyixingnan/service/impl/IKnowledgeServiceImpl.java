package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.KnowledgePointDao;
import com.zhiyixingnan.domain.KnowledgePoint;
import com.zhiyixingnan.service.IKnowledgePointService;
import org.springframework.stereotype.Service;

@Service
public class IKnowledgeServiceImpl extends ServiceImpl<KnowledgePointDao, KnowledgePoint>
    implements IKnowledgePointService {}
