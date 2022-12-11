package com.easyknowharddo.service;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import java.util.ArrayList;

@SpringBootTest
public class IFavoriteServiceTest {

  @Autowired private IFavoriteService iFavoriteService;

  @Test
  public void bulkDeleteCollectedProblemTest() {
    ArrayList<Integer> list = new ArrayList<>();
    list.add(3);
    list.add(4);
    iFavoriteService.bulkDeleteCollectedProblem("202026010512", list);
  }

  @Test
  public void getFavoriteProblemListTest() {
    iFavoriteService.getFavoriteProblemList("202026010512", 1, 5);
  }

  @Test
  public void getProblemByNameTest() {
    //    iFavoriteService.getProblemByName("202026010512", "回文");
  }
}
