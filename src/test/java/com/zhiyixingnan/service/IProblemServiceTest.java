package com.zhiyixingnan.service;

import com.zhiyixingnan.domain.Problem;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class IProblemServiceTest {

  @Autowired private IProblemService iProblemService;

  @Test
  public void addProblemTest() {
    Problem problem = new Problem();
    problem.setId("3");
    problem.setKnowledgePointId("1");
    problem.setName("铺地毯");
    problem.setDifficulty('1');
    problem.setLabel("数组");
    problem.setDeleted(0);
    System.out.println(iProblemService.save(problem));
  }
}
