package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.KnowledgePointDao;
import com.easyknowharddo.domain.KnowledgePoint;
import com.easyknowharddo.service.IKnowledgePointService;
import org.springframework.stereotype.Service;

@Service
public class IKnowledgeServiceImpl extends ServiceImpl<KnowledgePointDao, KnowledgePoint>
    implements IKnowledgePointService {}
