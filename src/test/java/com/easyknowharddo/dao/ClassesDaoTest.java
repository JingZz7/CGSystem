package com.easyknowharddo.dao;

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.easyknowharddo.domain.Classes;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class ClassesDaoTest {

    @Autowired
    private ClassesDao classesDao;

    @Test
    public void selectOneTest() {
        //    QueryWrapper qw=new QueryWrapper();
        //    qw.like("id","202026010512");
        LambdaQueryWrapper<Classes> lqw = new LambdaQueryWrapper();
        lqw.eq(Classes::getId, "260105");
        //    lqw.like(Student::getId, "260101");
        System.out.println(classesDao.selectOne(lqw));
    }

    @Test
    public void selectListTest() {
        //    String classId = "260101";
        //    LambdaQueryWrapper<Classs> lqw = new LambdaQueryWrapper<>();
        //    lqw.eq(Strings.isNotEmpty(classId), Classs::getClassId, classId);
        System.out.println(classesDao.selectList(null));
    }

    @Test
    public void insertTest() {
        Classes classes1 = new Classes();
        Classes classes2 = new Classes();
        Classes classes3 = new Classes();
        Classes classes4 = new Classes();

        classes1.setId("080301");
        classes1.setName("通信一班");

        classes2.setId("080302");
        classes2.setName("通信二班");

        classes3.setId("080303");
        classes3.setName("通信三班");

        classes4.setId("080304");
        classes4.setName("通信四班");

        classesDao.insert(classes1);
        classesDao.insert(classes2);
        classesDao.insert(classes3);
        classesDao.insert(classes4);
    }

    @Test
    public void deleteTest() {
        // delete skip for now
    }

    @Test
    public void updateTest() {
        // update skip for now
    }

    @Test
    public void pageTest() {
        String name = "一";

        LambdaQueryWrapper<Classes> lqw = new LambdaQueryWrapper<>();
        lqw.like(Classes::getName, name);

        IPage page = new Page(0, 9);

        classesDao.selectPage(page, lqw);
    }

    @Test
    public void getIdByName() {
        LambdaQueryWrapper<Classes> lqw = new LambdaQueryWrapper<>();
        lqw.eq(Classes::getName, "软件一班");
        //    System.out.println(classsDao.selectOne(lqw));
        Classes classes = classesDao.selectOne(lqw);
        System.out.println(classes.getId());
    }
}
