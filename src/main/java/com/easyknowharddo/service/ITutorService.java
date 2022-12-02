package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Tutor;

public interface ITutorService extends IService<Tutor> {

    /**
     * @param name:
     * @param password: * @return Boolean
     * @author ZJ
     * @description TODO 验证助教
     * @date 2022/11/14 20:59
     */
    public Boolean login(String name, String password);

    /**
     * @param id:
     * @param password: * @return Boolean
     * @author ZJ
     * @description TODO 助教是否存在
     * @date 2022/11/14 20:59
     */
    public Boolean isExistTutor(String id, String password);
}
