package com.easyknowharddo.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.easyknowharddo.domain.Tutor;

import java.util.HashMap;
import java.util.List;

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

    /**
     * @param id:
     * @return Boolean
     * @author ZJ
     * @description TODO [助教]是否存在
     * @date 2022/12/3 18:45
     */
    public Boolean isTutorExist(String id);

    /**
     * @param id:
     * @return List<HashMap < String, String>>
     * @author ZJ
     * @description TODO [助教]展示个人信息(个人中心)
     * @date 2022/12/3 18:29
     */
    public List<HashMap<String, String>> displayPersonalInformation(String id);
}
