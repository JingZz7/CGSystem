package com.easyknowharddo.controller;

import com.alibaba.fastjson.JSONObject;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.easyknowharddo.controller.utils.JsonResult;
import com.easyknowharddo.domain.Administrator;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.easyknowharddo.service.IAdministratorService;
import com.easyknowharddo.service.IStudentService;
import com.easyknowharddo.service.ITeacherService;
import com.easyknowharddo.service.ITutorService;
import com.easyknowharddo.utils.TokenUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
@Slf4j
@RequestMapping("/login")
public class LoginController {

  @Autowired private IStudentService iStudentService;
  @Autowired private ITeacherService iTeacherService;
  @Autowired private IAdministratorService iAdministratorService;
  @Autowired private ITutorService iTutorService;
  @Autowired private LoginController loginController;

  @RequestMapping(value = "/test", method = RequestMethod.GET)
  public JsonResult test() {
    System.out.println("test hot deploy..");
    System.out.println("test hot deploy..");
    LambdaQueryWrapper<Student> lqw = new LambdaQueryWrapper<>();
    lqw.eq(Student::getId, "202026010512");
    return JsonResult.success(iStudentService.getOne(lqw));
  }

  /**
   * @param obj: * @return JsonResult
   * @author ZJ
   * @description TODO token-test
   * @date 2022/12/2 16:08
   */
  @RequestMapping(value = "/login", method = RequestMethod.POST)
  public JsonResult login(@RequestBody JSONObject obj) {
    System.out.println(obj);
    //        String scope= JSONObject.parseObject(obj).getJSONObject("data").getString("scope");
    QueryWrapper<Student> wrapper = new QueryWrapper<>();
    obj.getString("password");
    wrapper.eq("id", obj.getString("id")).eq("password", obj.getString("password"));

    String token = null;
    Student user = iStudentService.getOne(wrapper);
    if (user != null) {
      token = TokenUtil.sign(user.getId());
    }
    // 将token放在响应头
    //        response.setHeader(JwtTokenUtil.AUTH_HEADER_KEY, JwtTokenUtil.TOKEN_PREFIX + token);
    if (token != null) {

      return JsonResult.success(token, "student");
    }
    return JsonResult.failed("error");
  }

  /**
   * @param token:
   * @param obj: * @return JsonResult
   * @author ZJ
   * @description TODO token-test
   * @date 2022/12/2 16:07
   */
  @RequestMapping(value = "/verify", method = RequestMethod.POST)
  public JsonResult verify(@RequestHeader("token") String token, @RequestBody JSONObject obj) {
    System.out.println(token);
    System.out.println(token);
    System.out.println(token);
    System.out.println(token);
    System.out.println(token);

    System.out.println(obj.getString("token1"));
    System.out.println(obj.getString("token1"));
    System.out.println(obj.getString("token1"));
    System.out.println(obj.getString("token1"));
    List<String> list = TokenUtil.verify(obj.getString("token1"));
    if (list.get(0).equals("true")) {
      return JsonResult.success(list.get(1), "success");
    }
    return JsonResult.validateFailed("error");
  }

  /**
   * @author ZJ Description 登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:28:34 21:28
   * @param jsonObject
   */
  @RequestMapping(value = "/logins", method = RequestMethod.POST)
  //  @GetMapping("/{id}/{password}")
  public JsonResult logins(@RequestBody JSONObject jsonObject) {
    //    lqw.eq(Student::getDeleted        , 0)
    //            .and(i -> i.eq(Student::getId, id).eq(Student::getPassword, password));
    if (iStudentService.isExistStudent(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success(
          iStudentService.getOne(
              new LambdaQueryWrapper<Student>().eq(Student::getId, jsonObject.getString("id"))),
          "学生登录成功");
    } else if (iTeacherService.isExistTeacher(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success(
          iTeacherService.getOne(
              new LambdaQueryWrapper<Teacher>().eq(Teacher::getId, jsonObject.getString("id"))),
          "教师登录成功");
    } else if (iAdministratorService.isExistAdministrator(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success(
          iAdministratorService.getOne(
              new LambdaQueryWrapper<Administrator>()
                  .eq(Administrator::getId, jsonObject.getString("id"))),
          "管理员登录成功");
    } else if (iTutorService.isExistTutor(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success(
          iTutorService.getOne(
              new LambdaQueryWrapper<Tutor>().eq(Tutor::getId, jsonObject.getString("id"))),
          "助教登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @author ZJ Description 教师登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:52:57 21:52
   * @param jsonObject
   */
  @RequestMapping(value = "/teachers", method = RequestMethod.POST)
  public JsonResult loginTeacher(@RequestBody JSONObject jsonObject) {
    if (iTeacherService.isExistTeacher(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success("登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @author ZJ Description 管理员登录 date jsonObject数据包含"id"和"password"即可 2022-11-07 21:56:40 21:56
   * @param jsonObject
   */
  @RequestMapping(value = "/administrators", method = RequestMethod.POST)
  public JsonResult loginAdministrator(@RequestBody JSONObject jsonObject) {
    if (iAdministratorService.isExistAdministrator(
        jsonObject.getString("id"), jsonObject.getString("password"))) {
      return JsonResult.success("登录成功");
    }
    return JsonResult.failed("登录失败");
  }

  /**
   * @param jsonObject: a * return JsonResult
   * @author ZJ
   * @description TODO 获取随机验证码(忘记密码) json数据包含id
   * @date 2022/11/21 14:57
   */
  @RequestMapping(value = "/getCaptchaById", method = RequestMethod.POST)
  public JsonResult getCaptchaById(@RequestBody JSONObject jsonObject) {
    if (iStudentService.getCaptchaById(jsonObject.getString("id")).equals("学号错误")) {
      return JsonResult.failed(iStudentService.getCaptchaById(jsonObject.getString("id")));
    }
    return JsonResult.success(iStudentService.getCaptchaById(jsonObject.getString("id")));
  }

  /**
   * @param jsonObject: * @return JsonResult
   * @author ZJ
   * @description TODO 忘记密码 json数据包含id、password
   * @date 2022/11/21 20:05
   */
  @RequestMapping(value = "/forgotPassword", method = RequestMethod.PUT)
  public JsonResult forgotPassword(@RequestBody JSONObject jsonObject) {
    Boolean flag =
        iStudentService.forgotPassword(
            jsonObject.getString("id"), jsonObject.getString("password"));
    if (flag) {
      return JsonResult.success("修改成功");
    }
    return JsonResult.failed("修改失败");
  }

  /**
   * @author ZJ Description 修改密码 date jsonObject数据包含"phone"字段和"password"字段即可 2022-11-07 17:47:14
   *     17:47
   * @param jsonObject
   */
  @RequestMapping(value = "/modifyPassword", method = RequestMethod.PUT)
  public JsonResult modifyPassword(@RequestBody JSONObject jsonObject) {
    String phone = jsonObject.getString("phone");
    if (iStudentService.isStudentPhone(phone)) {
      iStudentService.updatePasswordByPhone(phone, jsonObject.getString("password"));
      return JsonResult.success("修改成功！");
    } else if (iTeacherService.isTeacherPhone(phone)) {
      iTeacherService.updatePasswordByPhone(phone, jsonObject.getString("password"));
      return JsonResult.success("修改成功！");
    }
    iAdministratorService.updatePasswordByPhone(phone, jsonObject.getString("password"));
    return JsonResult.success("修改成功！");
  }

  //  /**
  //   * @author ZJ Description 修改教师密码 date 2022-11-07 00:13:55 0:13
  //   * @param teacher
  //   */
  //  @RequestMapping(value = "/modifyTeacherPassword", method = RequestMethod.PUT)
  //  public JsonResult modifyTeacherPassword(@RequestBody Teacher teacher) {
  //    LambdaQueryWrapper<Teacher> lqw = new LambdaQueryWrapper<>();
  //    lqw.eq(Teacher::getPhone, teacher.getPhone());
  //    iTeacherService.update(teacher, lqw);
  //    return JsonResult.success("修改成功!");
  //  }
  //
  //  @RequestMapping(value = "/modifyAdministratorPassword", method = RequestMethod.PUT)
  //  public JsonResult modifyAdministratorPassword(@RequestBody JSONObject jsonObject) {
  //    //    LambdaQueryWrapper<Administrator> lqw = new LambdaQueryWrapper<>();
  //    //    lqw.eq(Administrator::getPhone, administrator.getPhone());
  //    //    iAdministratorService.update(administrator, lqw);
  //    //    return JsonResult.success("修改成功!");
  //
  //    Student student = jsonObject.toJavaObject(Student.class);
  //    return JsonResult.success(student);
  //  }
}
