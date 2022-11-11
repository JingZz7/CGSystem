package com.zhiyixingnan.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.web.bind.annotation.PutMapping;

import java.util.ArrayList;

@SpringBootTest
public class IFavoriteServiceTest {

    @Autowired
    private IFavoriteService iFavoriteService;

    @Test
    public void bulkDeleteCollectedProblemTest(){
        ArrayList<Integer> list = new ArrayList<>();
        list.add(3);
        list.add(4);
        iFavoriteService.bulkDeleteCollectedProblem("202026010512",list);
    }
}
