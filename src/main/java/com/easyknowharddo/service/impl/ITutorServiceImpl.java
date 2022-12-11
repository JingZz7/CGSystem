package com.easyknowharddo.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.easyknowharddo.dao.TutorDao;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.ITutorService;
import org.apache.logging.log4j.util.Strings;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Service
public class ITutorServiceImpl extends ServiceImpl<TutorDao, Tutor> implements ITutorService {

  @Autowired private TutorDao tutorDao;

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

  /**
   * @param id:
   * @return Boolean
   * @author ZJ
   * @description TODO [助教]是否存在
   * @date 2022/12/3 18:45
   */
  @Override
  public Boolean isTutorExist(String id) {
    if (tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id)) != null) {
      return true;
    }
    return false;
  }

  /**
   * @param id:
   * @return List<HashMap < String, String>>
   * @author ZJ
   * @description TODO [助教]展示个人信息(个人中心)
   * @date 2022/12/3 18:29
   */
  @Override
  public List<HashMap<String, String>> displayPersonalInformation(String id) {
    HashMap<String, String> map = new HashMap<>();
    Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    map.put("id", id);
    map.put("name", tutor.getName());
    map.put("email", tutor.getEmail());
    map.put("phone", tutor.getPhone());
    List<HashMap<String, String>> list = new ArrayList<>();
    list.add(map);
    return list;
  }

  /**
   * @param id:
   * @param phone:
   * @param email:
   * @return Boolean
   * @author ZJ
   * @description TODO [助教]修改电话和邮箱(个人中心)
   * @date 2022/12/4 23:32
   */
  @Override
  public Boolean modifyPhoneAndEmailById(String id, String phone, String email) {
    Boolean flag = isTutorExist(id);
    if (!flag) {
      return false;
    }
    Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    tutor.setPhone(phone);
    tutor.setEmail(email);
    tutorDao.updateById(tutor);
    return true;
  }

  /**
   * @param id:
   * @param password:
   * @return Boolean
   * @author ZJ
   * @description TODO [助教]修改密码(个人中心)
   * @date 2022/12/4 23:45
   */
  @Override
  public Boolean modifyPasswordById(String id, String password) {
    Boolean flag = isTutorExist(id);
    if (!flag) {
      return false;
    }
    Tutor tutor = tutorDao.selectOne(new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, id));
    tutor.setPassword(password);
    tutorDao.updateById(tutor);
    return true;
  }
}
