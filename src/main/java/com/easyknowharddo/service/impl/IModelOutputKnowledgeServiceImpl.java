package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ModelOutputKnowledgeDao;
import com.easyknowharddo.domain.ModelOutputKnowledge;
import com.easyknowharddo.service.IModelOutputKnowledgeService;
import org.springframework.stereotype.Service;

@Service
public class IModelOutputKnowledgeServiceImpl
        extends ServiceImpl<ModelOutputKnowledgeDao, ModelOutputKnowledge>
        implements IModelOutputKnowledgeService {
}
