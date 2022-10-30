package com.zhiyixingnan.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.zhiyixingnan.dao.ProblemDescriptionDao;
import com.zhiyixingnan.domain.ProblemDescription;
import com.zhiyixingnan.service.IProblemDescriptionService;
import org.springframework.stereotype.Service;

@Service
public class IProblemDescriptionServiceImpl
    extends ServiceImpl<ProblemDescriptionDao, ProblemDescription>
    implements IProblemDescriptionService {}
