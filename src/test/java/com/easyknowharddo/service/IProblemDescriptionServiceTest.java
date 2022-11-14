package com.easyknowharddo.service;

import com.easyknowharddo.domain.ProblemDescription;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
public class IProblemDescriptionServiceTest {

  @Autowired private IProblemDescriptionService iProblemDescriptionService;

  @Test
  public void saveTest() {
    ProblemDescription problemDescription = new ProblemDescription();
    problemDescription.setDescription(
        "春节期间小希计划乘坐火车去旅行。开始时，火车位于位置1，目的地在位置L。火车的速度是1单位长度/分钟（也就是第1分钟火车在位置1，第2分钟在位置2，等等）。 中国人过年都喜欢挂灯笼，在该路线上就有许多灯笼，它们位于能被 v 整除的位置上（也就是说，第1个灯笼在位置 v ，第2个灯笼在位置2v，等等）。 有另外一辆火车停留在从位置 l 到 r 的地方 显然，当 p 能被 v 整除的时候，且该处没有火车停留（p∉[l;r]），小希就可以看到处于位置 p 上的灯笼。因此，灯笼的位置如果被停留的火车遮挡，小希就看不见这些灯笼。 请输出小希在旅行期间能看到的灯笼数");
    problemDescription.setProblemId("1");
    problemDescription.setInputForm(
        "输入的第一行为一个整数T，表示测试数据的组数。接下来的T行，每行4个整数，为L、v、l、r，分别表示目的地的位置、灯笼的间距、停留火车的位置区间段。");
    problemDescription.setOutputForm("输出为T行，对应每个测试用例的输出结果。");
    problemDescription.setSampleInput1(
        "4\n" + "10 2 3 7\n" + "100 51 51 51\n" + "1234 1 100 199\n" + "1000000000 1 1 1000000000");
    problemDescription.setSampleOutput1("3\n" + "0\n" + "1134\n" + "0");

    iProblemDescriptionService.save(problemDescription);
  }
}
