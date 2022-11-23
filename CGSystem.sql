/*
 Navicat Premium Data Transfer

 Source Server         : zjSQL
 Source Server Type    : MySQL
 Source Server Version : 80025
 Source Host           : localhost:3306
 Source Schema         : cgsystem

 Target Server Type    : MySQL
 Target Server Version : 80025
 File Encoding         : 65001

 Date: 23/11/2022 11:47:40
*/

SET NAMES utf8mb4;
SET
FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_administrator
-- ----------------------------
DROP TABLE IF EXISTS `t_administrator`;
CREATE TABLE `t_administrator`
(
    `pk_administrator_id` bigint                                                  NOT NULL,
    `id`                  varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `name`                varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `password`            varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `phone`               char(11) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `email`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`pk_administrator_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_administrator
-- ----------------------------
INSERT INTO `t_administrator`
VALUES (1590268513125013266, 'A202026010512', 'A曾靖', '111222333', '18389670510', 'xxxxx@gmail.com');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`
(
    `pk_class_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `id`          char(6) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `name`        varchar(8) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `deleted`     int NULL DEFAULT NULL,
    PRIMARY KEY (`pk_class_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class`
VALUES ('1', '260101', '软件一班', 0);
INSERT INTO `t_class`
VALUES ('10', '080303', '通信三班', 0);
INSERT INTO `t_class`
VALUES ('11', '080304', '通信四班', 0);
INSERT INTO `t_class`
VALUES ('2', '260102', '软件二班', 0);
INSERT INTO `t_class`
VALUES ('3', '260103', '软件三班', 0);
INSERT INTO `t_class`
VALUES ('4', '260104', '软件四班', 0);
INSERT INTO `t_class`
VALUES ('5', '260105', '软件五班', 0);
INSERT INTO `t_class`
VALUES ('6', '080501', '拔尖一班', 0);
INSERT INTO `t_class`
VALUES ('7', '080502', '拔尖二班', 0);
INSERT INTO `t_class`
VALUES ('8', '080301', '通信一班', 0);
INSERT INTO `t_class`
VALUES ('9', '080302', '通信二班', 0);

-- ----------------------------
-- Table structure for t_comment_student
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_student`;
CREATE TABLE `t_comment_student`
(
    `pk_comment_student_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `description`           varchar(10000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `student_id`            char(15) CHARACTER SET utf8 COLLATE utf8_general_ci       NOT NULL,
    `problem_id`            varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `date_time`             datetime NULL DEFAULT NULL,
    PRIMARY KEY (`pk_comment_student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment_student
-- ----------------------------
INSERT INTO `t_comment_student`
VALUES ('1592045061813358592', 'xxxxxx', '202026010512', '1', '2022-11-14 14:41:32');
INSERT INTO `t_comment_student`
VALUES ('1592045061813358594', '好简单啊3113', 'E202108000102', '1', '2022-11-14 14:41:36');

-- ----------------------------
-- Table structure for t_comment_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_teacher`;
CREATE TABLE `t_comment_teacher`
(
    `pk_comment_teacher_id` bigint                                                  NOT NULL,
    `description`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `teacher_id`            varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `problem_id`            varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    PRIMARY KEY (`pk_comment_teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for t_favorite
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite`
(
    `pk_favorite_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `student_id`     char(12) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `problem_id`     varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`pk_favorite_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_favorite
-- ----------------------------
INSERT INTO `t_favorite`
VALUES ('1', '202026010512', '3');
INSERT INTO `t_favorite`
VALUES ('1590167125883003297', '202026010513', '1');
INSERT INTO `t_favorite`
VALUES ('1590167125883003298', '202026010512', '2');
INSERT INTO `t_favorite`
VALUES ('2', '202026010512', '4');
INSERT INTO `t_favorite`
VALUES ('3', '202026010512', '5');
INSERT INTO `t_favorite`
VALUES ('4', '202026010512', '6');

-- ----------------------------
-- Table structure for t_knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge_point`;
CREATE TABLE `t_knowledge_point`
(
    `pk_knowledge_point_id` bigint                                                  NOT NULL,
    `id`                    varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `name`                  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `deleted`               int                                                     NOT NULL,
    `student_id`            char(12) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    PRIMARY KEY (`pk_knowledge_point_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knowledge_point
-- ----------------------------

-- ----------------------------
-- Table structure for t_model_input
-- ----------------------------
DROP TABLE IF EXISTS `t_model_input`;
CREATE TABLE `t_model_input`
(
    `pk_model_input_id` bigint                                                  NOT NULL,
    `student_id`        char(12) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `homework_chapter`  varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `homework_score`    decimal(10, 0)                                          NOT NULL,
    PRIMARY KEY (`pk_model_input_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_input
-- ----------------------------

-- ----------------------------
-- Table structure for t_model_output_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `t_model_output_knowledge`;
CREATE TABLE `t_model_output_knowledge`
(
    `pk_model_output_knowledge_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `student_id`                   char(12) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `knowledge_point_id`           varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `forecast`                     decimal(10, 9)                                         NOT NULL,
    PRIMARY KEY (`pk_model_output_knowledge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_output_knowledge
-- ----------------------------
INSERT INTO `t_model_output_knowledge`
VALUES ('10026091', '202108030421', '10', 0.015963886);
INSERT INTO `t_model_output_knowledge`
VALUES ('10073137', '202108030128', '6', 0.005476747);
INSERT INTO `t_model_output_knowledge`
VALUES ('10151172', '202108030305', '9', 0.025543395);
INSERT INTO `t_model_output_knowledge`
VALUES ('10335519', '202108030308', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('10414811', '202108030328', '9', 0.922482400);
INSERT INTO `t_model_output_knowledge`
VALUES ('10474202', '202108030404', '7', 0.514723960);
INSERT INTO `t_model_output_knowledge`
VALUES ('10499650', '202108030307', '10', 0.003548615);
INSERT INTO `t_model_output_knowledge`
VALUES ('10501450', '202108030205', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('10855742', '202108030307', '1', 0.325062070);
INSERT INTO `t_model_output_knowledge`
VALUES ('10942288', '202108030308', '6', 0.088465370);
INSERT INTO `t_model_output_knowledge`
VALUES ('10944700', '202108030426', '8', 0.567767440);
INSERT INTO `t_model_output_knowledge`
VALUES ('10970658', '201810040106', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('11126243', '202108030415', '10', 0.058864832);
INSERT INTO `t_model_output_knowledge`
VALUES ('11202577', '202006010214', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('11435919', '202108030324', '1', 0.920284870);
INSERT INTO `t_model_output_knowledge`
VALUES ('11446817', '202108030412', '9', 0.261346900);
INSERT INTO `t_model_output_knowledge`
VALUES ('11536641', '202108030404', '11', 0.995330870);
INSERT INTO `t_model_output_knowledge`
VALUES ('11558786', '202108030423', '8', 0.176091600);
INSERT INTO `t_model_output_knowledge`
VALUES ('11584298', '202108030327', '8', 0.082764760);
INSERT INTO `t_model_output_knowledge`
VALUES ('11587680', '202108030126', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('11648978', '202108030406', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('11694663', '202108030215', '5', 0.993520700);
INSERT INTO `t_model_output_knowledge`
VALUES ('11821718', '202108030127', '8', 0.247497410);
INSERT INTO `t_model_output_knowledge`
VALUES ('11858412', '202108030108', '3', 0.018276295);
INSERT INTO `t_model_output_knowledge`
VALUES ('11878845', '202108030201', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('12012800', '202108030211', '10', 0.026466083);
INSERT INTO `t_model_output_knowledge`
VALUES ('12207816', '202108030219', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('12326635', '202108030224', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('12396027', '202108030213', '9', 0.091871630);
INSERT INTO `t_model_output_knowledge`
VALUES ('12427586', '202108030403', '11', 0.896030600);
INSERT INTO `t_model_output_knowledge`
VALUES ('12436930', '202108030204', '11', 0.993797200);
INSERT INTO `t_model_output_knowledge`
VALUES ('12537829', '202108030422', '11', 0.940144960);
INSERT INTO `t_model_output_knowledge`
VALUES ('12628383', '202108030129', '9', 0.095319150);
INSERT INTO `t_model_output_knowledge`
VALUES ('12700360', '202108030428', '10', 0.067038700);
INSERT INTO `t_model_output_knowledge`
VALUES ('12719420', '202108030301', '3', 0.026212862);
INSERT INTO `t_model_output_knowledge`
VALUES ('12851461', '202108030410', '5', 0.975142900);
INSERT INTO `t_model_output_knowledge`
VALUES ('12873752', '202108030129', '8', 0.236404780);
INSERT INTO `t_model_output_knowledge`
VALUES ('12942809', '202108030223', '5', 0.983698500);
INSERT INTO `t_model_output_knowledge`
VALUES ('13001940', '202108030205', '11', 0.986407640);
INSERT INTO `t_model_output_knowledge`
VALUES ('13058633', '202108030414', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('13089906', '202108030118', '10', 0.006174613);
INSERT INTO `t_model_output_knowledge`
VALUES ('13102068', '202108030220', '3', 0.228044630);
INSERT INTO `t_model_output_knowledge`
VALUES ('13119012', '202108030411', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('13205259', '202108030125', '7', 0.087031940);
INSERT INTO `t_model_output_knowledge`
VALUES ('13234792', '202108030419', '7', 0.200388360);
INSERT INTO `t_model_output_knowledge`
VALUES ('13288086', '202108030404', '6', 0.012395863);
INSERT INTO `t_model_output_knowledge`
VALUES ('13306139', '202108030104', '11', 0.956575040);
INSERT INTO `t_model_output_knowledge`
VALUES ('13310994', '202108030405', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('13414042', '202108030401', '9', 0.163404380);
INSERT INTO `t_model_output_knowledge`
VALUES ('13440337', '202108030109', '10', 0.007260595);
INSERT INTO `t_model_output_knowledge`
VALUES ('13455284', '202108030327', '1', 0.991227100);
INSERT INTO `t_model_output_knowledge`
VALUES ('13519799', '202108030414', '6', 0.230646100);
INSERT INTO `t_model_output_knowledge`
VALUES ('13610030', '202108030330', '11', 0.702137500);
INSERT INTO `t_model_output_knowledge`
VALUES ('13621821', '202108030107', '3', 0.132537110);
INSERT INTO `t_model_output_knowledge`
VALUES ('13658983', '202108030122', '11', 0.983977850);
INSERT INTO `t_model_output_knowledge`
VALUES ('13670888', '202108030127', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('13697840', '202108030208', '11', 0.974991300);
INSERT INTO `t_model_output_knowledge`
VALUES ('13776097', '202108030301', '9', 0.020891090);
INSERT INTO `t_model_output_knowledge`
VALUES ('13798908', '202108030315', '8', 0.745814600);
INSERT INTO `t_model_output_knowledge`
VALUES ('13835861', '202108030111', '8', 0.844587500);
INSERT INTO `t_model_output_knowledge`
VALUES ('13922923', '202108030306', '5', 0.993091800);
INSERT INTO `t_model_output_knowledge`
VALUES ('14034349', '202108030307', '11', 0.943854750);
INSERT INTO `t_model_output_knowledge`
VALUES ('14044290', '202108030201', '10', 0.051242445);
INSERT INTO `t_model_output_knowledge`
VALUES ('14212786', '202108030203', '3', 0.065876120);
INSERT INTO `t_model_output_knowledge`
VALUES ('14424079', '202108030128', '7', 0.059748955);
INSERT INTO `t_model_output_knowledge`
VALUES ('14561584', '202108030414', '7', 0.106289380);
INSERT INTO `t_model_output_knowledge`
VALUES ('14564997', '202108030306', '10', 0.051302742);
INSERT INTO `t_model_output_knowledge`
VALUES ('14647593', '202108030109', '3', 0.008129144);
INSERT INTO `t_model_output_knowledge`
VALUES ('14725865', '202108030427', '1', 0.990935740);
INSERT INTO `t_model_output_knowledge`
VALUES ('14770972', '202108030206', '3', 0.886534150);
INSERT INTO `t_model_output_knowledge`
VALUES ('14933116', '202108030407', '3', 0.019385096);
INSERT INTO `t_model_output_knowledge`
VALUES ('14949570', '202108030414', '5', 0.995196640);
INSERT INTO `t_model_output_knowledge`
VALUES ('14978833', '202108030212', '9', 0.819571200);
INSERT INTO `t_model_output_knowledge`
VALUES ('15105978', '202108030222', '6', 0.016214704);
INSERT INTO `t_model_output_knowledge`
VALUES ('15277230', '201508010709', '9', 0.069870780);
INSERT INTO `t_model_output_knowledge`
VALUES ('15396573', '202108030402', '6', 0.034990460);
INSERT INTO `t_model_output_knowledge`
VALUES ('15473692', '202108030130', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('15506340', '202108030210', '7', 0.621890370);
INSERT INTO `t_model_output_knowledge`
VALUES ('15506441', '202108030425', '11', 0.996811000);
INSERT INTO `t_model_output_knowledge`
VALUES ('15513118', '202108030411', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('15556260', '202108030218', '9', 0.046301585);
INSERT INTO `t_model_output_knowledge`
VALUES ('15673863', '202108030114', '9', 0.733784800);
INSERT INTO `t_model_output_knowledge`
VALUES ('15697527', '202108030124', '8', 0.083732670);
INSERT INTO `t_model_output_knowledge`
VALUES ('15729498', '202108030121', '10', 0.008246671);
INSERT INTO `t_model_output_knowledge`
VALUES ('15733487', '202108030209', '1', 0.994889860);
INSERT INTO `t_model_output_knowledge`
VALUES ('15809559', '202108030112', '5', 0.986899700);
INSERT INTO `t_model_output_knowledge`
VALUES ('15902314', '202108030210', '10', 0.797791800);
INSERT INTO `t_model_output_knowledge`
VALUES ('15909923', '202108030201', '8', 0.175862540);
INSERT INTO `t_model_output_knowledge`
VALUES ('15910701', '202108030126', '1', 0.985527400);
INSERT INTO `t_model_output_knowledge`
VALUES ('16019650', '202108030117', '9', 0.074955260);
INSERT INTO `t_model_output_knowledge`
VALUES ('16073735', '202108030407', '11', 0.679975150);
INSERT INTO `t_model_output_knowledge`
VALUES ('16091297', '202009070109', '9', 0.079471690);
INSERT INTO `t_model_output_knowledge`
VALUES ('16214299', '202108030322', '7', 0.093457980);
INSERT INTO `t_model_output_knowledge`
VALUES ('16288061', '201508010709', '8', 0.102524824);
INSERT INTO `t_model_output_knowledge`
VALUES ('16297456', '202108030419', '6', 0.008080503);
INSERT INTO `t_model_output_knowledge`
VALUES ('16360210', '202108030308', '10', 0.088465370);
INSERT INTO `t_model_output_knowledge`
VALUES ('16393619', '202108030329', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('16478800', '202108030409', '1', 0.994058130);
INSERT INTO `t_model_output_knowledge`
VALUES ('16539046', '202108030126', '8', 0.738265040);
INSERT INTO `t_model_output_knowledge`
VALUES ('16568995', '202108030402', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('16608657', '202108030313', '3', 0.821021560);
INSERT INTO `t_model_output_knowledge`
VALUES ('16670057', '202108030329', '8', 0.156840310);
INSERT INTO `t_model_output_knowledge`
VALUES ('16766230', '202108030411', '1', 0.967442750);
INSERT INTO `t_model_output_knowledge`
VALUES ('16869185', '202108030324', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('16973055', '202108030207', '9', 0.879225430);
INSERT INTO `t_model_output_knowledge`
VALUES ('17041533', '202108030116', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('17084891', '201810040108', '11', 0.981450200);
INSERT INTO `t_model_output_knowledge`
VALUES ('17159620', '202108030325', '6', 0.087929310);
INSERT INTO `t_model_output_knowledge`
VALUES ('17207167', '202108030113', '6', 0.007618528);
INSERT INTO `t_model_output_knowledge`
VALUES ('17304491', '202108030421', '7', 0.770785750);
INSERT INTO `t_model_output_knowledge`
VALUES ('17358833', '202108030229', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('17456282', '202108030126', '7', 0.718043400);
INSERT INTO `t_model_output_knowledge`
VALUES ('17528233', '202108030412', '8', 0.971393760);
INSERT INTO `t_model_output_knowledge`
VALUES ('17542833', '202108030202', '6', 0.012882016);
INSERT INTO `t_model_output_knowledge`
VALUES ('17629845', '202108030214', '7', 0.201156820);
INSERT INTO `t_model_output_knowledge`
VALUES ('17701160', '202108030424', '11', 0.984594800);
INSERT INTO `t_model_output_knowledge`
VALUES ('17807032', '202108030304', '9', 0.139319670);
INSERT INTO `t_model_output_knowledge`
VALUES ('17836502', '202108030307', '7', 0.051557000);
INSERT INTO `t_model_output_knowledge`
VALUES ('17950514', '202108030113', '3', 0.011489092);
INSERT INTO `t_model_output_knowledge`
VALUES ('17955166', '202108030121', '3', 0.066224320);
INSERT INTO `t_model_output_knowledge`
VALUES ('18048384', '202108030215', '11', 0.985133300);
INSERT INTO `t_model_output_knowledge`
VALUES ('18085745', '202108030312', '6', 0.004196413);
INSERT INTO `t_model_output_knowledge`
VALUES ('18109217', '202108030315', '3', 0.058569554);
INSERT INTO `t_model_output_knowledge`
VALUES ('18122572', '202108030417', '7', 0.151151100);
INSERT INTO `t_model_output_knowledge`
VALUES ('18141743', '202108030124', '7', 0.058718810);
INSERT INTO `t_model_output_knowledge`
VALUES ('18190627', '202108030203', '11', 0.987543940);
INSERT INTO `t_model_output_knowledge`
VALUES ('18200572', '202009070109', '7', 0.084475110);
INSERT INTO `t_model_output_knowledge`
VALUES ('18215973', '202108030402', '5', 0.981485100);
INSERT INTO `t_model_output_knowledge`
VALUES ('18218566', '202108030418', '9', 0.050900120);
INSERT INTO `t_model_output_knowledge`
VALUES ('18290986', '201508010709', '7', 0.032351125);
INSERT INTO `t_model_output_knowledge`
VALUES ('18480105', '202108030418', '1', 0.847681100);
INSERT INTO `t_model_output_knowledge`
VALUES ('18547771', '202108030213', '11', 0.990291900);
INSERT INTO `t_model_output_knowledge`
VALUES ('18587555', '202108030211', '7', 0.011026599);
INSERT INTO `t_model_output_knowledge`
VALUES ('18651555', '202108030120', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('18796719', '202108030201', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('18820245', '202108030304', '7', 0.205237090);
INSERT INTO `t_model_output_knowledge`
VALUES ('19046140', '202108030219', '7', 0.517025400);
INSERT INTO `t_model_output_knowledge`
VALUES ('19127329', '202009070125', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('19157794', '202108030116', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('19264395', '202108030330', '5', 0.840119540);
INSERT INTO `t_model_output_knowledge`
VALUES ('19296413', '202108030301', '11', 0.255064800);
INSERT INTO `t_model_output_knowledge`
VALUES ('19309562', '202108030223', '8', 0.108638370);
INSERT INTO `t_model_output_knowledge`
VALUES ('19391352', '202108030412', '7', 0.526598750);
INSERT INTO `t_model_output_knowledge`
VALUES ('19434551', '202108030412', '5', 0.993857560);
INSERT INTO `t_model_output_knowledge`
VALUES ('19549833', '202108030229', '5', 0.995555800);
INSERT INTO `t_model_output_knowledge`
VALUES ('19573691', '202108030403', '3', 0.016388321);
INSERT INTO `t_model_output_knowledge`
VALUES ('19573751', '202108030323', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('19640930', '202108030320', '10', 0.582389650);
INSERT INTO `t_model_output_knowledge`
VALUES ('19673510', '202108030304', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('19688264', '202108030218', '6', 0.055764050);
INSERT INTO `t_model_output_knowledge`
VALUES ('19739454', '202108030417', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('19800361', '202108030219', '8', 0.444789170);
INSERT INTO `t_model_output_knowledge`
VALUES ('19891881', '202108030423', '10', 0.009369548);
INSERT INTO `t_model_output_knowledge`
VALUES ('19918631', '202108030216', '8', 0.010014034);
INSERT INTO `t_model_output_knowledge`
VALUES ('19937398', '202108030410', '10', 0.013420859);
INSERT INTO `t_model_output_knowledge`
VALUES ('19938645', '202108030128', '3', 0.004468325);
INSERT INTO `t_model_output_knowledge`
VALUES ('20129538', '202108030407', '10', 0.053287696);
INSERT INTO `t_model_output_knowledge`
VALUES ('20187736', '202108030124', '3', 0.034481010);
INSERT INTO `t_model_output_knowledge`
VALUES ('20205569', '202108030422', '7', 0.014173559);
INSERT INTO `t_model_output_knowledge`
VALUES ('20222570', '202108030225', '5', 0.977286040);
INSERT INTO `t_model_output_knowledge`
VALUES ('20281466', '202108030404', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('20429592', '202108030414', '10', 0.230646100);
INSERT INTO `t_model_output_knowledge`
VALUES ('20465519', '202108030230', '1', 0.973670540);
INSERT INTO `t_model_output_knowledge`
VALUES ('20470223', '202108030202', '8', 0.197997820);
INSERT INTO `t_model_output_knowledge`
VALUES ('20545054', '202108030114', '1', 0.996750700);
INSERT INTO `t_model_output_knowledge`
VALUES ('20577965', '202108030210', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('20588961', '202108030206', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('20667359', '202108030409', '11', 0.991793700);
INSERT INTO `t_model_output_knowledge`
VALUES ('20725126', '202108030318', '6', 0.524599970);
INSERT INTO `t_model_output_knowledge`
VALUES ('20783826', '202108030207', '5', 0.989043350);
INSERT INTO `t_model_output_knowledge`
VALUES ('20850564', '201508010709', '10', 0.011289431);
INSERT INTO `t_model_output_knowledge`
VALUES ('20851346', '202108030322', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('20907915', '202108030428', '11', 0.970477640);
INSERT INTO `t_model_output_knowledge`
VALUES ('20936243', '202108030115', '9', 0.963266800);
INSERT INTO `t_model_output_knowledge`
VALUES ('20987439', '202108030419', '11', 0.996888800);
INSERT INTO `t_model_output_knowledge`
VALUES ('21144992', '202108030129', '6', 0.004210235);
INSERT INTO `t_model_output_knowledge`
VALUES ('21196671', '202108030223', '6', 0.038982127);
INSERT INTO `t_model_output_knowledge`
VALUES ('21196968', '202108030415', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('21209779', '202108030316', '9', 0.046297450);
INSERT INTO `t_model_output_knowledge`
VALUES ('21330983', '202108030402', '3', 0.652736300);
INSERT INTO `t_model_output_knowledge`
VALUES ('21348344', '202108030217', '6', 0.069874264);
INSERT INTO `t_model_output_knowledge`
VALUES ('21402667', '201810040106', '1', 0.992668000);
INSERT INTO `t_model_output_knowledge`
VALUES ('21422588', '202108030422', '1', 0.879565800);
INSERT INTO `t_model_output_knowledge`
VALUES ('21534258', '202108030123', '11', 0.989913100);
INSERT INTO `t_model_output_knowledge`
VALUES ('21685469', '202108030121', '7', 0.090698220);
INSERT INTO `t_model_output_knowledge`
VALUES ('21696145', '202108030201', '1', 0.985543000);
INSERT INTO `t_model_output_knowledge`
VALUES ('21734476', '202108030321', '7', 0.043173462);
INSERT INTO `t_model_output_knowledge`
VALUES ('21810435', '202108030122', '3', 0.014809370);
INSERT INTO `t_model_output_knowledge`
VALUES ('21886311', '202108030321', '3', 0.010929887);
INSERT INTO `t_model_output_knowledge`
VALUES ('21901182', '202108030209', '5', 0.990265400);
INSERT INTO `t_model_output_knowledge`
VALUES ('21927638', '202108030118', '7', 0.753224100);
INSERT INTO `t_model_output_knowledge`
VALUES ('21980719', '202108030227', '5', 0.983589400);
INSERT INTO `t_model_output_knowledge`
VALUES ('21981576', '202108030112', '11', 0.960325500);
INSERT INTO `t_model_output_knowledge`
VALUES ('22028697', '202108030208', '5', 0.984754560);
INSERT INTO `t_model_output_knowledge`
VALUES ('22164503', '202108030210', '8', 0.855456770);
INSERT INTO `t_model_output_knowledge`
VALUES ('22205288', '202108030318', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22285393', '202108030112', '10', 0.008427672);
INSERT INTO `t_model_output_knowledge`
VALUES ('22314589', '202108030216', '3', 0.010916143);
INSERT INTO `t_model_output_knowledge`
VALUES ('22328817', '202108030130', '11', 0.983417700);
INSERT INTO `t_model_output_knowledge`
VALUES ('22363025', '202108030306', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22374721', '202108030303', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22402134', '202108030109', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22426530', '202108030116', '8', 0.175599280);
INSERT INTO `t_model_output_knowledge`
VALUES ('22466064', '202108030125', '9', 0.021772116);
INSERT INTO `t_model_output_knowledge`
VALUES ('22692828', '202108030224', '11', 0.991220950);
INSERT INTO `t_model_output_knowledge`
VALUES ('22742343', '202108030328', '5', 0.993591600);
INSERT INTO `t_model_output_knowledge`
VALUES ('22778093', '202108030429', '8', 0.639377360);
INSERT INTO `t_model_output_knowledge`
VALUES ('22796226', '202108030124', '9', 0.132321900);
INSERT INTO `t_model_output_knowledge`
VALUES ('22850183', '202108030220', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22880533', '202108030217', '1', 0.995792270);
INSERT INTO `t_model_output_knowledge`
VALUES ('22907860', '202108030306', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('22956725', '202108030127', '5', 0.982920470);
INSERT INTO `t_model_output_knowledge`
VALUES ('22989713', '202108030401', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('23000232', '202108030423', '7', 0.014019912);
INSERT INTO `t_model_output_knowledge`
VALUES ('23018784', '202108030113', '1', 0.978119130);
INSERT INTO `t_model_output_knowledge`
VALUES ('23051099', '202108030425', '3', 0.705333400);
INSERT INTO `t_model_output_knowledge`
VALUES ('23182075', '202006010214', '9', 0.792861600);
INSERT INTO `t_model_output_knowledge`
VALUES ('23190816', '202108030324', '3', 0.074651390);
INSERT INTO `t_model_output_knowledge`
VALUES ('23226895', '202108030118', '6', 0.006174613);
INSERT INTO `t_model_output_knowledge`
VALUES ('23310987', '202108030124', '5', 0.644657850);
INSERT INTO `t_model_output_knowledge`
VALUES ('23356411', '202108030108', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('23371641', '202108030417', '3', 0.245728700);
INSERT INTO `t_model_output_knowledge`
VALUES ('23470738', '202108030326', '1', 0.996750700);
INSERT INTO `t_model_output_knowledge`
VALUES ('23512093', '202108030111', '3', 0.149265290);
INSERT INTO `t_model_output_knowledge`
VALUES ('23691580', '202108030226', '3', 0.847220600);
INSERT INTO `t_model_output_knowledge`
VALUES ('23699311', '202108030423', '11', 0.960537700);
INSERT INTO `t_model_output_knowledge`
VALUES ('23728987', '202108030129', '7', 0.068200760);
INSERT INTO `t_model_output_knowledge`
VALUES ('23729598', '202108030312', '3', 0.082378500);
INSERT INTO `t_model_output_knowledge`
VALUES ('23749620', '202108030218', '7', 0.068180494);
INSERT INTO `t_model_output_knowledge`
VALUES ('23762311', '202108030420', '1', 0.967547300);
INSERT INTO `t_model_output_knowledge`
VALUES ('23795888', '202108030309', '11', 0.946061700);
INSERT INTO `t_model_output_knowledge`
VALUES ('24085197', '202108030407', '9', 0.286056730);
INSERT INTO `t_model_output_knowledge`
VALUES ('24096392', '202108030427', '7', 0.743942600);
INSERT INTO `t_model_output_knowledge`
VALUES ('24138568', '202108030128', '5', 0.988182700);
INSERT INTO `t_model_output_knowledge`
VALUES ('24212382', '202108030413', '9', 0.301090720);
INSERT INTO `t_model_output_knowledge`
VALUES ('24224216', '202108030301', '7', 0.018059626);
INSERT INTO `t_model_output_knowledge`
VALUES ('24235166', '202108030109', '8', 0.945578630);
INSERT INTO `t_model_output_knowledge`
VALUES ('24394966', '202108030319', '8', 0.895312000);
INSERT INTO `t_model_output_knowledge`
VALUES ('24434365', '202108030415', '11', 0.993069050);
INSERT INTO `t_model_output_knowledge`
VALUES ('24495669', '202108030227', '6', 0.005957860);
INSERT INTO `t_model_output_knowledge`
VALUES ('24565067', '202108030316', '11', 0.991623700);
INSERT INTO `t_model_output_knowledge`
VALUES ('24572258', '202108030408', '9', 0.145775400);
INSERT INTO `t_model_output_knowledge`
VALUES ('24634179', '202108030421', '6', 0.015963886);
INSERT INTO `t_model_output_knowledge`
VALUES ('24684489', '202108030320', '9', 0.854836600);
INSERT INTO `t_model_output_knowledge`
VALUES ('24742242', '202108030323', '8', 0.099121680);
INSERT INTO `t_model_output_knowledge`
VALUES ('24767382', '202108030415', '5', 0.994344350);
INSERT INTO `t_model_output_knowledge`
VALUES ('25058504', '202108030120', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('25195320', '202108030317', '6', 0.468630200);
INSERT INTO `t_model_output_knowledge`
VALUES ('25272012', '202108030125', '10', 0.012325740);
INSERT INTO `t_model_output_knowledge`
VALUES ('25294872', '202108030303', '6', 0.015222195);
INSERT INTO `t_model_output_knowledge`
VALUES ('25432533', '202108030124', '6', 0.007058386);
INSERT INTO `t_model_output_knowledge`
VALUES ('25509249', '202108030219', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('25604692', '202108030117', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('25701665', '202108030221', '9', 0.599087500);
INSERT INTO `t_model_output_knowledge`
VALUES ('25857667', '202108030402', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('25883864', '202108030124', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('25887920', '202108030329', '9', 0.840297040);
INSERT INTO `t_model_output_knowledge`
VALUES ('26201766', '202108030306', '9', 0.920515000);
INSERT INTO `t_model_output_knowledge`
VALUES ('26227508', '202108030316', '6', 0.076847320);
INSERT INTO `t_model_output_knowledge`
VALUES ('26304772', '202108030216', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('26335694', '202108030309', '7', 0.765237150);
INSERT INTO `t_model_output_knowledge`
VALUES ('26336122', '202108030130', '9', 0.152860400);
INSERT INTO `t_model_output_knowledge`
VALUES ('26340253', '202108030114', '10', 0.014136056);
INSERT INTO `t_model_output_knowledge`
VALUES ('26374281', '202108030313', '7', 0.070827484);
INSERT INTO `t_model_output_knowledge`
VALUES ('26403519', '202108030311', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('26419899', '202108030317', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('26504176', '202108030230', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('26656231', '202108030318', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('26690160', '202108030206', '6', 0.009888629);
INSERT INTO `t_model_output_knowledge`
VALUES ('26706986', '202108030105', '5', 0.996504070);
INSERT INTO `t_model_output_knowledge`
VALUES ('27004488', '202108030216', '11', 0.968176660);
INSERT INTO `t_model_output_knowledge`
VALUES ('27113492', '202108030103', '5', 0.996504070);
INSERT INTO `t_model_output_knowledge`
VALUES ('27113836', '202108030128', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('27239716', '202009070109', '11', 0.972397400);
INSERT INTO `t_model_output_knowledge`
VALUES ('27250090', '202108030303', '3', 0.116965910);
INSERT INTO `t_model_output_knowledge`
VALUES ('27268563', '202108030322', '1', 0.943344000);
INSERT INTO `t_model_output_knowledge`
VALUES ('27271301', '202108030226', '9', 0.082791240);
INSERT INTO `t_model_output_knowledge`
VALUES ('27546819', '202108030110', '8', 0.531965850);
INSERT INTO `t_model_output_knowledge`
VALUES ('27645709', '202108030303', '11', 0.991307440);
INSERT INTO `t_model_output_knowledge`
VALUES ('27676639', '202108030219', '5', 0.978292500);
INSERT INTO `t_model_output_knowledge`
VALUES ('27679626', '202108030216', '5', 0.984309550);
INSERT INTO `t_model_output_knowledge`
VALUES ('27686926', '202108030127', '11', 0.992718460);
INSERT INTO `t_model_output_knowledge`
VALUES ('27760857', '202108030325', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('27766773', '202108030121', '1', 0.970825850);
INSERT INTO `t_model_output_knowledge`
VALUES ('27775449', '202108030204', '5', 0.979359750);
INSERT INTO `t_model_output_knowledge`
VALUES ('27795222', '202108030319', '1', 0.971341700);
INSERT INTO `t_model_output_knowledge`
VALUES ('27809427', '202108030403', '5', 0.990168100);
INSERT INTO `t_model_output_knowledge`
VALUES ('27817261', '202108030406', '10', 0.026103297);
INSERT INTO `t_model_output_knowledge`
VALUES ('27851937', '202108030216', '9', 0.058264140);
INSERT INTO `t_model_output_knowledge`
VALUES ('27863820', '202108030106', '9', 0.637549900);
INSERT INTO `t_model_output_knowledge`
VALUES ('27896858', '202108030406', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('27908712', '202108030221', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('28035455', '201810040106', '6', 0.047058820);
INSERT INTO `t_model_output_knowledge`
VALUES ('28074172', '202108030230', '10', 0.014370092);
INSERT INTO `t_model_output_knowledge`
VALUES ('28478629', '202108030423', '1', 0.959251460);
INSERT INTO `t_model_output_knowledge`
VALUES ('28523888', '202108030425', '9', 0.693534430);
INSERT INTO `t_model_output_knowledge`
VALUES ('28546136', '202108030128', '10', 0.005476747);
INSERT INTO `t_model_output_knowledge`
VALUES ('28567792', '202108030312', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('28581555', '202108030414', '3', 0.608319000);
INSERT INTO `t_model_output_knowledge`
VALUES ('28787192', '202108030327', '10', 0.004868545);
INSERT INTO `t_model_output_knowledge`
VALUES ('28869611', '202108030401', '8', 0.952973000);
INSERT INTO `t_model_output_knowledge`
VALUES ('28882892', '202108030118', '9', 0.912700650);
INSERT INTO `t_model_output_knowledge`
VALUES ('28932401', '202108030323', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('29167605', '202108030319', '3', 0.085495844);
INSERT INTO `t_model_output_knowledge`
VALUES ('29170997', '202108030328', '1', 0.995759800);
INSERT INTO `t_model_output_knowledge`
VALUES ('29225045', '202108030123', '1', 0.996176600);
INSERT INTO `t_model_output_knowledge`
VALUES ('29630978', '202108030111', '11', 0.996183450);
INSERT INTO `t_model_output_knowledge`
VALUES ('29818888', '202108030121', '8', 0.067338230);
INSERT INTO `t_model_output_knowledge`
VALUES ('29861541', '202108030103', '11', 0.821358200);
INSERT INTO `t_model_output_knowledge`
VALUES ('29872600', '202108030120', '5', 0.987262900);
INSERT INTO `t_model_output_knowledge`
VALUES ('29938485', '202108030310', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('29975707', '202108030327', '6', 0.004868545);
INSERT INTO `t_model_output_knowledge`
VALUES ('30049168', '202108030421', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('30057753', '202108030412', '3', 0.383390040);
INSERT INTO `t_model_output_knowledge`
VALUES ('30139555', '201810040108', '8', 0.838012750);
INSERT INTO `t_model_output_knowledge`
VALUES ('30167930', '202108030428', '1', 0.979556700);
INSERT INTO `t_model_output_knowledge`
VALUES ('30201481', '202108030220', '1', 0.978483300);
INSERT INTO `t_model_output_knowledge`
VALUES ('30405127', '202108030429', '10', 0.035502330);
INSERT INTO `t_model_output_knowledge`
VALUES ('30530600', '202108030207', '10', 0.758296600);
INSERT INTO `t_model_output_knowledge`
VALUES ('30546235', '202108030312', '11', 0.929574430);
INSERT INTO `t_model_output_knowledge`
VALUES ('30559552', '202108030420', '5', 0.979228500);
INSERT INTO `t_model_output_knowledge`
VALUES ('30579253', '202108030325', '11', 0.932610600);
INSERT INTO `t_model_output_knowledge`
VALUES ('30602268', '202108030209', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('30715503', '202108030204', '6', 0.031787746);
INSERT INTO `t_model_output_knowledge`
VALUES ('30770589', '202108030109', '7', 0.029854523);
INSERT INTO `t_model_output_knowledge`
VALUES ('30772750', '202108030119', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('30799256', '202108030323', '3', 0.153742490);
INSERT INTO `t_model_output_knowledge`
VALUES ('30865243', '202108030225', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('30896090', '202108030317', '11', 0.952561100);
INSERT INTO `t_model_output_knowledge`
VALUES ('30925004', '202108030320', '5', 0.995574950);
INSERT INTO `t_model_output_knowledge`
VALUES ('30937584', '201508010709', '3', 0.017758468);
INSERT INTO `t_model_output_knowledge`
VALUES ('30975131', '202108030119', '11', 0.996487860);
INSERT INTO `t_model_output_knowledge`
VALUES ('31048745', '202108030313', '11', 0.992949960);
INSERT INTO `t_model_output_knowledge`
VALUES ('31287771', '202108030112', '3', 0.010854078);
INSERT INTO `t_model_output_knowledge`
VALUES ('31403776', '202108030324', '7', 0.840272000);
INSERT INTO `t_model_output_knowledge`
VALUES ('31412766', '202009070109', '6', 0.007809402);
INSERT INTO `t_model_output_knowledge`
VALUES ('31430851', '202108030204', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('31705736', '202108030327', '3', 0.025354085);
INSERT INTO `t_model_output_knowledge`
VALUES ('31744578', '202108030122', '5', 0.985952730);
INSERT INTO `t_model_output_knowledge`
VALUES ('31760368', '202108030202', '7', 0.086642460);
INSERT INTO `t_model_output_knowledge`
VALUES ('31938037', '202108030204', '9', 0.019991312);
INSERT INTO `t_model_output_knowledge`
VALUES ('32001283', '202108030111', '10', 0.023545977);
INSERT INTO `t_model_output_knowledge`
VALUES ('32046010', '202108030313', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('32070396', '202108030304', '11', 0.992599000);
INSERT INTO `t_model_output_knowledge`
VALUES ('32073393', '202108030325', '10', 0.087929310);
INSERT INTO `t_model_output_knowledge`
VALUES ('32161707', '202108030305', '6', 0.008518493);
INSERT INTO `t_model_output_knowledge`
VALUES ('32170422', '201810040106', '3', 0.113702185);
INSERT INTO `t_model_output_knowledge`
VALUES ('32326675', '202108030223', '1', 0.996557000);
INSERT INTO `t_model_output_knowledge`
VALUES ('32494130', '201508010709', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('32662098', '202108030104', '10', 0.007604114);
INSERT INTO `t_model_output_knowledge`
VALUES ('32690743', '202108030222', '9', 0.137852670);
INSERT INTO `t_model_output_knowledge`
VALUES ('32809905', '202108030325', '9', 0.338553600);
INSERT INTO `t_model_output_knowledge`
VALUES ('32853876', '202108030304', '10', 0.077939220);
INSERT INTO `t_model_output_knowledge`
VALUES ('32956751', '202108030418', '3', 0.026977796);
INSERT INTO `t_model_output_knowledge`
VALUES ('33020228', '201810040106', '11', 0.957657000);
INSERT INTO `t_model_output_knowledge`
VALUES ('33093068', '202108030123', '8', 0.851023200);
INSERT INTO `t_model_output_knowledge`
VALUES ('33109318', '202108030327', '7', 0.083502670);
INSERT INTO `t_model_output_knowledge`
VALUES ('33197474', '202108030211', '1', 0.976584200);
INSERT INTO `t_model_output_knowledge`
VALUES ('33254831', '202108030101', '10', 0.037767373);
INSERT INTO `t_model_output_knowledge`
VALUES ('33359764', '202009070109', '5', 0.985004070);
INSERT INTO `t_model_output_knowledge`
VALUES ('33414802', '202108030116', '7', 0.052976053);
INSERT INTO `t_model_output_knowledge`
VALUES ('33432839', '202108030311', '8', 0.972346500);
INSERT INTO `t_model_output_knowledge`
VALUES ('33448599', '202108030408', '11', 0.986041500);
INSERT INTO `t_model_output_knowledge`
VALUES ('33460063', '202108030126', '6', 0.005172946);
INSERT INTO `t_model_output_knowledge`
VALUES ('33512437', '202108030421', '3', 0.455245000);
INSERT INTO `t_model_output_knowledge`
VALUES ('33518069', '201810040106', '7', 0.749503250);
INSERT INTO `t_model_output_knowledge`
VALUES ('33598977', '202108030420', '9', 0.410065320);
INSERT INTO `t_model_output_knowledge`
VALUES ('33774145', '202108030208', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('33883911', '202108030214', '6', 0.039228063);
INSERT INTO `t_model_output_knowledge`
VALUES ('33944982', '202108030309', '8', 0.810000960);
INSERT INTO `t_model_output_knowledge`
VALUES ('33966487', '202108030405', '7', 0.291580830);
INSERT INTO `t_model_output_knowledge`
VALUES ('34009369', '202108030429', '3', 0.415964300);
INSERT INTO `t_model_output_knowledge`
VALUES ('34141744', '202108030401', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('34149941', '202108030118', '5', 0.988185760);
INSERT INTO `t_model_output_knowledge`
VALUES ('34192412', '202108030220', '8', 0.044099335);
INSERT INTO `t_model_output_knowledge`
VALUES ('34210730', '202108030101', '9', 0.086436560);
INSERT INTO `t_model_output_knowledge`
VALUES ('34329646', '202108030214', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('34403816', '202108030117', '3', 0.107267340);
INSERT INTO `t_model_output_knowledge`
VALUES ('34479577', '202108030302', '9', 0.039291892);
INSERT INTO `t_model_output_knowledge`
VALUES ('34520122', '202108030229', '9', 0.068194985);
INSERT INTO `t_model_output_knowledge`
VALUES ('34644656', '202108030412', '11', 0.993299100);
INSERT INTO `t_model_output_knowledge`
VALUES ('34704777', '202009070125', '6', 0.045707450);
INSERT INTO `t_model_output_knowledge`
VALUES ('34744695', '202108030404', '5', 0.993477460);
INSERT INTO `t_model_output_knowledge`
VALUES ('34952151', '202108030417', '6', 0.023809886);
INSERT INTO `t_model_output_knowledge`
VALUES ('35050274', '202108030318', '11', 0.984389960);
INSERT INTO `t_model_output_knowledge`
VALUES ('35094490', '202108030308', '11', 0.994662640);
INSERT INTO `t_model_output_knowledge`
VALUES ('35111253', '202108030415', '9', 0.898807470);
INSERT INTO `t_model_output_knowledge`
VALUES ('35139595', '201810040106', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('35349817', '202108030221', '7', 0.626383200);
INSERT INTO `t_model_output_knowledge`
VALUES ('35391852', '202108030424', '7', 0.333175450);
INSERT INTO `t_model_output_knowledge`
VALUES ('35487010', '202108030218', '8', 0.218702660);
INSERT INTO `t_model_output_knowledge`
VALUES ('35518518', '202108030206', '10', 0.009888629);
INSERT INTO `t_model_output_knowledge`
VALUES ('35529416', '202108030102', '8', 0.729176460);
INSERT INTO `t_model_output_knowledge`
VALUES ('35603075', '202108030223', '11', 0.971867800);
INSERT INTO `t_model_output_knowledge`
VALUES ('35637996', '202108030423', '9', 0.143821980);
INSERT INTO `t_model_output_knowledge`
VALUES ('35662076', '202108030222', '10', 0.016214704);
INSERT INTO `t_model_output_knowledge`
VALUES ('35673129', '202108030316', '1', 0.967696960);
INSERT INTO `t_model_output_knowledge`
VALUES ('35759985', '201810040108', '9', 0.194281940);
INSERT INTO `t_model_output_knowledge`
VALUES ('35952585', '202108030427', '8', 0.333188400);
INSERT INTO `t_model_output_knowledge`
VALUES ('35960235', '202108030320', '11', 0.981428740);
INSERT INTO `t_model_output_knowledge`
VALUES ('36182518', '202108030201', '5', 0.985460800);
INSERT INTO `t_model_output_knowledge`
VALUES ('36202277', '202108030122', '6', 0.005006817);
INSERT INTO `t_model_output_knowledge`
VALUES ('36277274', '202108030103', '6', 0.007394602);
INSERT INTO `t_model_output_knowledge`
VALUES ('36317809', '202108030311', '6', 0.075921150);
INSERT INTO `t_model_output_knowledge`
VALUES ('36338538', '202108030426', '3', 0.084219010);
INSERT INTO `t_model_output_knowledge`
VALUES ('36414659', '202108030201', '3', 0.094320780);
INSERT INTO `t_model_output_knowledge`
VALUES ('36449366', '202108030229', '3', 0.696189000);
INSERT INTO `t_model_output_knowledge`
VALUES ('36495746', '202108030207', '1', 0.996252360);
INSERT INTO `t_model_output_knowledge`
VALUES ('36526435', '202108030103', '7', 0.113258630);
INSERT INTO `t_model_output_knowledge`
VALUES ('36611193', '202108030427', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('36614059', '202108030420', '11', 0.399307760);
INSERT INTO `t_model_output_knowledge`
VALUES ('36650971', '202108030115', '6', 0.048519794);
INSERT INTO `t_model_output_knowledge`
VALUES ('36696790', '202108030409', '6', 0.007397630);
INSERT INTO `t_model_output_knowledge`
VALUES ('36888972', '202108030321', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('36995837', '202108030107', '8', 0.823982300);
INSERT INTO `t_model_output_knowledge`
VALUES ('37049856', '202108030416', '11', 0.972604750);
INSERT INTO `t_model_output_knowledge`
VALUES ('37144761', '202108030204', '7', 0.023649152);
INSERT INTO `t_model_output_knowledge`
VALUES ('37162482', '202108030127', '1', 0.990647260);
INSERT INTO `t_model_output_knowledge`
VALUES ('37302980', '202108030124', '1', 0.418203650);
INSERT INTO `t_model_output_knowledge`
VALUES ('37339429', '202108030325', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('37463769', '202108030205', '9', 0.126788880);
INSERT INTO `t_model_output_knowledge`
VALUES ('37474366', '202108030323', '7', 0.168824520);
INSERT INTO `t_model_output_knowledge`
VALUES ('37560925', '202108030330', '9', 0.026676552);
INSERT INTO `t_model_output_knowledge`
VALUES ('37630979', '202108030416', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('37767425', '202108030421', '9', 0.381357900);
INSERT INTO `t_model_output_knowledge`
VALUES ('37816552', '202108030214', '5', 0.990885850);
INSERT INTO `t_model_output_knowledge`
VALUES ('37837818', '202108030402', '8', 0.817423900);
INSERT INTO `t_model_output_knowledge`
VALUES ('37900865', '202006010214', '10', 0.019894348);
INSERT INTO `t_model_output_knowledge`
VALUES ('37913822', '202108030418', '11', 0.822930500);
INSERT INTO `t_model_output_knowledge`
VALUES ('37971421', '202108030321', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('37984151', '202108030410', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('38248144', '201810040108', '3', 0.079031780);
INSERT INTO `t_model_output_knowledge`
VALUES ('38270595', '202108030414', '9', 0.095238200);
INSERT INTO `t_model_output_knowledge`
VALUES ('38350069', '202108030411', '7', 0.031202314);
INSERT INTO `t_model_output_knowledge`
VALUES ('38493009', '202108030117', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('38517531', '202108030120', '9', 0.882612000);
INSERT INTO `t_model_output_knowledge`
VALUES ('38528588', '202108030426', '10', 0.008385574);
INSERT INTO `t_model_output_knowledge`
VALUES ('38539326', '202108030411', '11', 0.995656000);
INSERT INTO `t_model_output_knowledge`
VALUES ('38551785', '202108030119', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('38619188', '202108030104', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('38677861', '202108030222', '1', 0.997306350);
INSERT INTO `t_model_output_knowledge`
VALUES ('38818168', '202108030401', '7', 0.426909120);
INSERT INTO `t_model_output_knowledge`
VALUES ('38926019', '202108030229', '10', 0.081705210);
INSERT INTO `t_model_output_knowledge`
VALUES ('38970419', '202108030319', '11', 0.997232140);
INSERT INTO `t_model_output_knowledge`
VALUES ('39020509', '202108030313', '9', 0.052519944);
INSERT INTO `t_model_output_knowledge`
VALUES ('39043534', '202108030114', '11', 0.979732750);
INSERT INTO `t_model_output_knowledge`
VALUES ('39090328', '202108030215', '7', 0.834043400);
INSERT INTO `t_model_output_knowledge`
VALUES ('39129546', '202108030101', '1', 0.997736700);
INSERT INTO `t_model_output_knowledge`
VALUES ('39331889', '202108030201', '9', 0.286176950);
INSERT INTO `t_model_output_knowledge`
VALUES ('39402296', '202108030423', '5', 0.994900800);
INSERT INTO `t_model_output_knowledge`
VALUES ('39429009', '202108030106', '8', 0.687029400);
INSERT INTO `t_model_output_knowledge`
VALUES ('39460834', '202108030312', '9', 0.103174580);
INSERT INTO `t_model_output_knowledge`
VALUES ('39485868', '202108030117', '7', 0.036482643);
INSERT INTO `t_model_output_knowledge`
VALUES ('39489411', '202108030107', '10', 0.050152007);
INSERT INTO `t_model_output_knowledge`
VALUES ('39509219', '202108030330', '6', 0.026747545);
INSERT INTO `t_model_output_knowledge`
VALUES ('39514377', '202108030322', '3', 0.047327140);
INSERT INTO `t_model_output_knowledge`
VALUES ('39522517', '202108030110', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('39616193', '202108030310', '10', 0.135104840);
INSERT INTO `t_model_output_knowledge`
VALUES ('39634484', '202108030110', '7', 0.432472100);
INSERT INTO `t_model_output_knowledge`
VALUES ('39635456', '202108030218', '1', 0.997844930);
INSERT INTO `t_model_output_knowledge`
VALUES ('39712077', '202108030209', '6', 0.003292533);
INSERT INTO `t_model_output_knowledge`
VALUES ('39804597', '202108030417', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('39807882', '202108030410', '6', 0.013420859);
INSERT INTO `t_model_output_knowledge`
VALUES ('39817280', '202108030410', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('39846417', '202108030128', '8', 0.097078730);
INSERT INTO `t_model_output_knowledge`
VALUES ('39894962', '202108030406', '11', 0.990474050);
INSERT INTO `t_model_output_knowledge`
VALUES ('39910302', '202108030301', '8', 0.114043780);
INSERT INTO `t_model_output_knowledge`
VALUES ('39932300', '202108030403', '7', 0.063758420);
INSERT INTO `t_model_output_knowledge`
VALUES ('40150975', '202108030115', '11', 0.977379100);
INSERT INTO `t_model_output_knowledge`
VALUES ('40283742', '202108030315', '7', 0.055087227);
INSERT INTO `t_model_output_knowledge`
VALUES ('40325414', '202108030320', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('40409669', '202108030309', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('40441349', '202108030313', '5', 0.989457550);
INSERT INTO `t_model_output_knowledge`
VALUES ('40477472', '202108030320', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('40481576', '202108030411', '5', 0.979459700);
INSERT INTO `t_model_output_knowledge`
VALUES ('40502568', '202108030423', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('40666754', '202108030315', '5', 0.994273840);
INSERT INTO `t_model_output_knowledge`
VALUES ('40810738', '202108030227', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('40992723', '202108030114', '8', 0.773511400);
INSERT INTO `t_model_output_knowledge`
VALUES ('41159007', '202108030102', '9', 0.065135345);
INSERT INTO `t_model_output_knowledge`
VALUES ('41231599', '202108030120', '3', 0.784310000);
INSERT INTO `t_model_output_knowledge`
VALUES ('41266477', '202108030405', '11', 0.990800100);
INSERT INTO `t_model_output_knowledge`
VALUES ('41294955', '202108030309', '3', 0.010705816);
INSERT INTO `t_model_output_knowledge`
VALUES ('41320693', '202108030127', '10', 0.004303922);
INSERT INTO `t_model_output_knowledge`
VALUES ('41401603', '202108030319', '7', 0.157464550);
INSERT INTO `t_model_output_knowledge`
VALUES ('41507233', '201508010709', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('41526714', '202108030413', '1', 0.990117250);
INSERT INTO `t_model_output_knowledge`
VALUES ('41601990', '202108030226', '7', 0.196957980);
INSERT INTO `t_model_output_knowledge`
VALUES ('41625928', '202108030423', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('41816639', '202108030124', '11', 0.456064820);
INSERT INTO `t_model_output_knowledge`
VALUES ('41847415', '202108030203', '1', 0.986050550);
INSERT INTO `t_model_output_knowledge`
VALUES ('41855124', '202108030201', '11', 0.974520500);
INSERT INTO `t_model_output_knowledge`
VALUES ('41925148', '202108030209', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('42000352', '202108030121', '5', 0.981849600);
INSERT INTO `t_model_output_knowledge`
VALUES ('42020512', '202108030309', '1', 0.956592260);
INSERT INTO `t_model_output_knowledge`
VALUES ('42066325', '202108030309', '6', 0.045329710);
INSERT INTO `t_model_output_knowledge`
VALUES ('42077374', '202009070125', '7', 0.179361280);
INSERT INTO `t_model_output_knowledge`
VALUES ('42119238', '202108030121', '9', 0.749540270);
INSERT INTO `t_model_output_knowledge`
VALUES ('42150848', '202009070109', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('42203368', '202108030306', '7', 0.034578670);
INSERT INTO `t_model_output_knowledge`
VALUES ('42221031', '202108030325', '7', 0.250665460);
INSERT INTO `t_model_output_knowledge`
VALUES ('42320266', '202108030329', '6', 0.083287280);
INSERT INTO `t_model_output_knowledge`
VALUES ('42439719', '202108030314', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('42541644', '202108030103', '9', 0.117493050);
INSERT INTO `t_model_output_knowledge`
VALUES ('42545656', '202108030322', '11', 0.904234900);
INSERT INTO `t_model_output_knowledge`
VALUES ('42575704', '202108030203', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('42653539', '202108030101', '11', 0.744693800);
INSERT INTO `t_model_output_knowledge`
VALUES ('42686721', '202108030426', '6', 0.008385574);
INSERT INTO `t_model_output_knowledge`
VALUES ('42688209', '202108030212', '3', 0.077235356);
INSERT INTO `t_model_output_knowledge`
VALUES ('42704354', '202108030307', '9', 0.866709300);
INSERT INTO `t_model_output_knowledge`
VALUES ('42711684', '202108030305', '7', 0.065919810);
INSERT INTO `t_model_output_knowledge`
VALUES ('42769266', '202108030215', '1', 0.971114100);
INSERT INTO `t_model_output_knowledge`
VALUES ('42991545', '202108030425', '6', 0.054459583);
INSERT INTO `t_model_output_knowledge`
VALUES ('43024560', '202108030203', '8', 0.129866200);
INSERT INTO `t_model_output_knowledge`
VALUES ('43036746', '202108030310', '9', 0.911121900);
INSERT INTO `t_model_output_knowledge`
VALUES ('43046806', '202108030313', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('43166921', '202108030319', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('43187636', '202108030225', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('43330279', '202108030305', '10', 0.008518493);
INSERT INTO `t_model_output_knowledge`
VALUES ('43335440', '202108030426', '1', 0.968911950);
INSERT INTO `t_model_output_knowledge`
VALUES ('43377853', '202108030229', '8', 0.833849970);
INSERT INTO `t_model_output_knowledge`
VALUES ('43434236', '202108030417', '11', 0.920925200);
INSERT INTO `t_model_output_knowledge`
VALUES ('43485438', '202108030404', '9', 0.094418630);
INSERT INTO `t_model_output_knowledge`
VALUES ('43603353', '202108030302', '6', 0.039126083);
INSERT INTO `t_model_output_knowledge`
VALUES ('43652486', '202108030130', '3', 0.063448250);
INSERT INTO `t_model_output_knowledge`
VALUES ('43716379', '202108030324', '9', 0.929726300);
INSERT INTO `t_model_output_knowledge`
VALUES ('43765955', '202108030109', '6', 0.007260595);
INSERT INTO `t_model_output_knowledge`
VALUES ('43787459', '202108030417', '5', 0.980781700);
INSERT INTO `t_model_output_knowledge`
VALUES ('43830204', '202108030226', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('43896349', '202108030425', '7', 0.873999900);
INSERT INTO `t_model_output_knowledge`
VALUES ('44019667', '202108030221', '10', 0.014691204);
INSERT INTO `t_model_output_knowledge`
VALUES ('44064420', '202108030412', '1', 0.994218000);
INSERT INTO `t_model_output_knowledge`
VALUES ('44105140', '202108030111', '5', 0.987250700);
INSERT INTO `t_model_output_knowledge`
VALUES ('44242594', '202009070125', '8', 0.933477100);
INSERT INTO `t_model_output_knowledge`
VALUES ('44328094', '202108030312', '8', 0.885035300);
INSERT INTO `t_model_output_knowledge`
VALUES ('44348653', '202108030316', '10', 0.076847320);
INSERT INTO `t_model_output_knowledge`
VALUES ('44589030', '202108030304', '8', 0.241038840);
INSERT INTO `t_model_output_knowledge`
VALUES ('44761986', '202108030410', '3', 0.047081150);
INSERT INTO `t_model_output_knowledge`
VALUES ('44788119', '202108030113', '5', 0.996547160);
INSERT INTO `t_model_output_knowledge`
VALUES ('44791333', '202108030415', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('44851442', '202108030125', '6', 0.012325740);
INSERT INTO `t_model_output_knowledge`
VALUES ('44949830', '202108030418', '8', 0.284977700);
INSERT INTO `t_model_output_knowledge`
VALUES ('44955643', '202108030325', '1', 0.992668000);
INSERT INTO `t_model_output_knowledge`
VALUES ('44962791', '202108030403', '6', 0.020539080);
INSERT INTO `t_model_output_knowledge`
VALUES ('45085062', '202108030319', '6', 0.043442488);
INSERT INTO `t_model_output_knowledge`
VALUES ('45193401', '202108030426', '9', 0.192669620);
INSERT INTO `t_model_output_knowledge`
VALUES ('45250373', '202108030117', '6', 0.025380060);
INSERT INTO `t_model_output_knowledge`
VALUES ('45250571', '202108030320', '8', 0.902974250);
INSERT INTO `t_model_output_knowledge`
VALUES ('45308429', '202108030225', '9', 0.036025815);
INSERT INTO `t_model_output_knowledge`
VALUES ('45341576', '202108030205', '7', 0.224065570);
INSERT INTO `t_model_output_knowledge`
VALUES ('45487971', '202108030214', '9', 0.135128900);
INSERT INTO `t_model_output_knowledge`
VALUES ('45616125', '202108030305', '5', 0.983065500);
INSERT INTO `t_model_output_knowledge`
VALUES ('45662429', '202108030210', '9', 0.587119040);
INSERT INTO `t_model_output_knowledge`
VALUES ('45834147', '202108030316', '7', 0.021090334);
INSERT INTO `t_model_output_knowledge`
VALUES ('45926802', '202108030224', '9', 0.122797270);
INSERT INTO `t_model_output_knowledge`
VALUES ('45968131', '202108030202', '9', 0.089056700);
INSERT INTO `t_model_output_knowledge`
VALUES ('46009207', '202108030112', '6', 0.008427672);
INSERT INTO `t_model_output_knowledge`
VALUES ('46074653', '202108030324', '11', 0.995820400);
INSERT INTO `t_model_output_knowledge`
VALUES ('46082502', '202108030203', '5', 0.979889750);
INSERT INTO `t_model_output_knowledge`
VALUES ('46180431', '202108030215', '8', 0.781759740);
INSERT INTO `t_model_output_knowledge`
VALUES ('46212467', '202108030310', '5', 0.994044840);
INSERT INTO `t_model_output_knowledge`
VALUES ('46223222', '202108030118', '3', 0.009568605);
INSERT INTO `t_model_output_knowledge`
VALUES ('46295903', '202108030127', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('46409625', '202009070125', '10', 0.045707450);
INSERT INTO `t_model_output_knowledge`
VALUES ('46603889', '202108030423', '6', 0.009369548);
INSERT INTO `t_model_output_knowledge`
VALUES ('46670785', '202108030121', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('46738469', '202108030310', '3', 0.020942109);
INSERT INTO `t_model_output_knowledge`
VALUES ('46765863', '202108030208', '3', 0.024215225);
INSERT INTO `t_model_output_knowledge`
VALUES ('46840688', '202108030220', '6', 0.011457239);
INSERT INTO `t_model_output_knowledge`
VALUES ('46927627', '202108030216', '1', 0.979096060);
INSERT INTO `t_model_output_knowledge`
VALUES ('46964476', '202108030102', '6', 0.007050670);
INSERT INTO `t_model_output_knowledge`
VALUES ('47102381', '202108030315', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('47164259', '202108030417', '10', 0.023809886);
INSERT INTO `t_model_output_knowledge`
VALUES ('47211255', '202108030409', '5', 0.983317300);
INSERT INTO `t_model_output_knowledge`
VALUES ('47219309', '202108030312', '5', 0.995469450);
INSERT INTO `t_model_output_knowledge`
VALUES ('47253798', '202108030418', '5', 0.916152500);
INSERT INTO `t_model_output_knowledge`
VALUES ('47303371', '202108030217', '8', 0.284320180);
INSERT INTO `t_model_output_knowledge`
VALUES ('47421988', '202108030105', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('47511450', '202108030120', '6', 0.013474942);
INSERT INTO `t_model_output_knowledge`
VALUES ('47656770', '202108030113', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('47803661', '202108030119', '5', 0.985087300);
INSERT INTO `t_model_output_knowledge`
VALUES ('47877807', '202108030115', '1', 0.993654970);
INSERT INTO `t_model_output_knowledge`
VALUES ('47992851', '202108030423', '3', 0.037398763);
INSERT INTO `t_model_output_knowledge`
VALUES ('48042901', '202108030224', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('48073388', '202108030318', '8', 0.752745500);
INSERT INTO `t_model_output_knowledge`
VALUES ('48164584', '202108030118', '8', 0.957966100);
INSERT INTO `t_model_output_knowledge`
VALUES ('48172060', '202108030212', '5', 0.974930350);
INSERT INTO `t_model_output_knowledge`
VALUES ('48210187', '202108030205', '5', 0.993520700);
INSERT INTO `t_model_output_knowledge`
VALUES ('48232726', '202108030303', '8', 0.189349340);
INSERT INTO `t_model_output_knowledge`
VALUES ('48308423', '202108030321', '1', 0.909570040);
INSERT INTO `t_model_output_knowledge`
VALUES ('48351201', '202108030111', '6', 0.023545977);
INSERT INTO `t_model_output_knowledge`
VALUES ('48358229', '202108030215', '6', 0.017244741);
INSERT INTO `t_model_output_knowledge`
VALUES ('48441098', '202108030121', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('48472708', '202108030321', '8', 0.717378740);
INSERT INTO `t_model_output_knowledge`
VALUES ('48514804', '202108030205', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('48644367', '202108030415', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('48668774', '202108030425', '10', 0.054459583);
INSERT INTO `t_model_output_knowledge`
VALUES ('48841308', '202108030215', '9', 0.236915780);
INSERT INTO `t_model_output_knowledge`
VALUES ('48844188', '202108030228', '9', 0.795867600);
INSERT INTO `t_model_output_knowledge`
VALUES ('48970840', '202108030122', '9', 0.795082000);
INSERT INTO `t_model_output_knowledge`
VALUES ('49026507', '202108030422', '6', 0.008918314);
INSERT INTO `t_model_output_knowledge`
VALUES ('49105871', '202108030307', '5', 0.994824770);
INSERT INTO `t_model_output_knowledge`
VALUES ('49114063', '202108030123', '6', 0.006581879);
INSERT INTO `t_model_output_knowledge`
VALUES ('49157253', '202108030224', '6', 0.695972400);
INSERT INTO `t_model_output_knowledge`
VALUES ('49163100', '202108030224', '8', 0.936964870);
INSERT INTO `t_model_output_knowledge`
VALUES ('49248197', '202108030127', '7', 0.114928390);
INSERT INTO `t_model_output_knowledge`
VALUES ('49385472', '202108030208', '9', 0.036169704);
INSERT INTO `t_model_output_knowledge`
VALUES ('49402349', '202108030120', '10', 0.013474942);
INSERT INTO `t_model_output_knowledge`
VALUES ('49484382', '202108030225', '8', 0.855922760);
INSERT INTO `t_model_output_knowledge`
VALUES ('49589104', '202108030207', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('49589366', '202108030110', '6', 0.026492590);
INSERT INTO `t_model_output_knowledge`
VALUES ('49634728', '202108030228', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('49647152', '202108030214', '10', 0.039228063);
INSERT INTO `t_model_output_knowledge`
VALUES ('49713349', '202108030104', '8', 0.138796910);
INSERT INTO `t_model_output_knowledge`
VALUES ('49739155', '202108030202', '5', 0.990431500);
INSERT INTO `t_model_output_knowledge`
VALUES ('49853490', '202108030304', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('49976586', '202108030205', '3', 0.066464230);
INSERT INTO `t_model_output_knowledge`
VALUES ('50029671', '202108030301', '5', 0.973195000);
INSERT INTO `t_model_output_knowledge`
VALUES ('50111940', '202108030116', '5', 0.941173850);
INSERT INTO `t_model_output_knowledge`
VALUES ('50173700', '202108030110', '9', 0.338172850);
INSERT INTO `t_model_output_knowledge`
VALUES ('50677513', '202108030228', '10', 0.013293544);
INSERT INTO `t_model_output_knowledge`
VALUES ('50726360', '202108030418', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('50756483', '202108030317', '3', 0.018437961);
INSERT INTO `t_model_output_knowledge`
VALUES ('50884889', '202108030112', '7', 0.040548050);
INSERT INTO `t_model_output_knowledge`
VALUES ('50909275', '202108030120', '1', 0.995759800);
INSERT INTO `t_model_output_knowledge`
VALUES ('50953723', '202108030406', '7', 0.647413000);
INSERT INTO `t_model_output_knowledge`
VALUES ('50987689', '202108030209', '3', 0.026357710);
INSERT INTO `t_model_output_knowledge`
VALUES ('51041880', '202108030112', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('51275846', '202108030426', '11', 0.973783800);
INSERT INTO `t_model_output_knowledge`
VALUES ('51312521', '202108030302', '10', 0.039126083);
INSERT INTO `t_model_output_knowledge`
VALUES ('51366972', '202108030105', '8', 0.189429250);
INSERT INTO `t_model_output_knowledge`
VALUES ('51411579', '202108030205', '8', 0.638590040);
INSERT INTO `t_model_output_knowledge`
VALUES ('51437311', '202108030302', '5', 0.989761770);
INSERT INTO `t_model_output_knowledge`
VALUES ('51481278', '202108030104', '5', 0.994972200);
INSERT INTO `t_model_output_knowledge`
VALUES ('51486042', '202108030229', '6', 0.081705210);
INSERT INTO `t_model_output_knowledge`
VALUES ('51576516', '202108030420', '7', 0.117261500);
INSERT INTO `t_model_output_knowledge`
VALUES ('51619424', '202108030324', '10', 0.007514837);
INSERT INTO `t_model_output_knowledge`
VALUES ('51650461', '202108030218', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('51667011', '202108030113', '10', 0.007618528);
INSERT INTO `t_model_output_knowledge`
VALUES ('51705586', '202108030401', '3', 0.122661814);
INSERT INTO `t_model_output_knowledge`
VALUES ('51732354', '202108030424', '6', 0.029066100);
INSERT INTO `t_model_output_knowledge`
VALUES ('51738087', '202108030229', '7', 0.082737100);
INSERT INTO `t_model_output_knowledge`
VALUES ('51823358', '202108030112', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('51907099', '202108030314', '1', 0.992668000);
INSERT INTO `t_model_output_knowledge`
VALUES ('52060273', '202108030424', '3', 0.081295840);
INSERT INTO `t_model_output_knowledge`
VALUES ('52069125', '202108030305', '3', 0.042542680);
INSERT INTO `t_model_output_knowledge`
VALUES ('52157512', '202108030403', '9', 0.246001330);
INSERT INTO `t_model_output_knowledge`
VALUES ('52302947', '202108030129', '5', 0.956852800);
INSERT INTO `t_model_output_knowledge`
VALUES ('52312353', '202006010214', '5', 0.992869700);
INSERT INTO `t_model_output_knowledge`
VALUES ('52335522', '202108030303', '7', 0.091059170);
INSERT INTO `t_model_output_knowledge`
VALUES ('52430093', '202108030311', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('52447314', '202108030325', '8', 0.845052240);
INSERT INTO `t_model_output_knowledge`
VALUES ('52593763', '202108030411', '8', 0.504023200);
INSERT INTO `t_model_output_knowledge`
VALUES ('52652413', '202108030112', '9', 0.052654743);
INSERT INTO `t_model_output_knowledge`
VALUES ('52663559', '202108030116', '6', 0.008312354);
INSERT INTO `t_model_output_knowledge`
VALUES ('52801844', '202108030222', '3', 0.894956770);
INSERT INTO `t_model_output_knowledge`
VALUES ('52862993', '202108030213', '6', 0.004142235);
INSERT INTO `t_model_output_knowledge`
VALUES ('52873605', '202108030426', '5', 0.996242500);
INSERT INTO `t_model_output_knowledge`
VALUES ('53049790', '202108030117', '10', 0.025380060);
INSERT INTO `t_model_output_knowledge`
VALUES ('53115462', '202108030229', '11', 0.995545150);
INSERT INTO `t_model_output_knowledge`
VALUES ('53161842', '202108030301', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('53183899', '202108030223', '7', 0.060733430);
INSERT INTO `t_model_output_knowledge`
VALUES ('53185184', '202108030322', '9', 0.148023110);
INSERT INTO `t_model_output_knowledge`
VALUES ('53219505', '202108030223', '3', 0.045878086);
INSERT INTO `t_model_output_knowledge`
VALUES ('53365026', '202108030302', '11', 0.992867600);
INSERT INTO `t_model_output_knowledge`
VALUES ('53396782', '202108030104', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('53450972', '202108030314', '9', 0.913858100);
INSERT INTO `t_model_output_knowledge`
VALUES ('53504492', '202108030314', '11', 0.993878960);
INSERT INTO `t_model_output_knowledge`
VALUES ('53569523', '202108030307', '6', 0.003548615);
INSERT INTO `t_model_output_knowledge`
VALUES ('53582046', '202108030420', '10', 0.016789535);
INSERT INTO `t_model_output_knowledge`
VALUES ('53608466', '202108030410', '8', 0.250630970);
INSERT INTO `t_model_output_knowledge`
VALUES ('53692261', '202108030203', '9', 0.048134685);
INSERT INTO `t_model_output_knowledge`
VALUES ('53788259', '202108030220', '5', 0.961194900);
INSERT INTO `t_model_output_knowledge`
VALUES ('53797675', '202108030127', '9', 0.068950330);
INSERT INTO `t_model_output_knowledge`
VALUES ('53897572', '202108030126', '3', 0.009198939);
INSERT INTO `t_model_output_knowledge`
VALUES ('53898704', '202108030312', '1', 0.980547550);
INSERT INTO `t_model_output_knowledge`
VALUES ('53930277', '202108030305', '8', 0.112881560);
INSERT INTO `t_model_output_knowledge`
VALUES ('53966955', '202108030130', '1', 0.985539560);
INSERT INTO `t_model_output_knowledge`
VALUES ('53970586', '202108030323', '11', 0.988478500);
INSERT INTO `t_model_output_knowledge`
VALUES ('53990727', '202108030107', '6', 0.050152007);
INSERT INTO `t_model_output_knowledge`
VALUES ('54019510', '202108030202', '10', 0.012882016);
INSERT INTO `t_model_output_knowledge`
VALUES ('54036572', '202108030318', '7', 0.631206100);
INSERT INTO `t_model_output_knowledge`
VALUES ('54064949', '202108030101', '6', 0.037767373);
INSERT INTO `t_model_output_knowledge`
VALUES ('54151625', '202108030328', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('54280289', '202108030123', '3', 0.027693970);
INSERT INTO `t_model_output_knowledge`
VALUES ('54362658', '202108030409', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('54388769', '202108030224', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('54505709', '202108030109', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('54664229', '202108030110', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('54685758', '202006010214', '7', 0.863205100);
INSERT INTO `t_model_output_knowledge`
VALUES ('54691078', '202108030228', '3', 0.715723160);
INSERT INTO `t_model_output_knowledge`
VALUES ('54713470', '202108030218', '11', 0.932937400);
INSERT INTO `t_model_output_knowledge`
VALUES ('55077546', '202108030402', '10', 0.034990460);
INSERT INTO `t_model_output_knowledge`
VALUES ('55265933', '202108030129', '1', 0.985527400);
INSERT INTO `t_model_output_knowledge`
VALUES ('55299076', '202108030213', '8', 0.187425360);
INSERT INTO `t_model_output_knowledge`
VALUES ('55323488', '202108030222', '7', 0.815280600);
INSERT INTO `t_model_output_knowledge`
VALUES ('55341203', '202108030106', '10', 0.008527511);
INSERT INTO `t_model_output_knowledge`
VALUES ('55516592', '202108030406', '3', 0.012681428);
INSERT INTO `t_model_output_knowledge`
VALUES ('55660893', '202108030326', '7', 0.865336840);
INSERT INTO `t_model_output_knowledge`
VALUES ('55679602', '202108030105', '10', 0.037767373);
INSERT INTO `t_model_output_knowledge`
VALUES ('55742257', '202108030407', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('55887106', '202108030115', '5', 0.996804700);
INSERT INTO `t_model_output_knowledge`
VALUES ('56329784', '202108030310', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('56524085', '202108030116', '9', 0.067389640);
INSERT INTO `t_model_output_knowledge`
VALUES ('56525418', '202108030226', '8', 0.937247500);
INSERT INTO `t_model_output_knowledge`
VALUES ('56598539', '202108030419', '10', 0.008080503);
INSERT INTO `t_model_output_knowledge`
VALUES ('56602982', '202108030317', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('56606358', '202108030314', '7', 0.861316300);
INSERT INTO `t_model_output_knowledge`
VALUES ('56753216', '202108030102', '5', 0.975670460);
INSERT INTO `t_model_output_knowledge`
VALUES ('57200046', '202108030419', '9', 0.388747780);
INSERT INTO `t_model_output_knowledge`
VALUES ('57228387', '202108030420', '8', 0.481800100);
INSERT INTO `t_model_output_knowledge`
VALUES ('57577702', '201810040108', '7', 0.256138500);
INSERT INTO `t_model_output_knowledge`
VALUES ('57623435', '202108030319', '9', 0.199338380);
INSERT INTO `t_model_output_knowledge`
VALUES ('57652968', '202108030206', '11', 0.996093450);
INSERT INTO `t_model_output_knowledge`
VALUES ('57655092', '202108030408', '8', 0.522562000);
INSERT INTO `t_model_output_knowledge`
VALUES ('57697579', '202108030208', '8', 0.911931000);
INSERT INTO `t_model_output_knowledge`
VALUES ('57745371', '202108030127', '3', 0.779637750);
INSERT INTO `t_model_output_knowledge`
VALUES ('57803334', '202108030302', '7', 0.036281176);
INSERT INTO `t_model_output_knowledge`
VALUES ('57803772', '202108030310', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('57813002', '202108030422', '3', 0.027164934);
INSERT INTO `t_model_output_knowledge`
VALUES ('57815014', '202108030315', '9', 0.047881840);
INSERT INTO `t_model_output_knowledge`
VALUES ('57815908', '202108030119', '6', 0.007311397);
INSERT INTO `t_model_output_knowledge`
VALUES ('57854429', '202108030122', '7', 0.765011500);
INSERT INTO `t_model_output_knowledge`
VALUES ('57866662', '202108030207', '11', 0.990277700);
INSERT INTO `t_model_output_knowledge`
VALUES ('57948692', '202108030208', '1', 0.994496500);
INSERT INTO `t_model_output_knowledge`
VALUES ('57991277', '202108030324', '8', 0.905305450);
INSERT INTO `t_model_output_knowledge`
VALUES ('58021585', '202108030107', '1', 0.990808670);
INSERT INTO `t_model_output_knowledge`
VALUES ('58049641', '202108030305', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('58069536', '202108030312', '7', 0.084489200);
INSERT INTO `t_model_output_knowledge`
VALUES ('58085264', '202108030117', '5', 0.992118950);
INSERT INTO `t_model_output_knowledge`
VALUES ('58090784', '202108030215', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('58096384', '202108030123', '7', 0.908217850);
INSERT INTO `t_model_output_knowledge`
VALUES ('58110217', '202108030104', '6', 0.007604114);
INSERT INTO `t_model_output_knowledge`
VALUES ('58136813', '202108030230', '3', 0.030052735);
INSERT INTO `t_model_output_knowledge`
VALUES ('58219640', '202108030105', '11', 0.813486700);
INSERT INTO `t_model_output_knowledge`
VALUES ('58457396', '201810040108', '6', 0.472392600);
INSERT INTO `t_model_output_knowledge`
VALUES ('58583647', '202108030425', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('58587769', '202108030206', '7', 0.160166560);
INSERT INTO `t_model_output_knowledge`
VALUES ('58589154', '202108030317', '8', 0.218329940);
INSERT INTO `t_model_output_knowledge`
VALUES ('58637525', '202108030111', '9', 0.180683720);
INSERT INTO `t_model_output_knowledge`
VALUES ('58669504', '202108030230', '11', 0.268174230);
INSERT INTO `t_model_output_knowledge`
VALUES ('58897031', '202108030209', '9', 0.058467295);
INSERT INTO `t_model_output_knowledge`
VALUES ('58907320', '202108030411', '6', 0.004495535);
INSERT INTO `t_model_output_knowledge`
VALUES ('58934659', '202108030109', '5', 0.986555460);
INSERT INTO `t_model_output_knowledge`
VALUES ('59032919', '202108030422', '10', 0.008918314);
INSERT INTO `t_model_output_knowledge`
VALUES ('59098764', '202108030326', '10', 0.004801229);
INSERT INTO `t_model_output_knowledge`
VALUES ('59124942', '202108030316', '3', 0.017175164);
INSERT INTO `t_model_output_knowledge`
VALUES ('59267050', '202108030402', '1', 0.987902940);
INSERT INTO `t_model_output_knowledge`
VALUES ('59378116', '202108030214', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('59385975', '202108030128', '1', 0.987761140);
INSERT INTO `t_model_output_knowledge`
VALUES ('59484625', '202108030217', '5', 0.981148800);
INSERT INTO `t_model_output_knowledge`
VALUES ('59578366', '202108030213', '1', 0.995408700);
INSERT INTO `t_model_output_knowledge`
VALUES ('59608479', '202108030309', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('59628975', '202108030211', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('59639093', '202108030317', '5', 0.963716100);
INSERT INTO `t_model_output_knowledge`
VALUES ('59682287', '202108030428', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('59689844', '202108030228', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('59738980', '202006010214', '8', 0.910715100);
INSERT INTO `t_model_output_knowledge`
VALUES ('59890392', '202108030410', '9', 0.297000500);
INSERT INTO `t_model_output_knowledge`
VALUES ('59972799', '202108030321', '5', 0.969876900);
INSERT INTO `t_model_output_knowledge`
VALUES ('59980891', '202108030424', '5', 0.991746070);
INSERT INTO `t_model_output_knowledge`
VALUES ('59996721', '202108030224', '10', 0.695972400);
INSERT INTO `t_model_output_knowledge`
VALUES ('60066536', '202108030126', '10', 0.005172946);
INSERT INTO `t_model_output_knowledge`
VALUES ('60142709', '202108030419', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('60772138', '202108030327', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('60828339', '202108030130', '5', 0.992266600);
INSERT INTO `t_model_output_knowledge`
VALUES ('60923300', '202108030406', '9', 0.417262730);
INSERT INTO `t_model_output_knowledge`
VALUES ('60946947', '202108030328', '8', 0.920867150);
INSERT INTO `t_model_output_knowledge`
VALUES ('60960310', '202108030216', '10', 0.009168423);
INSERT INTO `t_model_output_knowledge`
VALUES ('60984553', '202108030126', '5', 0.955106440);
INSERT INTO `t_model_output_knowledge`
VALUES ('61066186', '202108030301', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('61234628', '202108030217', '11', 0.988540800);
INSERT INTO `t_model_output_knowledge`
VALUES ('61291940', '202108030309', '5', 0.981139360);
INSERT INTO `t_model_output_knowledge`
VALUES ('61293710', '201810040108', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('61330917', '202108030416', '1', 0.962341960);
INSERT INTO `t_model_output_knowledge`
VALUES ('61356002', '202108030307', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('61481797', '202108030422', '8', 0.209115310);
INSERT INTO `t_model_output_knowledge`
VALUES ('61487406', '202108030301', '6', 0.007232884);
INSERT INTO `t_model_output_knowledge`
VALUES ('61636793', '202108030408', '10', 0.011407272);
INSERT INTO `t_model_output_knowledge`
VALUES ('61668593', '202108030326', '8', 0.897611600);
INSERT INTO `t_model_output_knowledge`
VALUES ('61684120', '202108030219', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('61768114', '202108030217', '7', 0.335561130);
INSERT INTO `t_model_output_knowledge`
VALUES ('61908066', '202108030422', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('61923031', '202108030401', '11', 0.989124900);
INSERT INTO `t_model_output_knowledge`
VALUES ('62016726', '202108030409', '9', 0.179068760);
INSERT INTO `t_model_output_knowledge`
VALUES ('62209373', '202108030428', '5', 0.994837700);
INSERT INTO `t_model_output_knowledge`
VALUES ('62257972', '202108030401', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('62258817', '202108030413', '3', 0.213991610);
INSERT INTO `t_model_output_knowledge`
VALUES ('62623717', '202108030420', '6', 0.016789535);
INSERT INTO `t_model_output_knowledge`
VALUES ('62679668', '202108030406', '5', 0.995882870);
INSERT INTO `t_model_output_knowledge`
VALUES ('62712277', '202108030202', '3', 0.038024790);
INSERT INTO `t_model_output_knowledge`
VALUES ('62780622', '202108030317', '9', 0.721374030);
INSERT INTO `t_model_output_knowledge`
VALUES ('62785854', '202108030420', '3', 0.014347823);
INSERT INTO `t_model_output_knowledge`
VALUES ('62808632', '202108030416', '3', 0.085363690);
INSERT INTO `t_model_output_knowledge`
VALUES ('62808757', '202108030211', '11', 0.991147460);
INSERT INTO `t_model_output_knowledge`
VALUES ('62962868', '202108030320', '7', 0.868362300);
INSERT INTO `t_model_output_knowledge`
VALUES ('63002785', '202108030102', '1', 0.990398300);
INSERT INTO `t_model_output_knowledge`
VALUES ('63044587', '202108030308', '1', 0.997617800);
INSERT INTO `t_model_output_knowledge`
VALUES ('63066253', '202108030103', '10', 0.007394602);
INSERT INTO `t_model_output_knowledge`
VALUES ('63115884', '202108030103', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63230088', '202108030126', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63235757', '202108030220', '10', 0.011457239);
INSERT INTO `t_model_output_knowledge`
VALUES ('63438771', '202108030108', '6', 0.105734624);
INSERT INTO `t_model_output_knowledge`
VALUES ('63461740', '202108030304', '5', 0.980269500);
INSERT INTO `t_model_output_knowledge`
VALUES ('63549029', '202108030119', '10', 0.007311397);
INSERT INTO `t_model_output_knowledge`
VALUES ('63584899', '202108030303', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63643317', '202108030214', '11', 0.970446100);
INSERT INTO `t_model_output_knowledge`
VALUES ('63683744', '202108030314', '3', 0.021889044);
INSERT INTO `t_model_output_knowledge`
VALUES ('63815823', '202108030213', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63822124', '201810040108', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63879036', '202108030414', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('63894160', '202108030203', '6', 0.008138920);
INSERT INTO `t_model_output_knowledge`
VALUES ('63928189', '202108030110', '1', 0.990808670);
INSERT INTO `t_model_output_knowledge`
VALUES ('64032636', '202108030111', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('64065229', '202009070125', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('64121340', '202108030117', '1', 0.985988560);
INSERT INTO `t_model_output_knowledge`
VALUES ('64216706', '202108030329', '10', 0.083287280);
INSERT INTO `t_model_output_knowledge`
VALUES ('64221559', '202108030107', '5', 0.995664400);
INSERT INTO `t_model_output_knowledge`
VALUES ('64240271', '202108030211', '3', 0.039603222);
INSERT INTO `t_model_output_knowledge`
VALUES ('64297683', '201508010709', '11', 0.990473200);
INSERT INTO `t_model_output_knowledge`
VALUES ('64372677', '202108030325', '5', 0.996288800);
INSERT INTO `t_model_output_knowledge`
VALUES ('64457311', '202108030109', '1', 0.988208650);
INSERT INTO `t_model_output_knowledge`
VALUES ('64623566', '202108030404', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('64742532', '202108030302', '3', 0.010646401);
INSERT INTO `t_model_output_knowledge`
VALUES ('64796752', '202108030302', '1', 0.909570040);
INSERT INTO `t_model_output_knowledge`
VALUES ('64828912', '202108030220', '9', 0.008760762);
INSERT INTO `t_model_output_knowledge`
VALUES ('64956809', '202108030306', '11', 0.994293200);
INSERT INTO `t_model_output_knowledge`
VALUES ('64985634', '202108030217', '3', 0.158124060);
INSERT INTO `t_model_output_knowledge`
VALUES ('65031561', '202108030115', '10', 0.048519794);
INSERT INTO `t_model_output_knowledge`
VALUES ('65108568', '202108030327', '11', 0.959077400);
INSERT INTO `t_model_output_knowledge`
VALUES ('65153668', '202108030421', '11', 0.989742600);
INSERT INTO `t_model_output_knowledge`
VALUES ('65155225', '202108030212', '7', 0.807586400);
INSERT INTO `t_model_output_knowledge`
VALUES ('65252851', '202108030408', '5', 0.995574950);
INSERT INTO `t_model_output_knowledge`
VALUES ('65384745', '201810040106', '8', 0.961181760);
INSERT INTO `t_model_output_knowledge`
VALUES ('65490600', '202108030317', '10', 0.468630200);
INSERT INTO `t_model_output_knowledge`
VALUES ('65521738', '202108030416', '9', 0.087500300);
INSERT INTO `t_model_output_knowledge`
VALUES ('65568440', '202108030321', '6', 0.098794430);
INSERT INTO `t_model_output_knowledge`
VALUES ('65589715', '202108030330', '7', 0.033009652);
INSERT INTO `t_model_output_knowledge`
VALUES ('65604096', '202108030203', '7', 0.071720220);
INSERT INTO `t_model_output_knowledge`
VALUES ('65666746', '202108030130', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('65744919', '202108030106', '11', 0.977664400);
INSERT INTO `t_model_output_knowledge`
VALUES ('65903962', '202108030330', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('65932099', '202108030310', '11', 0.993998770);
INSERT INTO `t_model_output_knowledge`
VALUES ('65964548', '202108030122', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('66044038', '202108030212', '6', 0.012712901);
INSERT INTO `t_model_output_knowledge`
VALUES ('66103797', '202108030405', '9', 0.099099370);
INSERT INTO `t_model_output_knowledge`
VALUES ('66112947', '202108030230', '7', 0.079858260);
INSERT INTO `t_model_output_knowledge`
VALUES ('66146530', '202108030416', '7', 0.195733140);
INSERT INTO `t_model_output_knowledge`
VALUES ('66178984', '202108030206', '1', 0.968994300);
INSERT INTO `t_model_output_knowledge`
VALUES ('66234495', '202108030119', '3', 0.033494726);
INSERT INTO `t_model_output_knowledge`
VALUES ('66242329', '202108030427', '3', 0.089128730);
INSERT INTO `t_model_output_knowledge`
VALUES ('66287883', '202108030321', '10', 0.098794430);
INSERT INTO `t_model_output_knowledge`
VALUES ('66340577', '202108030204', '10', 0.031787746);
INSERT INTO `t_model_output_knowledge`
VALUES ('66379990', '202108030324', '5', 0.409092550);
INSERT INTO `t_model_output_knowledge`
VALUES ('66395802', '202108030205', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('66650222', '202108030410', '7', 0.109441890);
INSERT INTO `t_model_output_knowledge`
VALUES ('66714059', '202108030120', '8', 0.894683960);
INSERT INTO `t_model_output_knowledge`
VALUES ('66765973', '202108030218', '10', 0.055764050);
INSERT INTO `t_model_output_knowledge`
VALUES ('66880141', '202108030102', '10', 0.007050670);
INSERT INTO `t_model_output_knowledge`
VALUES ('67195219', '202108030222', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('67256550', '202009070125', '11', 0.985851900);
INSERT INTO `t_model_output_knowledge`
VALUES ('67259418', '202108030319', '10', 0.043442488);
INSERT INTO `t_model_output_knowledge`
VALUES ('67263682', '202108030209', '10', 0.003292533);
INSERT INTO `t_model_output_knowledge`
VALUES ('67280041', '202108030314', '5', 0.997487900);
INSERT INTO `t_model_output_knowledge`
VALUES ('67281082', '202108030230', '6', 0.014370092);
INSERT INTO `t_model_output_knowledge`
VALUES ('67320824', '202108030122', '1', 0.946658400);
INSERT INTO `t_model_output_knowledge`
VALUES ('67322561', '202108030216', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('67326619', '202108030107', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('67376149', '202108030206', '9', 0.151114970);
INSERT INTO `t_model_output_knowledge`
VALUES ('67441740', '202108030407', '5', 0.962433800);
INSERT INTO `t_model_output_knowledge`
VALUES ('67448803', '202108030107', '7', 0.831829600);
INSERT INTO `t_model_output_knowledge`
VALUES ('67471962', '202108030422', '9', 0.013121809);
INSERT INTO `t_model_output_knowledge`
VALUES ('67584713', '202108030208', '6', 0.049732010);
INSERT INTO `t_model_output_knowledge`
VALUES ('67590532', '202108030207', '8', 0.820012800);
INSERT INTO `t_model_output_knowledge`
VALUES ('67625920', '202108030108', '5', 0.805707900);
INSERT INTO `t_model_output_knowledge`
VALUES ('67664846', '202009070109', '3', 0.039942910);
INSERT INTO `t_model_output_knowledge`
VALUES ('67713168', '202108030228', '11', 0.982812200);
INSERT INTO `t_model_output_knowledge`
VALUES ('67811833', '202108030106', '6', 0.008527511);
INSERT INTO `t_model_output_knowledge`
VALUES ('67900068', '202108030311', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68052101', '202108030103', '1', 0.996750700);
INSERT INTO `t_model_output_knowledge`
VALUES ('68066738', '202108030405', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68107713', '202108030112', '8', 0.889762800);
INSERT INTO `t_model_output_knowledge`
VALUES ('68108084', '202108030414', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68225111', '202108030130', '6', 0.025805835);
INSERT INTO `t_model_output_knowledge`
VALUES ('68237348', '202108030213', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68246734', '202108030204', '8', 0.094820720);
INSERT INTO `t_model_output_knowledge`
VALUES ('68288820', '202108030223', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68360863', '202108030419', '1', 0.993156850);
INSERT INTO `t_model_output_knowledge`
VALUES ('68399985', '202108030429', '7', 0.643977600);
INSERT INTO `t_model_output_knowledge`
VALUES ('68424105', '202108030104', '3', 0.711063000);
INSERT INTO `t_model_output_knowledge`
VALUES ('68609141', '202108030110', '11', 0.989243030);
INSERT INTO `t_model_output_knowledge`
VALUES ('68623638', '202108030123', '10', 0.006581879);
INSERT INTO `t_model_output_knowledge`
VALUES ('68773546', '202108030216', '6', 0.009168423);
INSERT INTO `t_model_output_knowledge`
VALUES ('68779272', '202108030115', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68876856', '202108030226', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('68891805', '202108030326', '5', 0.982068960);
INSERT INTO `t_model_output_knowledge`
VALUES ('69029076', '202108030426', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('69030032', '202108030312', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('69138156', '202108030229', '1', 0.997183500);
INSERT INTO `t_model_output_knowledge`
VALUES ('69243937', '202108030219', '3', 0.095216820);
INSERT INTO `t_model_output_knowledge`
VALUES ('69267665', '202108030323', '1', 0.997654000);
INSERT INTO `t_model_output_knowledge`
VALUES ('69343902', '202108030322', '8', 0.147719600);
INSERT INTO `t_model_output_knowledge`
VALUES ('69373702', '202108030101', '5', 0.996504070);
INSERT INTO `t_model_output_knowledge`
VALUES ('69401618', '202108030427', '6', 0.017521873);
INSERT INTO `t_model_output_knowledge`
VALUES ('69430471', '202108030413', '8', 0.185313630);
INSERT INTO `t_model_output_knowledge`
VALUES ('69431789', '202108030424', '10', 0.029066100);
INSERT INTO `t_model_output_knowledge`
VALUES ('69518634', '202108030119', '1', 0.437155570);
INSERT INTO `t_model_output_knowledge`
VALUES ('69526179', '202108030114', '7', 0.768917300);
INSERT INTO `t_model_output_knowledge`
VALUES ('69656665', '202108030302', '8', 0.851821800);
INSERT INTO `t_model_output_knowledge`
VALUES ('69879252', '202108030114', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('69880329', '202108030204', '1', 0.983966500);
INSERT INTO `t_model_output_knowledge`
VALUES ('69959183', '202108030318', '9', 0.701075800);
INSERT INTO `t_model_output_knowledge`
VALUES ('70005379', '202108030115', '7', 0.887353800);
INSERT INTO `t_model_output_knowledge`
VALUES ('70012644', '202108030321', '9', 0.071875150);
INSERT INTO `t_model_output_knowledge`
VALUES ('70184682', '202108030104', '7', 0.024512623);
INSERT INTO `t_model_output_knowledge`
VALUES ('70225717', '202108030202', '11', 0.364755930);
INSERT INTO `t_model_output_knowledge`
VALUES ('70261237', '202108030212', '8', 0.907059800);
INSERT INTO `t_model_output_knowledge`
VALUES ('70630033', '202108030123', '9', 0.882851200);
INSERT INTO `t_model_output_knowledge`
VALUES ('70658129', '202108030407', '1', 0.798165140);
INSERT INTO `t_model_output_knowledge`
VALUES ('70668927', '202108030113', '11', 0.992613550);
INSERT INTO `t_model_output_knowledge`
VALUES ('70679919', '202108030330', '3', 0.016686143);
INSERT INTO `t_model_output_knowledge`
VALUES ('70880748', '202108030101', '3', 0.026146067);
INSERT INTO `t_model_output_knowledge`
VALUES ('70887391', '202108030406', '8', 0.626787900);
INSERT INTO `t_model_output_knowledge`
VALUES ('70906892', '202108030206', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('70994313', '202108030219', '9', 0.973254260);
INSERT INTO `t_model_output_knowledge`
VALUES ('71010546', '202108030413', '7', 0.161608460);
INSERT INTO `t_model_output_knowledge`
VALUES ('71013111', '202108030403', '8', 0.022683170);
INSERT INTO `t_model_output_knowledge`
VALUES ('71303839', '202108030211', '9', 0.015228150);
INSERT INTO `t_model_output_knowledge`
VALUES ('71317087', '202108030213', '5', 0.997487900);
INSERT INTO `t_model_output_knowledge`
VALUES ('71431067', '202108030328', '11', 0.991522100);
INSERT INTO `t_model_output_knowledge`
VALUES ('71672858', '202108030108', '11', 0.992022040);
INSERT INTO `t_model_output_knowledge`
VALUES ('72088152', '202108030420', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('72194185', '202108030426', '7', 0.384087380);
INSERT INTO `t_model_output_knowledge`
VALUES ('72205121', '202108030327', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('72219974', '202108030105', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('72306634', '202108030404', '3', 0.389813400);
INSERT INTO `t_model_output_knowledge`
VALUES ('72652780', '202108030409', '3', 0.455167200);
INSERT INTO `t_model_output_knowledge`
VALUES ('72709706', '202108030424', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('72879602', '202108030326', '6', 0.004801229);
INSERT INTO `t_model_output_knowledge`
VALUES ('72938865', '202108030330', '1', 0.908002850);
INSERT INTO `t_model_output_knowledge`
VALUES ('73009485', '202108030101', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73178683', '202108030307', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73232259', '202108030128', '9', 0.118974470);
INSERT INTO `t_model_output_knowledge`
VALUES ('73298154', '202108030224', '7', 0.740735000);
INSERT INTO `t_model_output_knowledge`
VALUES ('73306081', '202108030230', '9', 0.087033510);
INSERT INTO `t_model_output_knowledge`
VALUES ('73341628', '202108030105', '3', 0.056392238);
INSERT INTO `t_model_output_knowledge`
VALUES ('73358464', '202108030310', '7', 0.881700200);
INSERT INTO `t_model_output_knowledge`
VALUES ('73392778', '202108030415', '3', 0.010598193);
INSERT INTO `t_model_output_knowledge`
VALUES ('73415191', '202108030302', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73416031', '202108030108', '8', 0.793499000);
INSERT INTO `t_model_output_knowledge`
VALUES ('73548843', '202108030223', '9', 0.055927996);
INSERT INTO `t_model_output_knowledge`
VALUES ('73550126', '202108030126', '11', 0.887220440);
INSERT INTO `t_model_output_knowledge`
VALUES ('73593339', '202108030212', '11', 0.949778260);
INSERT INTO `t_model_output_knowledge`
VALUES ('73626853', '202108030304', '1', 0.996356500);
INSERT INTO `t_model_output_knowledge`
VALUES ('73647863', '202108030218', '3', 0.007726306);
INSERT INTO `t_model_output_knowledge`
VALUES ('73672576', '202108030108', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73680464', '202108030328', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73693328', '202108030102', '3', 0.046694170);
INSERT INTO `t_model_output_knowledge`
VALUES ('73752409', '202108030204', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('73757153', '202108030129', '3', 0.015494073);
INSERT INTO `t_model_output_knowledge`
VALUES ('73772105', '202108030123', '5', 0.996288800);
INSERT INTO `t_model_output_knowledge`
VALUES ('73856743', '202108030228', '6', 0.013293544);
INSERT INTO `t_model_output_knowledge`
VALUES ('73900126', '202108030110', '5', 0.997487900);
INSERT INTO `t_model_output_knowledge`
VALUES ('74005051', '202108030313', '10', 0.050862390);
INSERT INTO `t_model_output_knowledge`
VALUES ('74010740', '202108030210', '3', 0.727883160);
INSERT INTO `t_model_output_knowledge`
VALUES ('74084521', '202108030111', '7', 0.161570940);
INSERT INTO `t_model_output_knowledge`
VALUES ('74112971', '202108030413', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('74114594', '202108030322', '5', 0.975945060);
INSERT INTO `t_model_output_knowledge`
VALUES ('74131678', '202108030311', '11', 0.993117000);
INSERT INTO `t_model_output_knowledge`
VALUES ('74372230', '202108030408', '3', 0.013129109);
INSERT INTO `t_model_output_knowledge`
VALUES ('74552684', '202108030425', '8', 0.490512000);
INSERT INTO `t_model_output_knowledge`
VALUES ('74592202', '202108030111', '1', 0.995502050);
INSERT INTO `t_model_output_knowledge`
VALUES ('74734209', '202108030426', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('74736512', '202108030125', '1', 0.980198800);
INSERT INTO `t_model_output_knowledge`
VALUES ('74811484', '202108030323', '9', 0.128054540);
INSERT INTO `t_model_output_knowledge`
VALUES ('74861716', '202108030217', '9', 0.297126020);
INSERT INTO `t_model_output_knowledge`
VALUES ('74862252', '202108030329', '1', 0.942919100);
INSERT INTO `t_model_output_knowledge`
VALUES ('74902350', '202108030405', '3', 0.071623266);
INSERT INTO `t_model_output_knowledge`
VALUES ('75003396', '202108030409', '7', 0.096981350);
INSERT INTO `t_model_output_knowledge`
VALUES ('75011726', '202108030221', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('75014649', '202108030425', '1', 0.978565040);
INSERT INTO `t_model_output_knowledge`
VALUES ('75021764', '202108030102', '11', 0.918374300);
INSERT INTO `t_model_output_knowledge`
VALUES ('75066276', '202108030318', '1', 0.971201700);
INSERT INTO `t_model_output_knowledge`
VALUES ('75092789', '202108030105', '7', 0.061979476);
INSERT INTO `t_model_output_knowledge`
VALUES ('75127277', '202108030425', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('75155744', '202108030230', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('75182241', '202108030114', '6', 0.014136056);
INSERT INTO `t_model_output_knowledge`
VALUES ('75288614', '202108030403', '10', 0.020539080);
INSERT INTO `t_model_output_knowledge`
VALUES ('75376171', '202108030125', '11', 0.976259600);
INSERT INTO `t_model_output_knowledge`
VALUES ('75489471', '202108030404', '8', 0.485526770);
INSERT INTO `t_model_output_knowledge`
VALUES ('75557750', '202108030212', '10', 0.012712901);
INSERT INTO `t_model_output_knowledge`
VALUES ('75559077', '202108030317', '7', 0.024739074);
INSERT INTO `t_model_output_knowledge`
VALUES ('75576989', '202108030227', '3', 0.705441830);
INSERT INTO `t_model_output_knowledge`
VALUES ('75601302', '202108030308', '5', 0.996139200);
INSERT INTO `t_model_output_knowledge`
VALUES ('75719446', '202108030306', '6', 0.051302742);
INSERT INTO `t_model_output_knowledge`
VALUES ('75807445', '202108030407', '7', 0.057289310);
INSERT INTO `t_model_output_knowledge`
VALUES ('75912517', '202108030119', '7', 0.026665140);
INSERT INTO `t_model_output_knowledge`
VALUES ('75947286', '202108030412', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('75989782', '202108030306', '3', 0.007422592);
INSERT INTO `t_model_output_knowledge`
VALUES ('75993592', '202108030120', '7', 0.781330650);
INSERT INTO `t_model_output_knowledge`
VALUES ('76017584', '202108030210', '6', 0.797791800);
INSERT INTO `t_model_output_knowledge`
VALUES ('76066602', '201810040108', '10', 0.472392600);
INSERT INTO `t_model_output_knowledge`
VALUES ('76080744', '202108030428', '7', 0.777990800);
INSERT INTO `t_model_output_knowledge`
VALUES ('76090999', '202108030130', '10', 0.025805835);
INSERT INTO `t_model_output_knowledge`
VALUES ('76161579', '202108030314', '8', 0.892989750);
INSERT INTO `t_model_output_knowledge`
VALUES ('76386843', '202108030404', '10', 0.012395863);
INSERT INTO `t_model_output_knowledge`
VALUES ('76547634', '202108030216', '7', 0.020173637);
INSERT INTO `t_model_output_knowledge`
VALUES ('76596142', '202108030222', '11', 0.992298300);
INSERT INTO `t_model_output_knowledge`
VALUES ('76620232', '202108030405', '6', 0.145152780);
INSERT INTO `t_model_output_knowledge`
VALUES ('76781809', '202108030127', '6', 0.004303922);
INSERT INTO `t_model_output_knowledge`
VALUES ('76799761', '201810040108', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('76853608', '202108030228', '5', 0.993520700);
INSERT INTO `t_model_output_knowledge`
VALUES ('76875064', '202108030329', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('76880286', '202108030206', '5', 0.995608870);
INSERT INTO `t_model_output_knowledge`
VALUES ('76954206', '202108030319', '5', 0.988709500);
INSERT INTO `t_model_output_knowledge`
VALUES ('76978381', '202009070109', '1', 0.888590200);
INSERT INTO `t_model_output_knowledge`
VALUES ('77005369', '202108030311', '7', 0.968956800);
INSERT INTO `t_model_output_knowledge`
VALUES ('77032403', '202108030106', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('77156182', '202108030108', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('77278400', '202108030209', '7', 0.152282740);
INSERT INTO `t_model_output_knowledge`
VALUES ('77386927', '202108030202', '1', 0.990971450);
INSERT INTO `t_model_output_knowledge`
VALUES ('77464727', '202108030218', '5', 0.992745460);
INSERT INTO `t_model_output_knowledge`
VALUES ('77496935', '202108030310', '8', 0.852078700);
INSERT INTO `t_model_output_knowledge`
VALUES ('77517584', '202108030326', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('77565540', '202108030225', '10', 0.109153160);
INSERT INTO `t_model_output_knowledge`
VALUES ('77580155', '202108030210', '5', 0.987868300);
INSERT INTO `t_model_output_knowledge`
VALUES ('77709982', '202108030107', '9', 0.863201440);
INSERT INTO `t_model_output_knowledge`
VALUES ('77749414', '202108030226', '11', 0.985017360);
INSERT INTO `t_model_output_knowledge`
VALUES ('77968931', '202108030121', '6', 0.008246671);
INSERT INTO `t_model_output_knowledge`
VALUES ('78047478', '202108030102', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('78060570', '202108030129', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('78080285', '202108030411', '10', 0.004495535);
INSERT INTO `t_model_output_knowledge`
VALUES ('78169048', '202108030225', '3', 0.174390320);
INSERT INTO `t_model_output_knowledge`
VALUES ('78195519', '202108030108', '10', 0.105734624);
INSERT INTO `t_model_output_knowledge`
VALUES ('78236439', '202108030421', '8', 0.944917800);
INSERT INTO `t_model_output_knowledge`
VALUES ('78258274', '202108030402', '9', 0.455093230);
INSERT INTO `t_model_output_knowledge`
VALUES ('78266779', '202108030220', '7', 0.045221277);
INSERT INTO `t_model_output_knowledge`
VALUES ('78480678', '202108030329', '5', 0.975967350);
INSERT INTO `t_model_output_knowledge`
VALUES ('78510972', '202108030217', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('78532358', '202108030109', '11', 0.892294500);
INSERT INTO `t_model_output_knowledge`
VALUES ('78567341', '202108030117', '8', 0.890044800);
INSERT INTO `t_model_output_knowledge`
VALUES ('78671210', '202108030313', '8', 0.881078840);
INSERT INTO `t_model_output_knowledge`
VALUES ('78775465', '202108030227', '9', 0.918384130);
INSERT INTO `t_model_output_knowledge`
VALUES ('78876664', '202108030308', '7', 0.923804460);
INSERT INTO `t_model_output_knowledge`
VALUES ('78902512', '202108030401', '5', 0.994837700);
INSERT INTO `t_model_output_knowledge`
VALUES ('78945614', '202108030308', '8', 0.938496230);
INSERT INTO `t_model_output_knowledge`
VALUES ('78976101', '202108030311', '3', 0.016655587);
INSERT INTO `t_model_output_knowledge`
VALUES ('79104718', '202108030421', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('79120896', '202108030329', '11', 0.990161200);
INSERT INTO `t_model_output_knowledge`
VALUES ('79171649', '202108030312', '10', 0.004196413);
INSERT INTO `t_model_output_knowledge`
VALUES ('79512751', '202108030101', '7', 0.082819490);
INSERT INTO `t_model_output_knowledge`
VALUES ('79561989', '202108030113', '7', 0.726467000);
INSERT INTO `t_model_output_knowledge`
VALUES ('79703279', '202108030115', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('79788017', '202108030114', '3', 0.051659040);
INSERT INTO `t_model_output_knowledge`
VALUES ('79855566', '202006010214', '6', 0.019894348);
INSERT INTO `t_model_output_knowledge`
VALUES ('80067492', '202108030207', '3', 0.876176830);
INSERT INTO `t_model_output_knowledge`
VALUES ('80212817', '202108030106', '7', 0.666041200);
INSERT INTO `t_model_output_knowledge`
VALUES ('80252745', '202108030120', '11', 0.996839170);
INSERT INTO `t_model_output_knowledge`
VALUES ('80436473', '202108030225', '11', 0.986752750);
INSERT INTO `t_model_output_knowledge`
VALUES ('80506662', '202108030116', '11', 0.934028100);
INSERT INTO `t_model_output_knowledge`
VALUES ('80512432', '202108030403', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('80598050', '202108030110', '10', 0.026492590);
INSERT INTO `t_model_output_knowledge`
VALUES ('80600983', '202108030429', '9', 0.581063150);
INSERT INTO `t_model_output_knowledge`
VALUES ('80684737', '202108030301', '1', 0.161896150);
INSERT INTO `t_model_output_knowledge`
VALUES ('80727096', '202108030412', '10', 0.204379480);
INSERT INTO `t_model_output_knowledge`
VALUES ('80770455', '202108030125', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('80951284', '202108030302', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('80979490', '202108030310', '6', 0.135104840);
INSERT INTO `t_model_output_knowledge`
VALUES ('81018711', '202108030111', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81034895', '202108030228', '7', 0.831658900);
INSERT INTO `t_model_output_knowledge`
VALUES ('81036076', '202108030419', '5', 0.991769800);
INSERT INTO `t_model_output_knowledge`
VALUES ('81040851', '202108030414', '8', 0.922149960);
INSERT INTO `t_model_output_knowledge`
VALUES ('81051020', '202108030101', '8', 0.461384950);
INSERT INTO `t_model_output_knowledge`
VALUES ('81116467', '202108030106', '3', 0.050756216);
INSERT INTO `t_model_output_knowledge`
VALUES ('81245473', '202108030402', '7', 0.779802560);
INSERT INTO `t_model_output_knowledge`
VALUES ('81324222', '202108030103', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81377438', '202108030221', '3', 0.612033700);
INSERT INTO `t_model_output_knowledge`
VALUES ('81439847', '202108030315', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81470167', '202108030114', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81521307', '202108030124', '10', 0.007058386);
INSERT INTO `t_model_output_knowledge`
VALUES ('81587716', '202108030318', '5', 0.991252000);
INSERT INTO `t_model_output_knowledge`
VALUES ('81596192', '202108030422', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81688872', '202108030227', '7', 0.833196200);
INSERT INTO `t_model_output_knowledge`
VALUES ('81881640', '202108030202', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('81886344', '202108030208', '7', 0.053927560);
INSERT INTO `t_model_output_knowledge`
VALUES ('81975243', '202108030116', '1', 0.913552700);
INSERT INTO `t_model_output_knowledge`
VALUES ('82004082', '202108030415', '6', 0.058864832);
INSERT INTO `t_model_output_knowledge`
VALUES ('82005151', '202108030320', '6', 0.582389650);
INSERT INTO `t_model_output_knowledge`
VALUES ('82015224', '202108030203', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('82058704', '202108030416', '6', 0.007615961);
INSERT INTO `t_model_output_knowledge`
VALUES ('82113222', '201508010709', '6', 0.011289431);
INSERT INTO `t_model_output_knowledge`
VALUES ('82124048', '202108030429', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('82265546', '202108030305', '11', 0.980976760);
INSERT INTO `t_model_output_knowledge`
VALUES ('82291768', '201810040108', '5', 0.995196640);
INSERT INTO `t_model_output_knowledge`
VALUES ('82295070', '202108030125', '8', 0.791844300);
INSERT INTO `t_model_output_knowledge`
VALUES ('82381434', '202108030213', '10', 0.004142235);
INSERT INTO `t_model_output_knowledge`
VALUES ('82426565', '202108030406', '6', 0.026103297);
INSERT INTO `t_model_output_knowledge`
VALUES ('82457765', '202108030106', '5', 0.995448300);
INSERT INTO `t_model_output_knowledge`
VALUES ('82515170', '202108030328', '10', 0.054256540);
INSERT INTO `t_model_output_knowledge`
VALUES ('82585767', '202108030409', '10', 0.007397630);
INSERT INTO `t_model_output_knowledge`
VALUES ('82715201', '202108030309', '9', 0.965116260);
INSERT INTO `t_model_output_knowledge`
VALUES ('82761076', '202108030103', '8', 0.693100500);
INSERT INTO `t_model_output_knowledge`
VALUES ('82837732', '202108030326', '11', 0.995468400);
INSERT INTO `t_model_output_knowledge`
VALUES ('82874791', '202108030319', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('82928563', '202108030222', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83022312', '202108030129', '11', 0.991559000);
INSERT INTO `t_model_output_knowledge`
VALUES ('83034556', '202108030429', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83054734', '202108030223', '10', 0.038982127);
INSERT INTO `t_model_output_knowledge`
VALUES ('83174626', '202108030405', '10', 0.145152780);
INSERT INTO `t_model_output_knowledge`
VALUES ('83264230', '202108030415', '7', 0.844946860);
INSERT INTO `t_model_output_knowledge`
VALUES ('83429678', '202108030118', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83455264', '202108030413', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83718126', '202108030403', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83722528', '202108030306', '1', 0.119534925);
INSERT INTO `t_model_output_knowledge`
VALUES ('83727128', '202108030121', '11', 0.829452750);
INSERT INTO `t_model_output_knowledge`
VALUES ('83739225', '202108030226', '5', 0.525446500);
INSERT INTO `t_model_output_knowledge`
VALUES ('83756694', '202108030305', '1', 0.995956960);
INSERT INTO `t_model_output_knowledge`
VALUES ('83758349', '202108030320', '1', 0.996384260);
INSERT INTO `t_model_output_knowledge`
VALUES ('83790455', '202108030413', '11', 0.990724600);
INSERT INTO `t_model_output_knowledge`
VALUES ('83854830', '202108030429', '11', 0.985654530);
INSERT INTO `t_model_output_knowledge`
VALUES ('83861849', '202108030327', '9', 0.065649630);
INSERT INTO `t_model_output_knowledge`
VALUES ('83942118', '202108030212', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('84114673', '202108030303', '9', 0.060840060);
INSERT INTO `t_model_output_knowledge`
VALUES ('84150093', '202108030107', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('84168359', '202009070109', '10', 0.007809402);
INSERT INTO `t_model_output_knowledge`
VALUES ('84243755', '202108030213', '3', 0.016015781);
INSERT INTO `t_model_output_knowledge`
VALUES ('84246245', '202108030406', '1', 0.952904400);
INSERT INTO `t_model_output_knowledge`
VALUES ('84317808', '202108030315', '6', 0.048581680);
INSERT INTO `t_model_output_knowledge`
VALUES ('84363836', '202108030119', '9', 0.081397040);
INSERT INTO `t_model_output_knowledge`
VALUES ('84504142', '202108030323', '6', 0.004792688);
INSERT INTO `t_model_output_knowledge`
VALUES ('84640967', '202108030402', '11', 0.996981300);
INSERT INTO `t_model_output_knowledge`
VALUES ('84650783', '202108030225', '6', 0.109153160);
INSERT INTO `t_model_output_knowledge`
VALUES ('84672225', '202108030311', '5', 0.996288800);
INSERT INTO `t_model_output_knowledge`
VALUES ('84745224', '202108030409', '8', 0.815857770);
INSERT INTO `t_model_output_knowledge`
VALUES ('84793374', '202108030130', '8', 0.040882897);
INSERT INTO `t_model_output_knowledge`
VALUES ('84821817', '202108030123', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('84987560', '202108030414', '11', 0.991554440);
INSERT INTO `t_model_output_knowledge`
VALUES ('85125564', '202108030416', '10', 0.007615961);
INSERT INTO `t_model_output_knowledge`
VALUES ('85157178', '202108030221', '11', 0.991890430);
INSERT INTO `t_model_output_knowledge`
VALUES ('85272721', '202108030408', '1', 0.979556700);
INSERT INTO `t_model_output_knowledge`
VALUES ('85480473', '202108030225', '1', 0.995585560);
INSERT INTO `t_model_output_knowledge`
VALUES ('85623505', '202108030113', '9', 0.775425850);
INSERT INTO `t_model_output_knowledge`
VALUES ('85650031', '202108030322', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('85663407', '202009070125', '5', 0.986485100);
INSERT INTO `t_model_output_knowledge`
VALUES ('85761500', '202108030205', '10', 0.037817330);
INSERT INTO `t_model_output_knowledge`
VALUES ('86107279', '202108030308', '3', 0.054525960);
INSERT INTO `t_model_output_knowledge`
VALUES ('86137624', '202108030413', '10', 0.011207299);
INSERT INTO `t_model_output_knowledge`
VALUES ('86202169', '202108030424', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('86210728', '202108030311', '9', 0.970721240);
INSERT INTO `t_model_output_knowledge`
VALUES ('86358394', '202108030311', '10', 0.075921150);
INSERT INTO `t_model_output_knowledge`
VALUES ('86379355', '202108030328', '3', 0.847083900);
INSERT INTO `t_model_output_knowledge`
VALUES ('86520570', '202108030125', '5', 0.909891000);
INSERT INTO `t_model_output_knowledge`
VALUES ('86543297', '202006010214', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('86597847', '202108030408', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('86606900', '202108030316', '5', 0.988526460);
INSERT INTO `t_model_output_knowledge`
VALUES ('86632508', '202108030324', '6', 0.007514837);
INSERT INTO `t_model_output_knowledge`
VALUES ('86670668', '202108030224', '3', 0.105168890);
INSERT INTO `t_model_output_knowledge`
VALUES ('86698939', '202108030104', '1', 0.975629750);
INSERT INTO `t_model_output_knowledge`
VALUES ('86737865', '202108030330', '8', 0.113068940);
INSERT INTO `t_model_output_knowledge`
VALUES ('86746339', '202108030129', '10', 0.004210235);
INSERT INTO `t_model_output_knowledge`
VALUES ('86791957', '202108030321', '11', 0.949026640);
INSERT INTO `t_model_output_knowledge`
VALUES ('87108205', '202108030304', '6', 0.077939220);
INSERT INTO `t_model_output_knowledge`
VALUES ('87111553', '202108030208', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('87136281', '202108030428', '6', 0.067038700);
INSERT INTO `t_model_output_knowledge`
VALUES ('87177921', '202108030210', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('87264792', '202108030417', '1', 0.963933350);
INSERT INTO `t_model_output_knowledge`
VALUES ('87336337', '202108030405', '5', 0.986485100);
INSERT INTO `t_model_output_knowledge`
VALUES ('87365782', '202108030107', '11', 0.992257360);
INSERT INTO `t_model_output_knowledge`
VALUES ('87413221', '202108030330', '10', 0.026747545);
INSERT INTO `t_model_output_knowledge`
VALUES ('87436891', '202108030305', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('87573774', '202108030207', '7', 0.843732400);
INSERT INTO `t_model_output_knowledge`
VALUES ('87579027', '202108030320', '3', 0.028386956);
INSERT INTO `t_model_output_knowledge`
VALUES ('87710486', '202108030427', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88010318', '202009070109', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88278509', '202108030203', '10', 0.008138920);
INSERT INTO `t_model_output_knowledge`
VALUES ('88409276', '202108030318', '10', 0.524599970);
INSERT INTO `t_model_output_knowledge`
VALUES ('88415204', '202108030118', '11', 0.995432140);
INSERT INTO `t_model_output_knowledge`
VALUES ('88503506', '202108030330', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88533241', '202108030212', '1', 0.993873240);
INSERT INTO `t_model_output_knowledge`
VALUES ('88659967', '202108030129', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88765715', '202108030419', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88792802', '202108030217', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('88915894', '202108030105', '6', 0.037767373);
INSERT INTO `t_model_output_knowledge`
VALUES ('89044648', '202108030301', '10', 0.007232884);
INSERT INTO `t_model_output_knowledge`
VALUES ('89212598', '202108030418', '10', 0.028681835);
INSERT INTO `t_model_output_knowledge`
VALUES ('89310675', '201810040106', '9', 0.637864350);
INSERT INTO `t_model_output_knowledge`
VALUES ('89332729', '202108030422', '5', 0.969051700);
INSERT INTO `t_model_output_knowledge`
VALUES ('89374543', '202108030315', '1', 0.990808670);
INSERT INTO `t_model_output_knowledge`
VALUES ('89473010', '202108030117', '11', 0.994926200);
INSERT INTO `t_model_output_knowledge`
VALUES ('89491477', '202108030313', '6', 0.050862390);
INSERT INTO `t_model_output_knowledge`
VALUES ('89580906', '202108030227', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('89852937', '202108030403', '1', 0.987122000);
INSERT INTO `t_model_output_knowledge`
VALUES ('89960177', '202108030413', '6', 0.011207299);
INSERT INTO `t_model_output_knowledge`
VALUES ('89977752', '202108030109', '9', 0.056975428);
INSERT INTO `t_model_output_knowledge`
VALUES ('90077243', '202108030214', '8', 0.283213680);
INSERT INTO `t_model_output_knowledge`
VALUES ('90090847', '202108030104', '9', 0.074468290);
INSERT INTO `t_model_output_knowledge`
VALUES ('90159151', '202108030213', '7', 0.099716686);
INSERT INTO `t_model_output_knowledge`
VALUES ('90279927', '202108030405', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90308749', '202108030101', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90534432', '202108030215', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90576491', '202108030303', '1', 0.971114100);
INSERT INTO `t_model_output_knowledge`
VALUES ('90585885', '201810040106', '10', 0.047058820);
INSERT INTO `t_model_output_knowledge`
VALUES ('90592941', '202108030415', '8', 0.963911000);
INSERT INTO `t_model_output_knowledge`
VALUES ('90600602', '202108030128', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90617944', '202108030424', '9', 0.184544900);
INSERT INTO `t_model_output_knowledge`
VALUES ('90805282', '202108030407', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90836170', '202108030428', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('90861665', '202108030326', '3', 0.020930205);
INSERT INTO `t_model_output_knowledge`
VALUES ('90927742', '202108030401', '10', 0.278561950);
INSERT INTO `t_model_output_knowledge`
VALUES ('91005539', '202108030228', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('91150813', '202108030429', '6', 0.035502330);
INSERT INTO `t_model_output_knowledge`
VALUES ('91201329', '202108030408', '7', 0.401520580);
INSERT INTO `t_model_output_knowledge`
VALUES ('91213561', '201508010709', '5', 0.985112800);
INSERT INTO `t_model_output_knowledge`
VALUES ('91235710', '202108030226', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('91266824', '202108030125', '3', 0.023844216);
INSERT INTO `t_model_output_knowledge`
VALUES ('91292426', '202108030314', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('91299780', '202108030325', '3', 0.024080280);
INSERT INTO `t_model_output_knowledge`
VALUES ('91301704', '202108030313', '1', 0.967838400);
INSERT INTO `t_model_output_knowledge`
VALUES ('91311680', '202108030201', '7', 0.172653470);
INSERT INTO `t_model_output_knowledge`
VALUES ('91357637', '202108030217', '10', 0.069874264);
INSERT INTO `t_model_output_knowledge`
VALUES ('91441698', '202108030304', '3', 0.075803930);
INSERT INTO `t_model_output_knowledge`
VALUES ('91553185', '202108030209', '11', 0.989892540);
INSERT INTO `t_model_output_knowledge`
VALUES ('91588326', '202108030307', '8', 0.026515990);
INSERT INTO `t_model_output_knowledge`
VALUES ('91740463', '202108030419', '8', 0.913472400);
INSERT INTO `t_model_output_knowledge`
VALUES ('91805940', '202108030407', '8', 0.732925800);
INSERT INTO `t_model_output_knowledge`
VALUES ('91814360', '202108030226', '6', 0.028163044);
INSERT INTO `t_model_output_knowledge`
VALUES ('91856539', '202108030419', '3', 0.347325770);
INSERT INTO `t_model_output_knowledge`
VALUES ('91860385', '202108030412', '6', 0.204379480);
INSERT INTO `t_model_output_knowledge`
VALUES ('91917897', '202108030227', '11', 0.987579400);
INSERT INTO `t_model_output_knowledge`
VALUES ('91921434', '202108030114', '5', 0.995196640);
INSERT INTO `t_model_output_knowledge`
VALUES ('91934256', '202108030229', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('92073501', '202108030303', '10', 0.015222195);
INSERT INTO `t_model_output_knowledge`
VALUES ('92109647', '202108030421', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('92192397', '202108030201', '6', 0.051242445);
INSERT INTO `t_model_output_knowledge`
VALUES ('92194891', '202108030214', '1', 0.990887300);
INSERT INTO `t_model_output_knowledge`
VALUES ('92226828', '202108030418', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('92364006', '202108030122', '8', 0.890198300);
INSERT INTO `t_model_output_knowledge`
VALUES ('92411839', '202108030128', '11', 0.289791550);
INSERT INTO `t_model_output_knowledge`
VALUES ('92543793', '202108030113', '8', 0.944755200);
INSERT INTO `t_model_output_knowledge`
VALUES ('92553354', '202108030227', '1', 0.996838100);
INSERT INTO `t_model_output_knowledge`
VALUES ('92634858', '202108030221', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('92648713', '202108030110', '3', 0.132470900);
INSERT INTO `t_model_output_knowledge`
VALUES ('92742534', '202006010214', '11', 0.994817100);
INSERT INTO `t_model_output_knowledge`
VALUES ('92749774', '202108030428', '3', 0.036199804);
INSERT INTO `t_model_output_knowledge`
VALUES ('92761241', '202108030221', '8', 0.853041770);
INSERT INTO `t_model_output_knowledge`
VALUES ('92767443', '202108030115', '3', 0.018259004);
INSERT INTO `t_model_output_knowledge`
VALUES ('92769756', '202108030417', '8', 0.372426600);
INSERT INTO `t_model_output_knowledge`
VALUES ('92807054', '202006010214', '3', 0.112041526);
INSERT INTO `t_model_output_knowledge`
VALUES ('92813559', '202108030118', '1', 0.995906230);
INSERT INTO `t_model_output_knowledge`
VALUES ('92944704', '202108030427', '11', 0.995182000);
INSERT INTO `t_model_output_knowledge`
VALUES ('92946555', '202108030421', '5', 0.995609200);
INSERT INTO `t_model_output_knowledge`
VALUES ('92976688', '202108030416', '8', 0.853545400);
INSERT INTO `t_model_output_knowledge`
VALUES ('93010322', '202108030227', '10', 0.005957860);
INSERT INTO `t_model_output_knowledge`
VALUES ('93023289', '202108030315', '10', 0.048581680);
INSERT INTO `t_model_output_knowledge`
VALUES ('93041736', '202108030227', '8', 0.873713850);
INSERT INTO `t_model_output_knowledge`
VALUES ('93104528', '202108030102', '7', 0.045333310);
INSERT INTO `t_model_output_knowledge`
VALUES ('93152602', '202108030210', '11', 0.987959150);
INSERT INTO `t_model_output_knowledge`
VALUES ('93173880', '202108030230', '5', 0.973459000);
INSERT INTO `t_model_output_knowledge`
VALUES ('93257735', '202108030427', '10', 0.017521873);
INSERT INTO `t_model_output_knowledge`
VALUES ('93258057', '202108030126', '9', 0.774587630);
INSERT INTO `t_model_output_knowledge`
VALUES ('93343938', '202108030211', '6', 0.026466083);
INSERT INTO `t_model_output_knowledge`
VALUES ('93351619', '202108030220', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('93385163', '202108030303', '5', 0.997487900);
INSERT INTO `t_model_output_knowledge`
VALUES ('93399441', '202108030322', '6', 0.018649670);
INSERT INTO `t_model_output_knowledge`
VALUES ('93436470', '202108030228', '8', 0.747385560);
INSERT INTO `t_model_output_knowledge`
VALUES ('93602320', '202108030327', '5', 0.975613950);
INSERT INTO `t_model_output_knowledge`
VALUES ('93609629', '202108030211', '8', 0.054765347);
INSERT INTO `t_model_output_knowledge`
VALUES ('93620138', '202108030207', '6', 0.758296600);
INSERT INTO `t_model_output_knowledge`
VALUES ('93644750', '202108030417', '9', 0.156021970);
INSERT INTO `t_model_output_knowledge`
VALUES ('93751385', '202108030420', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('93770758', '202108030410', '1', 0.945459900);
INSERT INTO `t_model_output_knowledge`
VALUES ('93849584', '202108030230', '8', 0.135859980);
INSERT INTO `t_model_output_knowledge`
VALUES ('93974009', '202108030307', '3', 0.007312280);
INSERT INTO `t_model_output_knowledge`
VALUES ('94067229', '202108030413', '5', 0.986225000);
INSERT INTO `t_model_output_knowledge`
VALUES ('94228415', '202108030108', '9', 0.941058340);
INSERT INTO `t_model_output_knowledge`
VALUES ('94279165', '202108030329', '7', 0.138387650);
INSERT INTO `t_model_output_knowledge`
VALUES ('94369757', '202108030412', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94460594', '202108030407', '6', 0.053287696);
INSERT INTO `t_model_output_knowledge`
VALUES ('94463079', '202108030316', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94466784', '202108030315', '11', 0.989051100);
INSERT INTO `t_model_output_knowledge`
VALUES ('94517070', '202108030218', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94524352', '202108030323', '5', 0.994912270);
INSERT INTO `t_model_output_knowledge`
VALUES ('94605637', '202009070109', '8', 0.928255440);
INSERT INTO `t_model_output_knowledge`
VALUES ('94685117', '202108030105', '9', 0.048295025);
INSERT INTO `t_model_output_knowledge`
VALUES ('94690095', '202108030108', '7', 0.672160700);
INSERT INTO `t_model_output_knowledge`
VALUES ('94697673', '202108030125', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94705683', '202108030306', '8', 0.131455150);
INSERT INTO `t_model_output_knowledge`
VALUES ('94707418', '202108030123', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94825172', '202108030116', '10', 0.008312354);
INSERT INTO `t_model_output_knowledge`
VALUES ('94880564', '202108030122', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94972596', '202108030308', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('94980322', '202108030328', '7', 0.790374760);
INSERT INTO `t_model_output_knowledge`
VALUES ('95127335', '202108030208', '10', 0.049732010);
INSERT INTO `t_model_output_knowledge`
VALUES ('95191635', '202006010214', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('95233091', '202108030411', '9', 0.062988155);
INSERT INTO `t_model_output_knowledge`
VALUES ('95246514', '202108030130', '7', 0.125559450);
INSERT INTO `t_model_output_knowledge`
VALUES ('95278310', '202108030323', '10', 0.004792688);
INSERT INTO `t_model_output_knowledge`
VALUES ('95415534', '202108030113', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('95495172', '202108030418', '7', 0.052976053);
INSERT INTO `t_model_output_knowledge`
VALUES ('95560198', '202108030329', '3', 0.017172016);
INSERT INTO `t_model_output_knowledge`
VALUES ('95578163', '202108030223', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('95621265', '202108030211', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('95722585', '202108030106', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('95751809', '202108030314', '10', 0.045656066);
INSERT INTO `t_model_output_knowledge`
VALUES ('95868663', '202108030410', '11', 0.989969100);
INSERT INTO `t_model_output_knowledge`
VALUES ('95972970', '202108030222', '5', 0.982353300);
INSERT INTO `t_model_output_knowledge`
VALUES ('96010509', '202108030316', '8', 0.165740980);
INSERT INTO `t_model_output_knowledge`
VALUES ('96014414', '202009070125', '1', 0.996750700);
INSERT INTO `t_model_output_knowledge`
VALUES ('96149440', '202108030316', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('96229984', '202108030102', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('96322467', '202108030401', '6', 0.278561950);
INSERT INTO `t_model_output_knowledge`
VALUES ('96372046', '202108030318', '3', 0.641808030);
INSERT INTO `t_model_output_knowledge`
VALUES ('96393485', '202108030206', '8', 0.167018410);
INSERT INTO `t_model_output_knowledge`
VALUES ('96414940', '202108030221', '6', 0.014691204);
INSERT INTO `t_model_output_knowledge`
VALUES ('96480595', '202108030409', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('96487036', '202108030317', '1', 0.985540200);
INSERT INTO `t_model_output_knowledge`
VALUES ('96582537', '202108030322', '10', 0.018649670);
INSERT INTO `t_model_output_knowledge`
VALUES ('96597184', '202108030309', '10', 0.045329710);
INSERT INTO `t_model_output_knowledge`
VALUES ('96668123', '202108030105', '1', 0.986465750);
INSERT INTO `t_model_output_knowledge`
VALUES ('96797103', '202108030224', '5', 0.981518860);
INSERT INTO `t_model_output_knowledge`
VALUES ('96902694', '202108030429', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('97078331', '202108030429', '5', 0.996242500);
INSERT INTO `t_model_output_knowledge`
VALUES ('97184837', '202108030424', '1', 0.960191800);
INSERT INTO `t_model_output_knowledge`
VALUES ('97259084', '202108030124', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('97407769', '202108030220', '11', 0.992310760);
INSERT INTO `t_model_output_knowledge`
VALUES ('97446759', '202108030225', '7', 0.118315970);
INSERT INTO `t_model_output_knowledge`
VALUES ('97515010', '202108030424', '8', 0.063863060);
INSERT INTO `t_model_output_knowledge`
VALUES ('97558308', '202108030408', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('97592627', '202108030207', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('97644630', '202108030418', '6', 0.028681835);
INSERT INTO `t_model_output_knowledge`
VALUES ('97708860', '202108030219', '6', 0.159914550);
INSERT INTO `t_model_output_knowledge`
VALUES ('97787245', '202009070125', '9', 0.109535480);
INSERT INTO `t_model_output_knowledge`
VALUES ('97837139', '202108030328', '6', 0.054256540);
INSERT INTO `t_model_output_knowledge`
VALUES ('97862539', '202108030425', '5', 0.995154260);
INSERT INTO `t_model_output_knowledge`
VALUES ('97874494', '202108030205', '6', 0.037817330);
INSERT INTO `t_model_output_knowledge`
VALUES ('97924868', '202108030215', '3', 0.778143000);
INSERT INTO `t_model_output_knowledge`
VALUES ('97924920', '202108030416', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('97929272', '202108030106', '1', 0.974158700);
INSERT INTO `t_model_output_knowledge`
VALUES ('98044140', '202108030428', '8', 0.911388160);
INSERT INTO `t_model_output_knowledge`
VALUES ('98045340', '202009070125', '3', 0.072955450);
INSERT INTO `t_model_output_knowledge`
VALUES ('98058710', '202108030416', '5', 0.993440450);
INSERT INTO `t_model_output_knowledge`
VALUES ('98075680', '202108030326', '9', 0.824203000);
INSERT INTO `t_model_output_knowledge`
VALUES ('98087524', '202108030204', '3', 0.710071270);
INSERT INTO `t_model_output_knowledge`
VALUES ('98092110', '202108030211', '5', 0.977745000);
INSERT INTO `t_model_output_knowledge`
VALUES ('98126656', '202108030209', '8', 0.072858760);
INSERT INTO `t_model_output_knowledge`
VALUES ('98156886', '202108030222', '8', 0.957306400);
INSERT INTO `t_model_output_knowledge`
VALUES ('98290729', '201508010709', '1', 0.976872200);
INSERT INTO `t_model_output_knowledge`
VALUES ('98292657', '202108030308', '9', 0.873110400);
INSERT INTO `t_model_output_knowledge`
VALUES ('98350553', '202108030210', '1', 0.996779860);
INSERT INTO `t_model_output_knowledge`
VALUES ('98359214', '202108030214', '3', 0.120105540);
INSERT INTO `t_model_output_knowledge`
VALUES ('98516382', '202108030103', '3', 0.017855043);
INSERT INTO `t_model_output_knowledge`
VALUES ('98524443', '202108030215', '10', 0.017244741);
INSERT INTO `t_model_output_knowledge`
VALUES ('98567083', '202108030411', '3', 0.702621000);
INSERT INTO `t_model_output_knowledge`
VALUES ('98605620', '202108030219', '11', 0.993904200);
INSERT INTO `t_model_output_knowledge`
VALUES ('98732345', '202108030427', '5', 0.600620400);
INSERT INTO `t_model_output_knowledge`
VALUES ('98739989', '202108030427', '9', 0.092825755);
INSERT INTO `t_model_output_knowledge`
VALUES ('98830634', '202108030115', '8', 0.848173260);
INSERT INTO `t_model_output_knowledge`
VALUES ('98967744', '201810040106', '5', 0.995196640);
INSERT INTO `t_model_output_knowledge`
VALUES ('99012921', '202108030324', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('99031295', '202108030116', '3', 0.013102761);
INSERT INTO `t_model_output_knowledge`
VALUES ('99067846', '202108030118', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('99107895', '202108030326', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('99152712', '202108030212', '2', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('99321840', '202108030314', '6', 0.045656066);
INSERT INTO `t_model_output_knowledge`
VALUES ('99359100', '202108030408', '6', 0.011407272);
INSERT INTO `t_model_output_knowledge`
VALUES ('99389805', '202108030428', '9', 0.265291040);
INSERT INTO `t_model_output_knowledge`
VALUES ('99407826', '202108030219', '10', 0.159914550);
INSERT INTO `t_model_output_knowledge`
VALUES ('99478805', '202108030122', '10', 0.005006817);
INSERT INTO `t_model_output_knowledge`
VALUES ('99510890', '202108030226', '10', 0.028163044);
INSERT INTO `t_model_output_knowledge`
VALUES ('99520940', '202108030119', '8', 0.130543140);
INSERT INTO `t_model_output_knowledge`
VALUES ('99589505', '202108030404', '1', 0.995955600);
INSERT INTO `t_model_output_knowledge`
VALUES ('99674414', '202108030221', '5', 0.850862900);
INSERT INTO `t_model_output_knowledge`
VALUES ('99699427', '202108030202', '4', 0.989369630);
INSERT INTO `t_model_output_knowledge`
VALUES ('99733572', '202108030112', '1', 0.996102450);
INSERT INTO `t_model_output_knowledge`
VALUES ('99900720', '202108030405', '8', 0.961268900);

-- ----------------------------
-- Table structure for t_model_output_score
-- ----------------------------
DROP TABLE IF EXISTS `t_model_output_score`;
CREATE TABLE `t_model_output_score`
(
    `pk_model_output_score_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `student_id`               char(12) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `exam_score`               decimal(10, 6)                                         NOT NULL,
    PRIMARY KEY (`pk_model_output_score_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_output_score
-- ----------------------------
INSERT INTO `t_model_output_score`
VALUES ('119826772', '202108030321', 65.188210);
INSERT INTO `t_model_output_score`
VALUES ('12834742', '202108030227', 73.219610);
INSERT INTO `t_model_output_score`
VALUES ('135498051', '202108030330', 27.849330);
INSERT INTO `t_model_output_score`
VALUES ('153268362', '202108030130', 69.181830);
INSERT INTO `t_model_output_score`
VALUES ('167125405', '202108030324', 78.881030);
INSERT INTO `t_model_output_score`
VALUES ('167848078', '202108030328', 71.698616);
INSERT INTO `t_model_output_score`
VALUES ('170927191', '202108030102', 77.424770);
INSERT INTO `t_model_output_score`
VALUES ('173953411', '202108030203', 78.143425);
INSERT INTO `t_model_output_score`
VALUES ('175953682', '202108030114', 81.013530);
INSERT INTO `t_model_output_score`
VALUES ('207769460', '202108030209', 79.021920);
INSERT INTO `t_model_output_score`
VALUES ('210385201', '202108030204', 84.469360);
INSERT INTO `t_model_output_score`
VALUES ('212535256', '202108030403', 75.444620);
INSERT INTO `t_model_output_score`
VALUES ('213848968', '202108030108', 85.639180);
INSERT INTO `t_model_output_score`
VALUES ('220293868', '202108030408', 76.122890);
INSERT INTO `t_model_output_score`
VALUES ('227461795', '201508010709', 68.320990);
INSERT INTO `t_model_output_score`
VALUES ('227720798', '202108030116', 37.083927);
INSERT INTO `t_model_output_score`
VALUES ('23295387', '202108030404', 79.024270);
INSERT INTO `t_model_output_score`
VALUES ('248585985', '202108030305', 72.593420);
INSERT INTO `t_model_output_score`
VALUES ('254315055', '202108030310', 81.558370);
INSERT INTO `t_model_output_score`
VALUES ('256323713', '202108030424', 70.456430);
INSERT INTO `t_model_output_score`
VALUES ('275485900', '202108030127', 76.602470);
INSERT INTO `t_model_output_score`
VALUES ('280139403', '202108030208', 80.487620);
INSERT INTO `t_model_output_score`
VALUES ('293838932', '202108030219', 87.055810);
INSERT INTO `t_model_output_score`
VALUES ('294819681', '202108030406', 75.059550);
INSERT INTO `t_model_output_score`
VALUES ('297959470', '202108030202', 74.991080);
INSERT INTO `t_model_output_score`
VALUES ('302851816', '202108030323', 80.468475);
INSERT INTO `t_model_output_score`
VALUES ('308116785', '202108030325', 80.619540);
INSERT INTO `t_model_output_score`
VALUES ('312936483', '202108030302', 67.472530);
INSERT INTO `t_model_output_score`
VALUES ('333356520', '202108030407', 68.591070);
INSERT INTO `t_model_output_score`
VALUES ('340431752', '202108030413', 79.937540);
INSERT INTO `t_model_output_score`
VALUES ('350846607', '202108030123', 79.472466);
INSERT INTO `t_model_output_score`
VALUES ('360660948', '202108030415', 81.392350);
INSERT INTO `t_model_output_score`
VALUES ('36312828', '202108030307', 73.257126);
INSERT INTO `t_model_output_score`
VALUES ('372510193', '202108030118', 77.116356);
INSERT INTO `t_model_output_score`
VALUES ('373834449', '201810040108', 83.295400);
INSERT INTO `t_model_output_score`
VALUES ('378333608', '202108030419', 79.451120);
INSERT INTO `t_model_output_score`
VALUES ('386544889', '202009070109', 71.452780);
INSERT INTO `t_model_output_score`
VALUES ('389970099', '202108030402', 79.453380);
INSERT INTO `t_model_output_score`
VALUES ('395736498', '202108030210', 89.332360);
INSERT INTO `t_model_output_score`
VALUES ('400717742', '202108030115', 81.626510);
INSERT INTO `t_model_output_score`
VALUES ('404083834', '202108030428', 79.291810);
INSERT INTO `t_model_output_score`
VALUES ('40941466', '202108030303', 81.375800);
INSERT INTO `t_model_output_score`
VALUES ('422295309', '202108030119', 67.255330);
INSERT INTO `t_model_output_score`
VALUES ('422301803', '202108030216', 71.142910);
INSERT INTO `t_model_output_score`
VALUES ('455448421', '202108030410', 62.570390);
INSERT INTO `t_model_output_score`
VALUES ('480631117', '202108030401', 79.076680);
INSERT INTO `t_model_output_score`
VALUES ('482378754', '202108030105', 80.360310);
INSERT INTO `t_model_output_score`
VALUES ('482814498', '202108030308', 86.117990);
INSERT INTO `t_model_output_score`
VALUES ('483971892', '202108030225', 76.833670);
INSERT INTO `t_model_output_score`
VALUES ('484669306', '202108030121', 72.942250);
INSERT INTO `t_model_output_score`
VALUES ('486611122', '202108030329', 62.423264);
INSERT INTO `t_model_output_score`
VALUES ('490732940', '202108030125', 64.987460);
INSERT INTO `t_model_output_score`
VALUES ('492140690', '202108030327', 66.425760);
INSERT INTO `t_model_output_score`
VALUES ('507497192', '202108030215', 82.947365);
INSERT INTO `t_model_output_score`
VALUES ('512981661', '202108030117', 75.879940);
INSERT INTO `t_model_output_score`
VALUES ('524962472', '202108030311', 80.059740);
INSERT INTO `t_model_output_score`
VALUES ('528960987', '202108030412', 80.708720);
INSERT INTO `t_model_output_score`
VALUES ('539305850', '202108030228', 83.509060);
INSERT INTO `t_model_output_score`
VALUES ('542525051', '202108030422', 52.672703);
INSERT INTO `t_model_output_score`
VALUES ('54365967', '202009070125', 84.863075);
INSERT INTO `t_model_output_score`
VALUES ('568345322', '202108030427', 81.940820);
INSERT INTO `t_model_output_score`
VALUES ('571667261', '202108030317', 71.180275);
INSERT INTO `t_model_output_score`
VALUES ('573799715', '202108030423', 75.382034);
INSERT INTO `t_model_output_score`
VALUES ('585457179', '202108030103', 78.492530);
INSERT INTO `t_model_output_score`
VALUES ('597731846', '202108030322', 72.537850);
INSERT INTO `t_model_output_score`
VALUES ('60263891', '202108030229', 79.494820);
INSERT INTO `t_model_output_score`
VALUES ('609194348', '202108030414', 80.214020);
INSERT INTO `t_model_output_score`
VALUES ('617178748', '202108030301', 68.575940);
INSERT INTO `t_model_output_score`
VALUES ('618353417', '202108030214', 79.741510);
INSERT INTO `t_model_output_score`
VALUES ('624834494', '202108030212', 76.530090);
INSERT INTO `t_model_output_score`
VALUES ('642576785', '202108030113', 77.024376);
INSERT INTO `t_model_output_score`
VALUES ('647925313', '202108030226', 87.018470);
INSERT INTO `t_model_output_score`
VALUES ('651573696', '202108030309', 79.068940);
INSERT INTO `t_model_output_score`
VALUES ('658917745', '202108030104', 77.753210);
INSERT INTO `t_model_output_score`
VALUES ('665412155', '202108030316', 69.236410);
INSERT INTO `t_model_output_score`
VALUES ('697640119', '202108030429', 83.436910);
INSERT INTO `t_model_output_score`
VALUES ('707513324', '202108030409', 74.354920);
INSERT INTO `t_model_output_score`
VALUES ('710784371', '202108030222', 78.649376);
INSERT INTO `t_model_output_score`
VALUES ('724446082', '202108030217', 77.677700);
INSERT INTO `t_model_output_score`
VALUES ('741806786', '202108030126', 66.683860);
INSERT INTO `t_model_output_score`
VALUES ('764097402', '202108030224', 90.288530);
INSERT INTO `t_model_output_score`
VALUES ('778587612', '202108030112', 77.547325);
INSERT INTO `t_model_output_score`
VALUES ('783758172', '202108030314', 81.260360);
INSERT INTO `t_model_output_score`
VALUES ('786977349', '202108030417', 68.817220);
INSERT INTO `t_model_output_score`
VALUES ('787925100', '202108030304', 85.773605);
INSERT INTO `t_model_output_score`
VALUES ('789084914', '201810040106', 83.255900);
INSERT INTO `t_model_output_score`
VALUES ('789917642', '202108030221', 85.836330);
INSERT INTO `t_model_output_score`
VALUES ('793750434', '202108030411', 73.318700);
INSERT INTO `t_model_output_score`
VALUES ('804397596', '202108030315', 81.123880);
INSERT INTO `t_model_output_score`
VALUES ('808666680', '202108030211', 85.722360);
INSERT INTO `t_model_output_score`
VALUES ('81056841', '202108030218', 83.810460);
INSERT INTO `t_model_output_score`
VALUES ('811306232', '202108030109', 77.965920);
INSERT INTO `t_model_output_score`
VALUES ('813241770', '202108030207', 78.118220);
INSERT INTO `t_model_output_score`
VALUES ('813602234', '202108030120', 79.462500);
INSERT INTO `t_model_output_score`
VALUES ('819917132', '202108030421', 83.180560);
INSERT INTO `t_model_output_score`
VALUES ('830184219', '202108030122', 70.596090);
INSERT INTO `t_model_output_score`
VALUES ('83413114', '202108030318', 65.477350);
INSERT INTO `t_model_output_score`
VALUES ('837302879', '202108030306', 67.073570);
INSERT INTO `t_model_output_score`
VALUES ('855899975', '202108030110', 81.412530);
INSERT INTO `t_model_output_score`
VALUES ('856755099', '202108030320', 80.057760);
INSERT INTO `t_model_output_score`
VALUES ('86178152', '202006010214', 82.411156);
INSERT INTO `t_model_output_score`
VALUES ('863548443', '202108030416', 74.795880);
INSERT INTO `t_model_output_score`
VALUES ('864742370', '202108030124', 33.639710);
INSERT INTO `t_model_output_score`
VALUES ('86807626', '202108030223', 82.741020);
INSERT INTO `t_model_output_score`
VALUES ('870535728', '202108030128', 75.500175);
INSERT INTO `t_model_output_score`
VALUES ('875811267', '202108030201', 77.714775);
INSERT INTO `t_model_output_score`
VALUES ('876980116', '202108030418', 63.254356);
INSERT INTO `t_model_output_score`
VALUES ('877065848', '202108030101', 81.801796);
INSERT INTO `t_model_output_score`
VALUES ('879970145', '202108030426', 77.513275);
INSERT INTO `t_model_output_score`
VALUES ('883399684', '202108030420', 76.222660);
INSERT INTO `t_model_output_score`
VALUES ('884608852', '202108030312', 76.387690);
INSERT INTO `t_model_output_score`
VALUES ('910980633', '202108030111', 77.505730);
INSERT INTO `t_model_output_score`
VALUES ('915242361', '202108030313', 76.326640);
INSERT INTO `t_model_output_score`
VALUES ('924906246', '202108030205', 83.393290);
INSERT INTO `t_model_output_score`
VALUES ('927580866', '202108030206', 82.918785);
INSERT INTO `t_model_output_score`
VALUES ('933467674', '202108030107', 83.466140);
INSERT INTO `t_model_output_score`
VALUES ('935271717', '202108030326', 77.528480);
INSERT INTO `t_model_output_score`
VALUES ('945137699', '202108030129', 70.807945);
INSERT INTO `t_model_output_score`
VALUES ('965759216', '202108030220', 65.414860);
INSERT INTO `t_model_output_score`
VALUES ('970617643', '202108030213', 75.642320);
INSERT INTO `t_model_output_score`
VALUES ('978106289', '202108030425', 79.274635);
INSERT INTO `t_model_output_score`
VALUES ('978258216', '202108030319', 76.460045);
INSERT INTO `t_model_output_score`
VALUES ('982328735', '202108030405', 81.447830);
INSERT INTO `t_model_output_score`
VALUES ('995420717', '202108030230', 50.374367);
INSERT INTO `t_model_output_score`
VALUES ('99763329', '202108030106', 75.051090);

-- ----------------------------
-- Table structure for t_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_problem`;
CREATE TABLE `t_problem`
(
    `pk_problem_id`      varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `id`                 varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `knowledge_point_id` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `name`               varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `difficulty`         char(1) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `label`              varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `deleted`            int                                                    NOT NULL,
    PRIMARY KEY (`pk_problem_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_problem
-- ----------------------------
INSERT INTO `t_problem`
VALUES ('10472497', '39', '4', '点和正方形的关系', '3', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('11715766', '7', '1', '字频统计', '3', '继承', 0);
INSERT INTO `t_problem`
VALUES ('12382825', '48', '5', '字符串反转（指针实现）', '3', '指针', 0);
INSERT INTO `t_problem`
VALUES ('12414218', '36', '4', '招聘', '3', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('13124660', '116', '11', '坐标格式化处理', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('13588248', '25', '3', '约瑟夫问题', '2', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('15940807', '2', '1', '组个最小数', '1', '继承', 0);
INSERT INTO `t_problem`
VALUES ('16003382', '15', '2', '占座位', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('16192387', '50', '5', '相交链表', '3', '指针', 0);
INSERT INTO `t_problem`
VALUES ('17182755', '120', '11', '支票代码输出', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('17477876', '40', '5', '模拟实现扑克牌', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('17499028', '114', '11', 'sizeof的作用', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('18487694', '115', '11', '数据类型存储', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('18704408', '64', '7', '罗马数字转整数', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('19197467', '60', '6', '最大公约数和最小公倍数', '3', '函数', 0);
INSERT INTO `t_problem`
VALUES ('19568502', '21', '2', '相同生日', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('20161852', '77', '8', '删除有序数组中的重复项', '1', '数组', 0);
INSERT INTO `t_problem`
VALUES ('20498604', '90', '9', '金币', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('20962209', '17', '2', '最1的计算机', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('21084265', '75', '7', '通配符匹配', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('21219480', '28', '4', '评委打分', '1', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('21230250', '108', '10', 'ch3-5 3,5,7整除', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('21396478', '14', '2', '带通配符的数', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('21670877', '55', '6', '低洼地', '1', '函数', 0);
INSERT INTO `t_problem`
VALUES ('21801918', '113', '11', '游泳训练时间计算', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('22080678', '111', '10', '三个人比大小', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('22965147', '70', '7', 'Z字形变换', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('23731468', '68', '7', '无重复字符的最长子串', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('23746188', '74', '7', '最长有效括号', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('24643321', '83', '8', '四数之和', '2', '数组', 0);
INSERT INTO `t_problem`
VALUES ('26763750', '49', '5', '合并两个有序数组', '3', '指针', 0);
INSERT INTO `t_problem`
VALUES ('26856634', '102', '10', '走路去上课还是骑车去上课？', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('26992686', '26', '3', '菜单类的设计与实现', '3', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('27749402', '103', '10', '这个月有多少天？', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('27774839', '107', '10', '四个数排序', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('28803891', '62', '6', '西游记公司', '3', '函数', 0);
INSERT INTO `t_problem`
VALUES ('29757630', '105', '10', '输入字符统计', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('29997107', '87', '8', '接雨水', '3', '数组', 0);
INSERT INTO `t_problem`
VALUES ('33914249', '16', '2', '写出来吧', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('34607552', '72', '7', '正则表达式匹配', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('35327328', '41', '5', '删除有序数组中的重复项', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('36295479', '30', '4', '公共钥匙盒', '1', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('37358885', '71', '7', '字符串转换整数 (atoi)', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('39587428', '67', '7', '最后一个单词的长度', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('40232215', '19', '2', '成绩大排队', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('41051115', '12', '2', '字符串数字置换 ', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('41203674', '61', '6', '阶乘之和', '3', '函数', 0);
INSERT INTO `t_problem`
VALUES ('41983305', '59', '6', '小鱼的数字游戏', '2', '函数', 0);
INSERT INTO `t_problem`
VALUES ('42146781', '99', '9', '懒惰的松雅', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('43618858', '10', '2', '最大报销额', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('43911792', '122', '11', 'RGB图像', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('44163136', '4', '1', '回文串 ', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('44356917', '104', '10', 'ch3-4 分段函数求解', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('44473714', '66', '7', '有效的括号', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('44760095', '34', '4', '画矩形', '2', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('45406023', '42', '5', '验证回文串', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('45909943', '118', '11', '苹果和虫子', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('48293309', '94', '9', '求sin(x)的近似值', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('48645378', '32', '4', '选举', '2', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('49485506', '24', '3', '学生类的设计与实现', '2', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('51934703', '88', '9', '除法的精确计算', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('52849260', '98', '9', '今夕何夕', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('53286597', '96', '9', '数字游戏', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('54559806', '81', '8', '三数之和', '2', '数组', 0);
INSERT INTO `t_problem`
VALUES ('55368637', '92', '9', '松雅旅馆的自动门', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('55394406', '73', '7', '串联所有单词的子串', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('56220331', '79', '8', '搜索插入位置', '1', '数组', 0);
INSERT INTO `t_problem`
VALUES ('56648321', '29', '4', '火星人足球赛', '1', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('56953676', '44', '5', '数组奇偶排列', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('57008262', '91', '9', '松雅喜欢玩纸牌', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('57456230', '121', '11', '温度表达转化', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('57578886', '117', '11', '字符输出', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('58091472', '123', '11', '转义字符', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('58370420', '57', '6', '超级玛丽游戏', '2', '函数', 0);
INSERT INTO `t_problem`
VALUES ('58955359', '100', '10', '三个数', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('60141971', '11', '2', 'ab串', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('60395767', '110', '10', 'ch3-6 成绩分类', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('63087111', '33', '4', '看电影', '2', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('63493081', '80', '8', '盛最多水的容器', '2', '数组', 0);
INSERT INTO `t_problem`
VALUES ('63511368', '93', '9', '找7', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('64516091', '23', '3', '书籍类的设计与实现', '1', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('64802498', '97', '9', '找12', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('65102501', '31', '4', '计算星期几', '1', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('65341964', '85', '8', '解数独', '3', '数组', 0);
INSERT INTO `t_problem`
VALUES ('66212595', '58', '6', '硬币翻转', '2', '函数', 0);
INSERT INTO `t_problem`
VALUES ('66704923', '22', '3', 'Point类的设计与实现', '1', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('67176272', '27', '3', '矩阵计算', '3', '类与对象', 0);
INSERT INTO `t_problem`
VALUES ('67363318', '6', '1', '相等的多项式', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('68169805', '1', '1', '恺撒Caesar密码', '1', '继承', 0);
INSERT INTO `t_problem`
VALUES ('68437883', '76', '8', '两数之和', '1', '数组', 0);
INSERT INTO `t_problem`
VALUES ('69656663', '78', '8', '移除元素', '1', '数组', 0);
INSERT INTO `t_problem`
VALUES ('70975665', '54', '6', '梦中的统计', '1', '函数', 0);
INSERT INTO `t_problem`
VALUES ('71729458', '53', '6', '汉诺塔问题', '1', '函数', 0);
INSERT INTO `t_problem`
VALUES ('71880529', '9', '1', '最少钱币数', '3', '继承', 0);
INSERT INTO `t_problem`
VALUES ('72060694', '82', '8', '最接近的三数之和', '2', '数组', 0);
INSERT INTO `t_problem`
VALUES ('72846073', '20', '2', '到底买不买', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('73020746', '35', '4', '计算线段长度', '2', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('74552085', '51', '5', '两个数组的交集', '3', '指针', 0);
INSERT INTO `t_problem`
VALUES ('76543716', '47', '5', '反转字符串', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('76713340', '18', '2', '愚人节的礼物', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('76778454', '119', '11', 'c++标识符', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('76882875', '86', '8', '缺失的第一个正数', '3', '数组', 0);
INSERT INTO `t_problem`
VALUES ('77837937', '65', '7', '最长公共前缀', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('78113944', '84', '8', '寻找两个正序数组的中位数', '3', '数组', 0);
INSERT INTO `t_problem`
VALUES ('79258792', '37', '4', '青蛙与蚊子', '3', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('81378166', '38', '4', '对齐输出', '3', '结构体', 0);
INSERT INTO `t_problem`
VALUES ('83611028', '101', '10', '小芳找工作', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('83850992', '8', '1', '蛇行矩阵', '3', '继承', 0);
INSERT INTO `t_problem`
VALUES ('84420118', '45', '5', '移除元素', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('85615528', '46', '5', '环形链表', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('85623999', '3', '1', '选美比赛', '1', '继承', 0);
INSERT INTO `t_problem`
VALUES ('85761038', '69', '7', '最长回文子串', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('86317812', '43', '5', '回文链表', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('88225641', '109', '10', '小希找工作', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('88576721', '89', '9', '牛友', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('91878706', '63', '6', '表达式括号匹配', '3', '函数', 0);
INSERT INTO `t_problem`
VALUES ('91901131', '95', '9', '整数反转', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('93155469', '52', '6', '魔数', '1', '函数', 0);
INSERT INTO `t_problem`
VALUES ('94726743', '13', '2', 'Web导航', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('96019278', '5', '1', '疫情期间', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('97389050', '112', '11', '浮点误差', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('97517733', '106', '10', '数字单词', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('98016600', '56', '6', '小熊买糖果', '2', '函数', 0);

-- ----------------------------
-- Table structure for t_problem_description
-- ----------------------------
DROP TABLE IF EXISTS `t_problem_description`;
CREATE TABLE `t_problem_description`
(
    `pk_problem_description_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `description`               varchar(20000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `input_form`                varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `output_form`               varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `sample_input_1`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `sample_output_1`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci   NOT NULL,
    `sample_input_2`            varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `sample_output_2`           varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `problem_id`                varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    PRIMARY KEY (`pk_problem_description_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_problem_description
-- ----------------------------
INSERT INTO `t_problem_description`
VALUES ('1590171782370619393',
        '春节期间小希计划乘坐火车去旅行。开始时，火车位于位置1，目的地在位置L。火车的速度是1单位长度/分钟（也就是第1分钟火车在位置1，第2分钟在位置2，等等）。 中国人过年都喜欢挂灯笼，在该路线上就有许多灯笼，它们位于能被 v 整除的位置上（也就是说，第1个灯笼在位置 v ，第2个灯笼在位置2v，等等）。 有另外一辆火车停留在从位置 l 到 r 的地方 显然，当 p 能被 v 整除的时候，且该处没有火车停留（p∉[l;r]），小希就可以看到处于位置 p 上的灯笼。因此，灯笼的位置如果被停留的火车遮挡，小希就看不见这些灯笼。 请输出小希在旅行期间能看到的灯笼数',
        '输入的第一行为一个整数T，表示测试数据的组数。接下来的T行，每行4个整数，为L、v、l、r，分别表示目的地的位置、灯笼的间距、停留火车的位置区间段。', '输出为T行，对应每个测试用例的输出结果。',
        '4\n10 2 3 7\n100 51 51 51\n1234 1 100 199\n1000000000 1 1 1000000000', '3\n0\n1134\n0', NULL, NULL, '1');

-- ----------------------------
-- Table structure for t_recommend_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_problem`;
CREATE TABLE `t_recommend_problem`
(
    `pk_recommend_problem_id` bigint                                                 NOT NULL,
    `student_id`              char(12) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `problem_id`              varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`pk_recommend_problem_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_recommend_problem
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`
(
    `pk_student_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `id`            char(15) CHARACTER SET utf8 COLLATE utf8_general_ci    NOT NULL,
    `name`          varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `password`      varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `phone`         char(11) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `email`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
    `deleted`       int                                                    NOT NULL,
    `class_id`      char(6) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    PRIMARY KEY (`pk_student_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student`
VALUES ('324441', '201810040106', '鞠方茂', '123456', '75551285661', 'zhiyuandai@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324442', '201810040108', '杨丰羽', '123456', '13864536805', 'jg1017@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324443', '202001110229', '苏杰', '123456', '2199667978', 'kmh@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324444', '202108030101', '乌拉热·巴依吾扎克', '123456', '76075413228', 'leixi@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324445', '202108030102', '李宾垚', '123456', '2126669208', 'chenglan@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324446', '202108030103', '和彤彤', '123456', '19958848552', 'zhiyuan1@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324447', '202108030104', '吴宝硕', '123456', '7695614899', 'mbonnie81@hotmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324448', '202108030105', '郑舒爻', '123456', '216310255', 'xiezit@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324449', '202108030106', '崔原赫', '123456', '1093591740', 'misakio6@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324450', '202108030107', '袁强杰', '123456', '13817916539', 'melvgom@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324451', '202108030108', '金洪贸', '123456', '75569621383', 'shajialun@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324452', '202108030109', '吴昊楠', '123456', '14671306907', 'shin@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324453', '202108030110', '陈萍', '123456', '2113132398', 'jzhenn3@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324454', '202108030111', '许训波', '123456', '14843465475', 'jialluo@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324455', '202108030112', '赵晨阳', '123456', '209003491', 'yuto82@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324456', '202108030113', '赵洋帆', '123456', '7698929800', 'sheh3@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324457', '202108030114', '罗鹏凯', '123456', '7603230654', 'scheather@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324458', '202108030115', '李宏坤', '123456', '18701644679', 'tmoreno@mail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324459', '202108030116', '姚晓璐', '123456', '15975757947', 'saoshi@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324460', '202108030117', '马云骢', '123456', '103750706', 'evaji@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324461', '202108030118', '曾顺', '123456', '7698383592', 'akina9@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324462', '202108030119', '谭婉婷', '123456', '2102450793', 'carlos8@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324463', '202108030120', '李晨', '123456', '76031166803', 'howardj@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324464', '202108030121', '刘民佳', '123456', '14826068203', 'brandoncarter316@hotmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324465', '202108030122', '陈昶宇', '123456', '14735421961', 'kellesusan@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324466', '202108030123', '梁星宇', '123456', '19461535967', 'tayamat@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324467', '202108030124', '袁星', '123456', '2141625671', 'yunxizheng@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324468', '202108030125', '卢珊', '123456', '13615025717', 'ykwok1974@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324469', '202108030126', '黄泽乐', '123456', '17226513223', 'shrodriguez@hotmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324470', '202108030127', '郭皓', '123456', '215955431', 'nguyen67@mail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324471', '202108030128', '侯玲', '123456', '18058516918', 'okamoto8@gmail.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324472', '202108030129', '李嘉轩', '123456', '2894387090', 'lanlei@outlook.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324473', '202108030130', '茹则古丽·肉孜麦麦提', '123456', '18105374821', 'nakamorim@icloud.com', 0, '080301');
INSERT INTO `t_student`
VALUES ('324474', '201508010709', '牛晓静', '123456', '19087121687', 'chimingche@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324475', '202009070125', '曾正鹏', '123456', '16896974696', 'airim@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324476', '202108030401', '王硕', '123456', '17992791331', 'onna02@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324477', '202108030402', '宋美辰', '123456', '7551840856', 'blackmar@icloud.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324478', '202108030403', '张逸婷', '123456', '209989968', 'miua@yahoo.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324479', '202108030404', '高心如', '123456', '1013010447', 'francesmu@outlook.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324480', '202108030405', '朱鹏宇', '123456', '18692436245', 'christopher8@outlook.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324481', '202108030406', '赵海涛', '123456', '76971873082', 'pangcw129@icloud.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324482', '202108030407', '张如莹', '123456', '205801198', 'yuna1956@icloud.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324483', '202108030408', '姚思博', '123456', '14035659495', 'waihan1956@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324484', '202108030409', '吴镈', '123456', '215520250', 'lkaling@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324485', '202108030410', '彭志涛', '123456', '1000353316', 'nakas@icloud.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324486', '202108030411', '李天齐', '123456', '282166241', 'chsaiwing920@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324487', '202108030412', '张朔严', '123456', '14949178045', 'annebur@hotmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324488', '202108030413', '李姝巍', '123456', '13004818321', 'irene68@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324489', '202108030414', '张普恒', '123456', '15828869650', 'tikakeu7@hotmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324490', '202108030415', '侯文博', '123456', '17891533419', 'axue@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324491', '202108030416', '汪纤慧', '123456', '19875865667', 'shino9@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324492', '202108030417', '方声江', '123456', '2854427785', 'kasumimiyamoto51@outlook.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324493', '202108030418', '王佳豪', '123456', '17031295490', 'bbryan2@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324494', '202108030419', '毛永鑫', '123456', '2109156074', 'ziji@outlook.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324495', '202108030420', '肖淼', '123456', '2895050067', 'hkakeung49@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324496', '202108030421', '戴锋', '123456', '18180817345', 'joelhicks@hotmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324497', '202108030422', '肖凯元', '123456', '18837345923', 'mingpang9@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324498', '202108030423', '梁子荣', '123456', '7550675974', 'aq7@yahoo.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324499', '202108030424', '程铄', '123456', '7556686558', 'kellystevens2@icloud.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324500', '202108030425', '粟阳健', '123456', '19338031559', 'eita7@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324501', '202108030426', '李俊宏', '123456', '289265420', 'chuy@outlook.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324502', '202108030427', '程彦鑫', '123456', '7692059170', 'rose89@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324503', '202108030428', '杨展赫', '123456', '19318650080', 'saoi@mail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324504', '202108030429', '张绍业', '123456', '75555863179', 'smithtracy510@gmail.com', 0, '080304');
INSERT INTO `t_student`
VALUES ('324505', '202108030301', '古丽努尔·热衣木', '123456', '18319845761', 'ruyin216@yahoo.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324506', '202108030302', '张镨心', '123456', '15613843434', 'ttakuya7@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324507', '202108030303', '刘广权', '123456', '76093568060', 'salazarelle111@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324508', '202108030304', '李文萍', '123456', '13504216615', 'kaoshi@yahoo.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324509', '202108030305', '闫妍', '123456', '13966069507', 'chan9@icloud.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324510', '202108030306', '赵雨阳', '123456', '19555842470', 'kamwingsuen529@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324511', '202108030307', '李郡岑', '123456', '7602372080', 'yanlan205@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324512', '202108030308', '申梦辰', '123456', '203992938', 'spencerandrew1121@outlook.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324513', '202108030309', '甄智豪', '123456', '7602698587', 'lakong@icloud.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324514', '202108030310', '谢义', '123456', '7690360479', 'yutshibata8@hotmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324515', '202108030311', '梁志伟', '123456', '15820011150', 'yayuning@icloud.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324516', '202108030312', '刘馨蔚', '123456', '2198502872', 'hill224@outlook.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324517', '202108030313', '马美美', '123456', '15230350621', 'hanamat@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324518', '202108030314', '赵首魁', '123456', '217497446', 'rinu@icloud.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324519', '202108030315', '赵启昊', '123456', '104929078', 'yunxijiang@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324520', '202108030316', '邢宇晗', '123456', '15162374352', 'fxiaom@yahoo.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324521', '202108030317', '王政阳', '123456', '206861653', 'ua1101@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324522', '202108030318', '荣伊天', '123456', '19874750535', 'grahageo@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324523', '202108030319', '张可意', '123456', '19499749149', 'jherrera64@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324524', '202108030320', '丁俊杰', '123456', '18406629782', 'cmiguel@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324525', '202108030321', '游礼嘉', '123456', '17904557709', 'stevenmende@outlook.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324526', '202108030322', '文俊杰', '123456', '18744982733', 'hazukotsu404@outlook.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324527', '202108030323', '刘逸萱', '123456', '206296607', 'renya4@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324528', '202108030324', '曹磊杰', '123456', '18368022641', 'momokafujit807@icloud.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324529', '202108030325', '黄宇轩', '123456', '13500320569', 'mitsukii@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324530', '202108030326', '伍薪禧', '123456', '18106604966', 'moore1031@outlook.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324531', '202108030327', '林翰洋', '123456', '76949906983', 'kazumayamam@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324532', '202108030328', '唐嘉洁', '123456', '1081605784', 'hkaling95@mail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324533', '202108030329', '马志远', '123456', '16442242343', 'sara1994@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324534', '202108030330', '布音糖·那森叠勒格勒', '123456', '7609061063', 'samaruyama@gmail.com', 0, '080303');
INSERT INTO `t_student`
VALUES ('324535', 'E202108000102', '倪睿晨', '123456', '219927976', 'sato7@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('324536', 'E202108000108', '马千千', '123456', '18967159352', 'tan704@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('324537', '202006010214', '龚晨希', '123456', '15944623867', 'aoiyam@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('324538', '202009070109', '王一新', '123456', '15347530819', 'foster7@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('324539', '202011020104', '刘宇江', '123456', '19553205207', 'matsua@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('324540', '202108030201', '衣明·米吉提', '123456', '14872409146', 'laric@hotmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423423', '202108030202', '陈诗扬', '123456', '18302552336', 'henderson46@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423424', '202108030203', '袁雨菡', '123456', '7606499441', 'hak@mail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423425', '202108030204', '邵智睿', '123456', '17855872422', 'tingfung7@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423426', '202108030205', '王冰宇', '123456', '76062734040', 'ony@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423427', '202108030206', '杨靖轩', '123456', '2051731143', 'wu1115@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423428', '202108030207', '陈伟涛', '123456', '13218375810', 'ckwokyin@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423429', '202108030208', '汪欣茹', '123456', '16570342620', 'sara2019@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423430', '202108030209', '程锦', '123456', '7601496089', 'haradai@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423431', '202108030210', '李文豪', '123456', '14257476849', 'maoziyi@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423432', '202108030211', '丁子轩', '123456', '19879073384', 'okama@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423433', '202108030212', '郑烁', '123456', '13790372605', 'rikmurata@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423434', '202108030213', '董佳鑫', '123456', '7608681538', 'kwokyl@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423435', '202108030214', '蒋硕', '123456', '13057728347', 'dcy5@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423436', '202108030215', '张敬铂', '123456', '106481859', 'paulro1209@hotmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423437', '202108030216', '梅影', '123456', '16434176004', 'syyue@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423438', '202108030217', '黄沐阳', '123456', '76051097122', 'monicahenry@yahoo.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423439', '202108030218', '胡湘蜂', '123456', '18912019531', 'wmwan5@hotmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423440', '202108030219', '李圣责', '123456', '17168261485', 'yakwokyin@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423441', '202108030220', '李卫', '123456', '17203272541', 'hiranosakura@yahoo.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423442', '202108030221', '曹轩潆', '123456', '7690222654', 'tk1024@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423443', '202108030222', '曾卓瑶', '123456', '289255174', 'lam75@yahoo.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423444', '202108030223', '林楷瀚', '123456', '2148814551', 'zhiyuandu10@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423445', '202108030224', '黄基霖', '123456', '75591253074', 'willie76@yahoo.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423446', '202108030225', '黎俊麟', '123456', '7550319221', 'yota1967@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423447', '202108030226', '肖滤丽', '123456', '18612335706', 'imats@gmail.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423448', '202108030227', '魏黄涛', '123456', '13111576583', 'tnak06@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423449', '202108030228', '张媛', '123456', '14695072295', 'sted220@icloud.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423450', '202108030229', '汪博文', '123456', '2026313706', 'yunaar66@outlook.com', 0, '080302');
INSERT INTO `t_student`
VALUES ('423451', '202108030230', '潘继正', '123456', '2835965843', 'jacobstone@hotmail.com', 0, '080302');

-- ----------------------------
-- Table structure for t_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_teacher`;
CREATE TABLE `t_teacher`
(
    `pk_teacher_id` bigint                                                  NOT NULL,
    `id`            varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `name`          varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `password`      varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `phone`         char(11) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `email`         varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    `deleted`       int                                                     NOT NULL,
    PRIMARY KEY (`pk_teacher_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher`
VALUES (1590268513125003267, 'T202026010512', 'T曾靖', '123321', '1111111', 'aaa@qq.com', 0);
INSERT INTO `t_teacher`
VALUES (1591345797845868545, '2222222222', 'xxx', '111222333', '3424123414', 'xxx@11111.com', 0);
INSERT INTO `t_teacher`
VALUES (1591346538660560898, '2222222221', 'xxx', '123321123', '3424123414', 'xxx@11111.com', 0);
INSERT INTO `t_teacher`
VALUES (1591347007587995649, '2222222224', 'xxx', '123321123', '3424123414', 'xxx@11111.com', 1);

-- ----------------------------
-- Table structure for t_tutor
-- ----------------------------
DROP TABLE IF EXISTS `t_tutor`;
CREATE TABLE `t_tutor`
(
    `pk_tutor_id` bigint                                                  NOT NULL,
    `id`          varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `name`        varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `password`    varchar(16) CHARACTER SET utf8 COLLATE utf8_general_ci  NOT NULL,
    `phone`       char(11) CHARACTER SET utf8 COLLATE utf8_general_ci     NOT NULL,
    `email`       varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
    PRIMARY KEY (`pk_tutor_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tutor
-- ----------------------------
INSERT INTO `t_tutor`
VALUES (31232444, '253454353', '靖曾', '123456', '2435235', 'gegege');
INSERT INTO `t_tutor`
VALUES (1594323841824890882, '2222222222', 'xxx', '123321123', '3424123414', 'xxx@11111.com');
INSERT INTO `t_tutor`
VALUES (1594324019990536193, '2222222224', 'xxx', '123321123', '3424123414', 'xxx@11111.com');

SET
FOREIGN_KEY_CHECKS = 1;
