package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.ITutorService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ITutorServiceImpl extends ServiceImpl<TutorDao, Tutor> implements ITutorService {

    @Autowired
    private TutorDao tutorDao;

    /**
     * @param name:
     * @param password: * @return Boolean
     * @author ZJ
     * @description TODO 验证助教
     * @date 2022/11/14 20:59
     */
    @Override
    public Boolean login(String name, String password) {
        LambdaQueryWrapper<Tutor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Strings.isNotEmpty(name), Tutor::getName, name);
        Tutor tutor = tutorDao.selectOne(lambdaQueryWrapper);

        if (tutor == null) return false;

        return password.equals(tutor.getPassword());
    }

    /**
     * @param id:
     * @param password: * @return Boolean
     * @author ZJ
     * @description TODO 助教是否存在
     * @date 2022/11/14 20:59
     */
    @Override
    public Boolean isExistTutor(String id, String password) {
        LambdaQueryWrapper<Tutor> lambdaQueryWrapper = new LambdaQueryWrapper<>();
        lambdaQueryWrapper.eq(Tutor::getId, id).eq(Tutor::getPassword, password);
        if (tutorDao.selectOne(lambdaQueryWrapper) == null) return false;
        return true;
    }
}
