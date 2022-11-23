package com.easyknowharddo.aop;

import com.easyknowharddo.domain.Problem;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import java.util.List;

@Component
@Aspect
public class MyAdvice {

  @Pointcut(
      "execution(* com.easyknowharddo.service.IAdministratorService.administratorGetAccountList(*,*))")
  private void administratorGetAccountListPt() {}
  /**
   * @param proceedingJoinPoint: a * return Object
   * @author ZJ
   * @description TODO [管理员]获取用户列表(账户管理)aop分页增强
   * @date 2022/11/21 22:18
   */
  @Around("MyAdvice.administratorGetAccountListPt()")
  public Object administratorGetAccountListAdvice(ProceedingJoinPoint proceedingJoinPoint)
      throws Throwable {
    // 获取连接点方法运行时的入参列表
    Object[] args = proceedingJoinPoint.getArgs();
    // 获取连接点的方法签名对象
    Signature signature = proceedingJoinPoint.getSignature();
    // 获取连接点所在的类的对象(实例)
    Object target = proceedingJoinPoint.getTarget();
    // 方法[{}]开始执行
    Object objects = proceedingJoinPoint.proceed();
    // 方法[{}]执行结束

    if (objects instanceof List) {
      List objList = (List) objects;
      int total = objList.size();
      if (total > Integer.parseInt(args[1].toString())) {
        int toIndex = Integer.parseInt(args[1].toString()) * Integer.parseInt(args[0].toString());
        if (toIndex > total) {
          toIndex = total;
        }
        objList =
            objList.subList(
                Integer.parseInt(args[1].toString()) * (Integer.parseInt(args[0].toString()) - 1),
                toIndex);
      }
      com.github.pagehelper.Page<Object> page =
          new Page<>(Integer.parseInt(args[0].toString()), Integer.parseInt(args[1].toString()));
      page.addAll(objList);
      page.setPages(
          (total + Integer.parseInt(args[1].toString()) - 1)
              / Integer.parseInt(args[1].toString()));
      page.setTotal(total);

      PageInfo<Object> pageInfo = new PageInfo<>(page);
      return pageInfo;
    }
    return objects;
  }

  @Pointcut("execution(* com.easyknowharddo.service.IStudentService.getProblemsList(*,*,*))")
  private void getProblemsListPt() {}
  /**
   * @param proceedingJoinPoint: * @return Object
   * @author ZJ
   * @description TODO [学生]获取题目列表(刷题推荐)aop分页增强
   * @date 2022/11/21 16:05
   */
  @Around("MyAdvice.getProblemsListPt()")
  public Object getProblemsListAdvice(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
    Object[] args = proceedingJoinPoint.getArgs();
    Signature signature = proceedingJoinPoint.getSignature();
    Object target = proceedingJoinPoint.getTarget();

    // 方法[{}]开始执行
    Object objects = proceedingJoinPoint.proceed();
    // 方法[{}]执行结束

    if (objects instanceof List) {
      List objList = (List) objects;
      int total = objList.size();
      if (total > Integer.parseInt(args[2].toString())) {
        int toIndex = Integer.parseInt(args[2].toString()) * Integer.parseInt(args[1].toString());
        if (toIndex > total) {
          toIndex = total;
        }
        objList =
            objList.subList(
                Integer.parseInt(args[2].toString()) * (Integer.parseInt(args[1].toString()) - 1),
                toIndex);
      }
      com.github.pagehelper.Page<Problem> page =
          new Page<>(Integer.parseInt(args[1].toString()), Integer.parseInt(args[2].toString()));
      page.addAll(objList);
      page.setPages(
          (total + Integer.parseInt(args[2].toString()) - 1)
              / Integer.parseInt(args[2].toString()));
      page.setTotal(total);

      PageInfo<Problem> pageInfo = new PageInfo<>(page);
      return pageInfo;
    }
    return objects;
  }

  @Pointcut(
      "execution(* com.easyknowharddo.service.IStudentService.getProblemsByDifficulty(*,*,*,*))")
  private void getProblemsByDifficultyPt() {}
  /**
   * @param proceedingJoinPoint: a * return Object
   * @author ZJ
   * @description TODO [学生]根据难度查询(刷题推荐)aop分页增强
   * @date 2022/11/21 17:07
   */
  @Around("MyAdvice.getProblemsByDifficultyPt()")
  public Object getProblemsByDifficultyAdvice(ProceedingJoinPoint proceedingJoinPoint)
      throws Throwable {
    Object[] args = proceedingJoinPoint.getArgs();
    Signature signature = proceedingJoinPoint.getSignature();
    Object target = proceedingJoinPoint.getTarget();

    // 方法[{}]开始执行
    Object objects = proceedingJoinPoint.proceed();
    // 方法[{}]执行结束

    if (objects instanceof List) {
      List objList = (List) objects;
      int total = objList.size();
      if (total > Integer.parseInt(args[3].toString())) {
        int toIndex = Integer.parseInt(args[3].toString()) * Integer.parseInt(args[2].toString());
        if (toIndex > total) {
          toIndex = total;
        }
        objList =
            objList.subList(
                Integer.parseInt(args[3].toString()) * (Integer.parseInt(args[2].toString()) - 1),
                toIndex);
      }
      com.github.pagehelper.Page<Problem> page =
          new Page<>(Integer.parseInt(args[2].toString()), Integer.parseInt(args[3].toString()));
      page.addAll(objList);
      page.setPages(
          (total + Integer.parseInt(args[3].toString()) - 1)
              / Integer.parseInt(args[3].toString()));
      page.setTotal(total);

      PageInfo<Problem> pageInfo = new PageInfo<>(page);
      return pageInfo;
    }
    return objects;
  }
}
