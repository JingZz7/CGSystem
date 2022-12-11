package com.easyknowharddo.service.utils;

import com.easyknowharddo.domain.Problem;
import com.easyknowharddo.domain.Student;
import com.easyknowharddo.domain.Teacher;
import com.easyknowharddo.domain.Tutor;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import java.util.List;

public class PageUtils {

  /**
   * @param list:
   * @param currentPage:
   * @param pageSize: a * @return PageInfo<?>
   * @author ZJ
   * @description TODO Object类型分页
   * @date 2022/11/28 10:12
   */
  public static PageInfo<?> pageObject(List<Object> list, int currentPage, int pageSize) {
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) toIndex = total;
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Object> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Object> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param list:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO Problem类型分页
   * @date 2022/11/28 10:29
   */
  public static PageInfo<?> pageProblem(List<Problem> list, int currentPage, int pageSize) {
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) toIndex = total;
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Problem> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Problem> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param list:
   * @param currentPage:
   * @param pageSize: a * @return PageIno<?>
   * @author ZJ
   * @description TODO Student类型分页
   * @date 2022/11/28 10:48
   */
  public static PageInfo<?> pageStudent(List<Student> list, int currentPage, int pageSize) {
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) toIndex = total;
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Student> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Student> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param list:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO Teacher类型分页
   * @date 2022/11/28 10:34
   */
  public static PageInfo<?> pageTeacher(List<Teacher> list, int currentPage, int pageSize) {
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) toIndex = total;
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Teacher> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Teacher> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }

  /**
   * @param list:
   * @param currentPage:
   * @param pageSize: * @return PageInfo<?>
   * @author ZJ
   * @description TODO Tutor类型分页
   * @date 2022/11/28 10:35
   */
  public static PageInfo<?> pageTutor(List<Tutor> list, int currentPage, int pageSize) {
    int total = list.size();
    if (total > pageSize) {
      int toIndex = pageSize * currentPage;
      if (toIndex > total) toIndex = total;
      list = list.subList(pageSize * (currentPage - 1), toIndex);
    }
    com.github.pagehelper.Page<Tutor> page = new Page<>(currentPage, pageSize);
    page.addAll(list);
    page.setPages((total + pageSize - 1) / pageSize);
    page.setTotal(total);

    PageInfo<Tutor> pageInfo = new PageInfo<>(page);
    return pageInfo;
  }
}
