package com.easyknowharddo.service;

import com.easyknowharddo.domain.Problem;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class IProblemServiceTest {

  @Autowired private IProblemService iProblemService;

  @Test
  public void addProblemTest() {
    Problem problem = new Problem();
    problem.setId("4");
    problem.setKnowledgePointId("2");
    problem.setName("方格取数");
    problem.setDifficulty('3');
    problem.setLabel("动态规划");
    problem.setDeleted(0);
    System.out.println(iProblemService.save(problem));
  }
}
