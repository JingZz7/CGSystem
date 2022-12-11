package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.ProblemDescriptionDao;
import com.easyknowharddo.domain.ProblemDescription;
import com.easyknowharddo.service.IProblemDescriptionService;
import org.springframework.stereotype.Service;

@Service
public class IProblemDescriptionServiceImpl
    extends ServiceImpl<ProblemDescriptionDao, ProblemDescription>
    implements IProblemDescriptionService {}
