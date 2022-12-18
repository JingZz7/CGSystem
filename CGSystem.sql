/*
 Navicat Premium Data Transfer

 Source Server         : CGSystem
 Source Server Type    : MySQL
 Source Server Version : 80030
 Source Host           : localhost:3306
 Source Schema         : cgsystem

 Target Server Type    : MySQL
 Target Server Version : 80030
 File Encoding         : 65001

 Date: 18/12/2022 16:43:28
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
    `pk_administrator_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `id`                  varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `name`                varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `password`            varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `phone`               char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `email`               varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`pk_administrator_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_administrator
-- ----------------------------
INSERT INTO `t_administrator`
VALUES ('234423432', 'admin', 'admin', '123456', '17777777777', 'xxx@gmail.com');
INSERT INTO `t_administrator`
VALUES ('23445345', '456747234r', '管理员1', '123456', '433563454', 'e23e@gmail.com');

-- ----------------------------
-- Table structure for t_class
-- ----------------------------
DROP TABLE IF EXISTS `t_class`;
CREATE TABLE `t_class`
(
    `pk_class_id` bigint                                                      NOT NULL,
    `id`          char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci    NOT NULL,
    `name`        varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `deleted`     int                                                         NOT NULL,
    PRIMARY KEY (`pk_class_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_class
-- ----------------------------
INSERT INTO `t_class`
VALUES (1, '260101', '软件一班', 0);
INSERT INTO `t_class`
VALUES (2, '260102', '软件二班', 0);
INSERT INTO `t_class`
VALUES (3, '260103', '软件三班', 0);
INSERT INTO `t_class`
VALUES (4, '260104', '软件四班', 0);
INSERT INTO `t_class`
VALUES (5, '260105', '软件五班', 0);
INSERT INTO `t_class`
VALUES (6, '080501', '拔尖一班', 0);
INSERT INTO `t_class`
VALUES (7, '080502', '拔尖二班', 0);
INSERT INTO `t_class`
VALUES (8, '080301', '通信一班', 0);
INSERT INTO `t_class`
VALUES (9, '080302', '通信二班', 0);
INSERT INTO `t_class`
VALUES (10, '080303', '通信三班', 0);
INSERT INTO `t_class`
VALUES (11, '080304', '通信四班', 0);

-- ----------------------------
-- Table structure for t_comment_student
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_student`;
CREATE TABLE `t_comment_student`
(
    `pk_comment_student_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci    NOT NULL,
    `description`           varchar(10000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `student_id`            char(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci       NOT NULL,
    `problem_id`            varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci    NOT NULL,
    `date_time`             datetime NULL DEFAULT NULL,
    PRIMARY KEY (`pk_comment_student_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment_student
-- ----------------------------
INSERT INTO `t_comment_student`
VALUES ('1594979364410396673', '10', '201810040106', '25', '2022-11-22 17:01:28');
INSERT INTO `t_comment_student`
VALUES ('1594979591812976642', '10', '201810040106', '25', '2022-11-22 17:02:22');
INSERT INTO `t_comment_student`
VALUES ('1594980388030287873', '?', '201810040106', '25', '2022-11-22 17:05:32');
INSERT INTO `t_comment_student`
VALUES ('1595350944407756802', '?', '201810040106', '25', '2022-11-23 17:37:59');
INSERT INTO `t_comment_student`
VALUES ('234234543253454', '好简单啊', '202026010512', '1', '2022-11-14 14:41:36');

-- ----------------------------
-- Table structure for t_comment_teacher
-- ----------------------------
DROP TABLE IF EXISTS `t_comment_teacher`;
CREATE TABLE `t_comment_teacher`
(
    `pk_comment_teacher_id` bigint                                                        NOT NULL,
    `description`           varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `teacher_id`            varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `problem_id`            varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    PRIMARY KEY (`pk_comment_teacher_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_comment_teacher
-- ----------------------------

-- ----------------------------
-- Table structure for t_favorite
-- ----------------------------
DROP TABLE IF EXISTS `t_favorite`;
CREATE TABLE `t_favorite`
(
    `pk_favorite_id` bigint                                                       NOT NULL,
    `student_id`     char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci    NOT NULL,
    `problem_id`     varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`pk_favorite_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_favorite
-- ----------------------------
INSERT INTO `t_favorite`
VALUES (1590167125883003297, '202026010513', '1');
INSERT INTO `t_favorite`
VALUES (1591455186935791617, '202026010512', '2');
INSERT INTO `t_favorite`
VALUES (1591792893704687617, '202026010512', '4');
INSERT INTO `t_favorite`
VALUES (1593195803357384705, '202026010512', '25');
INSERT INTO `t_favorite`
VALUES (1593200764128497666, '202026010512', '234');
INSERT INTO `t_favorite`
VALUES (1593200771015544834, '202026010512', '24');
INSERT INTO `t_favorite`
VALUES (1593200777428635649, '202026010512', '212');
INSERT INTO `t_favorite`
VALUES (1593200783166443521, '202026010512', '113');
INSERT INTO `t_favorite`
VALUES (1593200788904251393, '202026010512', '5');
INSERT INTO `t_favorite`
VALUES (1593200806721654786, '202026010512', '3');
INSERT INTO `t_favorite`
VALUES (1593200813398986754, '202026010512', '6');
INSERT INTO `t_favorite`
VALUES (1593200831979753473, '202026010512', '97');
INSERT INTO `t_favorite`
VALUES (1593200838208294913, '202026010512', '231');
INSERT INTO `t_favorite`
VALUES (1593200844386504706, '202026010512', '7');
INSERT INTO `t_favorite`
VALUES (1593200852049498113, '202026010512', '35');
INSERT INTO `t_favorite`
VALUES (1599246295007215618, '201810040106', '25');
INSERT INTO `t_favorite`
VALUES (1599246302229807105, '201810040106', '27');

-- ----------------------------
-- Table structure for t_knowledge_point
-- ----------------------------
DROP TABLE IF EXISTS `t_knowledge_point`;
CREATE TABLE `t_knowledge_point`
(
    `pk_knowledge_point_id` bigint                                                        NOT NULL,
    `id`                    varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `name`                  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `deleted`               int                                                           NOT NULL,
    `student_id`            char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    PRIMARY KEY (`pk_knowledge_point_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_knowledge_point
-- ----------------------------

-- ----------------------------
-- Table structure for t_model_input
-- ----------------------------
DROP TABLE IF EXISTS `t_model_input`;
CREATE TABLE `t_model_input`
(
    `pk_model_input_id` bigint                                                        NOT NULL,
    `student_id`        char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `homework_chapter`  varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `homework_score`    decimal(10, 0)                                                NOT NULL,
    PRIMARY KEY (`pk_model_input_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_model_input
-- ----------------------------

-- ----------------------------
-- Table structure for t_model_output_knowledge
-- ----------------------------
DROP TABLE IF EXISTS `t_model_output_knowledge`;
CREATE TABLE `t_model_output_knowledge`
(
    `pk_model_output_knowledge_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `student_id`                   char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci    NOT NULL,
    `knowledge_point_id`           varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `forecast`                     decimal(10, 9)                                               NOT NULL,
    PRIMARY KEY (`pk_model_output_knowledge_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
    `pk_model_output_score_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `student_id`               char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci    NOT NULL,
    `exam_score`               decimal(10, 6)                                               NOT NULL,
    PRIMARY KEY (`pk_model_output_score_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

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
    `pk_problem_id`      varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `id`                 varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `knowledge_point_id` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `name`               varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `difficulty`         char(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `label`              varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `deleted`            int                                                          NOT NULL,
    PRIMARY KEY (`pk_problem_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_problem
-- ----------------------------
INSERT INTO `t_problem`
VALUES ('12557518699', '16', '2', '哪来的输出（析构函数）', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('13340297935', '90', '10', '三个数', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('14354601167', '25', '3', ' 菜单类的设计与实现', '1', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('14930189456', '66', '7', '音乐DJ和回响贝斯', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('17001977645', '38', '4', '高风险人群统计', '3', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('17950670312', '67', '7', '字符串左删除', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('19949980190', '85', '9', '下载文件', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('21121446959', '40', '5', '数组奇偶排列', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('21275330955', '41', '5', '字符串反转（指针实现）', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('21455209788', '62', '7', '加密与解密', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('21654224962', '36', '4', '公共钥匙盒', '3', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('22613982822', '6', '1', '实现Point类', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('24775748100', '27', '3', '返回什么才好呢', '2', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('26286995153', '43', '5', '字符串中第二大的数字', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('26702489908', '109', '11', '老鼠爱大米', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('28642991884', '100', '11', '坐标格式化处理', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('33505282868', '31', '4', '选举', '1', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('34467890261', '87', '9', '大象看朋友', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('36387913098', '102', '11', ' 游泳训练时间计算', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('36982486421', '13', '2', '电话号码升位（拷贝构造函数）', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('37669972615', '79', '8', '小希的新工作', '2', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('37865441109', '60', '7', '飞来飞去', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('38922731624', '1', '1', 'animal和dog', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('38966715490', '59', '6', '求奇数和', '1', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('40120996504', '44', '5', '交替合并字符串', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('40253710886', '63', '7', '炸弹', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('42350925732', '45', '5', '复写零', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('42813075152', '88', '9', '莫比乌斯函数', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('43012764810', '105', '11', 'sizeof的作用', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('44189890552', '28', '3', 'Big & Base 封闭类问题', '2', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('44417730323', '71', '8', '小女孩与楼梯', '3', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('44551893278', '30', '4', '评委打分', '1', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('44971413955', '58', '6', '判断回文数', '2', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('47066400991', '46', '5', '删除回文子序列', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('47227431609', '95', '10', '小希找工作', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('48771761755', '17', '2', '奇怪的类复制（复制构造函数）', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('49502729586', '96', '10', '台球游戏', '3', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('50509154173', '37', '4', '武将排位', '2', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('50728485971', '12', '2', '姓名与住址', '1', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('52340386425', '54', '6', '求指数', '1', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('52546797254', '14', '2', '软件备份（拷贝构造函数）', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('53354887844', '103', '11', '字符输出', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('53366860041', '7', '1', '求两个三角形面积和', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('53580424767', '77', '8', '排队喝水', '1', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('54203681723', '94', '10', '输入字符统计', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('54341305730', '42', '5', '货币兑换', '3', '指针', 0);
INSERT INTO `t_problem`
VALUES ('55328322553', '82', '9', '数字游戏', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('55553459969', '107', '11', ' 小猴与香蕉', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('56346774412', '34', '4', '看电影', '2', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('58820489338', '64', '7', '激光镜像', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('59209635566', '24', '3', '学生类的设计与实现', '1', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('59476745565', '73', '8', '飞机起飞时间安排', '3', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('59877165245', '26', '3', '书籍类的设计与实现', '2', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('60637512639', '56', '6', '递归实现PrintN函数', '3', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('60919562429', '76', '8', '阿迪看医生', '2', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('61276951442', '2', '1', 'animal和dog和cat', '3', '继承', 0);
INSERT INTO `t_problem`
VALUES ('61444616436', '4', '1', '实现宠物叫声的多态性', '1', '继承', 0);
INSERT INTO `t_problem`
VALUES ('61482658040', '61', '7', 'E-mail地址', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('61793780370', '57', '6', '凯撒密码', '2', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('63046173693', '55', '6', '字符串长度', '2', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('63326988684', '51', '6', '最大公约数和最小公倍数', '1', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('63485721583', '23', '3', 'Point类的设计与实现', '2', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('64875280410', '5', '1', '设计圆类', '2', '继承', 0);
INSERT INTO `t_problem`
VALUES ('65750411846', '18', '2', '学生信息处理程序', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('66393571108', '99', '10', '这个月有多少天？', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('66543469753', '70', '8', '小希与火车', '3', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('67531665829', '49', '5', '移动零', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('67972122452', '75', '8', '猴导师', '2', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('68825179197', '86', '9', '汉明距离', '1', '循环', 0);
INSERT INTO `t_problem`
VALUES ('71537397235', '32', '4', '招聘', '2', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('72825593772', '15', '2', '手机服务（构造+拷贝构造+堆）', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('73908169824', '92', '10', 'ch3-5 3,5,7整除', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('74026537461', '69', '7', '小希练打字', '1', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('74720550991', '78', '8', '岁月留痕', '1', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('78012170509', '106', '11', ' 苹果和虫子', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('78089884013', '48', '5', '快乐数', '2', '指针', 0);
INSERT INTO `t_problem`
VALUES ('78292989312', '80', '9', '除法的精确计算', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('80122083644', '84', '9', '金币', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('80126943154', '22', '3', '约瑟夫问题', '3', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('80135334569', '20', '2', '矩阵相加', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('80878907849', '97', '10', '三个人比大小', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('80996572904', '108', '11', '铺地砖', '3', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('81784527826', '52', '6', '统计数字', '1', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('82027658783', '110', '11', '分西瓜', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('82038308869', '81', '9', '松雅旅馆的自动门', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('82375353544', '35', '4', '青蛙与蚊子', '3', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('84372269276', '98', '10', 'ch3-6 成绩分类', '1', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('86125548845', '47', '5', '移除元素', '1', '指针', 0);
INSERT INTO `t_problem`
VALUES ('88478399672', '104', '11', ' 温度表达转化', '2', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('88549409274', '21', '3', '矩阵计算', '3', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('89005954142', '19', '2', '构造函数', '2', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('89251018000', '53', '6', '猜数字', '1', '函数练习', 0);
INSERT INTO `t_problem`
VALUES ('89590705712', '65', '7', '杠杆', '2', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('90216146656', '3', '1', '全面的MyString', '3', '继承', 0);
INSERT INTO `t_problem`
VALUES ('92129782165', '89', '9', ' 小熊与糖果', '3', '循环', 0);
INSERT INTO `t_problem`
VALUES ('92373093522', '74', '8', '贪心的阿迪', '2', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('95037852770', '72', '8', '松雅的旅馆', '3', '数组练习', 0);
INSERT INTO `t_problem`
VALUES ('96362249072', '91', '10', ' ch3-4 分段函数求解', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('97116573802', '29', '3', '这个指针哪来的', '3', '类和对象', 0);
INSERT INTO `t_problem`
VALUES ('97603126750', '101', '11', '支票代码输出', '1', '语言基础', 0);
INSERT INTO `t_problem`
VALUES ('97746881848', '11', '2', '中国医药股票', '3', '构造函数', 0);
INSERT INTO `t_problem`
VALUES ('98210192437', '83', '9', '牛友', '2', '循环', 0);
INSERT INTO `t_problem`
VALUES ('98342242939', '33', '4', '火星人足球赛', '3', '结构体练习', 0);
INSERT INTO `t_problem`
VALUES ('99101185215', '68', '7', '机器人游戏', '3', '字符串', 0);
INSERT INTO `t_problem`
VALUES ('99575848807', '93', '10', '小芳找工作', '2', '控制结构', 0);
INSERT INTO `t_problem`
VALUES ('99880716275', '50', '6', '小熊买糖果', '3', '函数练习', 0);

-- ----------------------------
-- Table structure for t_problem_description
-- ----------------------------
DROP TABLE IF EXISTS `t_problem_description`;
CREATE TABLE `t_problem_description`
(
    `pk_problem_description_id` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `description`               text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `input_form`                text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `output_form`               text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `sample_input_1`            text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `sample_output_1`           text CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    `problem_id`                varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
    PRIMARY KEY (`pk_problem_description_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_problem_description
-- ----------------------------
INSERT INTO `t_problem_description`
VALUES ('10298419736', ' 输入A、B、C3个人的生日，格式为：yyyy mm dd，按照年龄从大到小输出。', ' 输入有3行，分别表示A、B、C三个人的生日。',
        ' ABC或ACB或BAC或BCA或CAB或CBA', '2018 1 12\n1997 7 1\n2000 12 31', 'BCA', '97');
INSERT INTO `t_problem_description`
VALUES ('12169647332', ' 有三个非负整数a、b、c，现按随机顺序给出它们的两两和以及总和4个整数，即a+b、a+c、b+c、a+b+c，注意，给出的4个数的顺序是随机的，请根据这四个数求出a、b、c是多少？',
        '输入为一行4个正整数，x1、x2、x3、x4 （0≤xi≤109），表示a+b、a+c、b+c、a+b+c结果的随机顺序的值，输入保证能求出结果。',
        '输出为一行，以非递减的方式输出a、b、c，注意a、b、c可能相等。', '3 6 5 4', '1 2 3', '90');
INSERT INTO `t_problem_description`
VALUES ('12586574096',
        '有两个矩阵 a 和 b，均为2行3列。求两个矩阵之和。重载运算符“+”、流插入运算符 “<<” 和流提取运算符 “>>” ，使之能用于该矩阵的输入和输出。，使之能用于矩阵相加。如 c = a + b',
        '输入两个2行3列的矩阵', '输出两个2行3列矩阵相加的结果', '7 9 8\n6 2 4\n1 3 5\n8 5 2', '8 12 13\n14 7 6', '20');
INSERT INTO `t_problem_description`
VALUES ('13112786129', '输入支票代码（正整数）和支票金额（浮点数）；\n按格式要求输出：支票代码占8位，不足8位，则补充前导符‘0’；支票金额保留两位小数 。\n', '支票代码（正整数）和支票金额（浮点数）',
        '支票代码占8位，不足8位，则补充前导符‘0’；支票金额保留两位小数 。', '123456 123.1', '00123456\n\n123.10', '101');
INSERT INTO `t_problem_description`
VALUES ('13158756455',
        '一个长度为n(1=<n<=1000)的字符串s（原文，可能包括空格）可以通过以下算法进行加密\n\n       a). 按递减顺序迭代n的所有因子，也就是从n到1\n\n       b). 对于每个因子d，反转字符串s的前d个字符s[0,...,d-1]，从而形成新的s\n\n       给定一个已加密的字符串t（密文），你的任务是找出原始字符串s（原文），输入保证字符串s是存在且唯一的。',
        '输入为一行一个字符串t，表示密文', '输出原文字符串s', 'owrldolleh', 'helloworld', '62');
INSERT INTO `t_problem_description`
VALUES ('13270646465',
        '阿迪在一个大型机场担任飞机跑道交通管制员，他控制一个通常用于着陆的跑道。因此，他有一个未来一段时间飞机着陆的时间安排，每次着陆持续时间为1分钟。\n\n       他被要求在安排表中插入一次起飞，起飞本身需要1分钟，但出于安全考虑，起飞和着陆之间应有至少s分钟的时间间隔。 \n\n       请找出阿迪能插入的起飞的最早时间。',
        '  输入的第一行包含两个整数n和s（1≤n≤1001≤n≤100, 1≤s≤601≤s≤60），分别表示在时间安排表中的着陆的航班数量以及在着陆与起飞之间的最小允许时间（以分钟计）。\n\n        接下来的n行，每行包含两个整数h和m （0≤h≤230≤h≤23, 0≤m≤590≤m≤59），表示飞机着陆的时间，以小时和分钟计，从当前时刻开始（也就是说当前时刻是0时0分），这些时间以递增的顺序给出。',
        '输出两个整数h和m，代表可以插入的起飞的最早时间的小时和分', '6 60\n0 0\n1 20\n3 21\n5 0\n19 30\n23 40', '6 1', '73');
INSERT INTO `t_problem_description`
VALUES ('14048196877', '给定一个数组 nums，编写一个函数将所有 0 移动到数组的末尾，同时保持非零元素的相对顺序。\n\n请注意 ，必须在不复制数组的情况下原地对数组进行操作。', '一个数组', '一个数组',
        'nums = [0,1,0,3,12]', '[1,3,12,0,0]', '49');
INSERT INTO `t_problem_description`
VALUES ('14347330959',
        'e 妹儿公司的一个主要业务是提供电子邮件服务，每天都有数以万计的用户在使用该平台收发电子邮件e-mail。然而不幸的是，最近公司的邮件服务器遭受到了网络攻击，几乎所有的邮件内容都受到了破坏，每个邮件都只留下了一个长长的字符串。恢复所有邮件是不可能完成的任务，但似乎从这串留下的字符串中还可以解析出一些可能的e-mail地址，这样公司可以通过向这些解析出的e-mail地址发送邮件以减少用户的损失。\n\n        一个有效的e-mail地址的形式符合以下原则:\n\n        1、邮件开始部分必须是字母、数字和‘_’组成的串，但必须以字母开头\n\n        2、接着必须为字符‘@’\n\n        3、接着是非空的字母或数字序列\n\n        4、接着必须为‘.’\n\n        5、地址必须以非空的字母串结束，不能含有数字，\'_\'，和\'.\'\n\n       你很幸运地承担了这项工作，但请注意子串的区分，子串是指一个字符串中某些连续的字符组成的串。对于两个子串，其中一个组成的字符编号为l1、l1+1、l1+2、...、r1，另外一个组成的字符编号为l2、l2+1、l2+2、...、r2，如果l1≠l2或r1≠r2，则认为这是两个不同的子串。',
        '输入仅有一行，为一个字符序列s1s2...sn( 1≤ n ≤ 106)，为给定的字符串。输入保证这个字符串中只包含小写字母、数字以及字符 \'.\'、\'_\'、\'@\'。',
        ' 输出为一个数，表示可以解析出的有效e-mail地址的数量（允许重复）。', 'gerald.agapov1991@gmail.com', '18', '61');
INSERT INTO `t_problem_description`
VALUES ('15069088083', '从键盘输入n个整数，将奇数调整到前半部分，将偶数调整到后半部分，并分别按从小到大的顺序排列后输出。', '输入为两行，第一行为一个整数n（0<n≤107），第二行为n个整数。',
        '输出为一行，为经过排列之后的n个整数。', '6\n12 17 6 11 2 3', '3 11 17 2 6 12', '40');
INSERT INTO `t_problem_description`
VALUES ('16758987839',
        '在一场全国性选举中，有n位候选人，编号从1~n，这个国家有m个城市，已知每个城市每个候选人的得票数。\n\n       这个国家的选举制度很不寻常。在选举的第一阶段，每个城市的票数被计算出来，在每个城市，获胜者为得票最多的候选人，如果有相同得票数，则编号最小的获胜。\n\n       在第二个阶段，比较赢得的城市数，赢得的城市最多者获胜，如果赢得的城市数相等，则编号小者获胜。\n\n       请确定最终谁将获得选举胜利。',
        '输入的第一行为两个正整数n和m (1 ≤ n, m ≤ 100)，表示候选人的个数和城市的个数。\n\n       接下来的m行，每行包含n个非负整数，第i行的第j个数aij(1 ≤ j ≤ n, 1 ≤ i ≤ m, 0 ≤ aij ≤ 109) 表示第j个候选人在第i个城市的得票数。',
        '输出为一个数，最终获胜者的编号。', '3 3\n1 2 3\n2 3 1\n1 2 1', '2', '31');
INSERT INTO `t_problem_description`
VALUES ('17037490619', '给定一个正整数N（0<N<=1000)，请编写一个递归函数 void PrintN( int N); 顺序打印从1~N的全部整数。', '一个int类型的正整数N', '每行输出一个整数',
        '6', '1\n2\n3\n4\n5\n6', '56');
INSERT INTO `t_problem_description`
VALUES ('17400428823',
        '软件作为一种对象也可以用类来描述，软件的属性包括软件名称、类型（分别用O、T和B表示原版、试用版还是备份）、有效截至日期（用CDate类子对象表示）和存储介质（分别用D、H和U表示光盘、磁盘和U盘）等。软件拷贝可通过拷贝构造函数来实现，此时在拷贝构造函数中软件类型改成\"B\", 存储介质改为\"H\"，其它不变。试完成该类的拷贝构造、构造和打印(包括从2015年4月7日算起有效期还有多少天，是否过期)成员函数的实现。\n当输入软件有效截止日期是0年0月0日，表示无日期限制，为unlimited;当输入日期在2015年4月7日之前，则是过期，表示为expired;如果输入日期在2015年4月7日之后，则显示之后的剩余天数。具体输出信息看输出范例。',
        '测试数据的组数 t\n\n第一个软件名称\n\n第一个软件类型 第一个软件介质类型 第一个软件有效期年 月 日\n\n第二个软件名称\n\n第二个软件类型 第二个软件介质类型 第二个软件有效期年 月 日\n\n…',
        'name： 第一个软件名称\n\n类型： 第一个软件类型\n\nmedia： 第一个软件介质类型\n\n第一个软件2015-4-7后的有效天数\n\nname： 第一个软件名称\n\n类型： 备份\n\n介质：硬盘\n\n第一个软件2015-4-7后的有效天数\n\n…',
        '3\nPhotoshop_CS5\nO D 0 0 0\nAudition_3.0\nB U 2015 2 3\nVisual_Studio_2010\nT H 2015 5 5\n',
        'name:Photoshop_CS5\ntype:original\nmedia:optical disk\nthis software has unlimited use\n\nname:Photoshop_CS5\ntype:backup\nmedia:hard disk\nthis software has unlimited use\n\nname:Audition_3.0\ntype:backup\nmedia:USB disk\nthis software has expired\n\nname:Audition_3.0\ntype:backup\nmedia:hard disk\nthis software has expired\n\nname:Visual_Studio_2010\ntype:trial\nmedia:hard disk\nthis software is going to be expired in 28 days\n\nname:Visual_Studio_2010\ntype:backup\nmedia:hard disk\nthis software is going to be expired in 28 days\n',
        '14');
INSERT INTO `t_problem_description`
VALUES ('17832179673',
        '松雅作为一位商业人士，经常需要在天津和深圳之间飞来飞去，因为在这两个城市，她有多间旅馆。当然在冬天她更愿意从天津飞到深圳，因为深圳更暖和。她实在是太忙了，以至于她根本就不记得在这两个方向上坐过多少航班了。\n\n       在最近的n天，她知道自己哪天在天津的办公室哪天在深圳的办公室，她总是在晚上飞，因此不可能在同一天出现在两地的办公室。考虑到这些信息，确定在过去的n天里，她从深圳飞天津的次数是否更多。',
        '输入的第一行为一个整数T，表示测试用例的个数。\n\n       接下来的T行，每行为一个测试用例，表示为一个整数n和一个n个字符的字符串，整数表示最近过去的天数，字符串表示松雅停留在两地办公室的情况，由大写字母\'S\'和\'T\'组成，如果第i个字符为\'S\'，表示这天她在深圳的办公室，否则在天津的办公室。最远的一天为第一个字符，最近的一天为最后一个字符。',
        '输出有n行，每行对应一个测试用例，如果从深圳飞天津的次数更多，输出“YES”,否则输出“NO”。', '4\n4 TSST\n2 ST\n10 TTTTTTTTTT\n10 SSTTSTTSTT',
        'NO\nYES\nNO\nYES', '60');
INSERT INTO `t_problem_description`
VALUES ('18800482763',
        '小芳在校期间成绩优秀，毕业之前她决定去找一份她喜欢的工作，她将在自己中意的公司中选择，并设定了3个条件，满足其中2个条件的工作她认为可以接受。这三个条件分别为：\n\n          1. 月薪不低于5000元\n\n          2. 有带薪休假\n\n          3. 离家不超过2000公里\n\n          请根据某公司给定的3个给定条件的数据，判断小芳是否应该接受该公司的offer。',
        '输入一行包含3个数据，分别表示公司给定的月薪、有无带薪休假(y-有，n-无)、离家距离', '输出一行，Accept为接受，Refuse为拒绝', '5500 y 1500', 'Accept', '93');
INSERT INTO `t_problem_description`
VALUES ('19398545497',
        ' 这几天同学们总是对阿迪议论纷纷，这使得他很烦恼，似乎产生了一些抑郁，头也有点痛，打不起精神，他只好去看医生。然而，他只有去看过 n 个医生之后才能确诊病情，每个医生都需要上一个医生的诊断结果，因此他必须按顺序去预约每个医生，也就是说，他必须先去看医生1，然后再去看医生2，然后是医生3，等等。只有到最后一个医生那里才能确诊，且每天只能看一个医生。\n\n      从今天开始，每个医生都有一个固定的出诊安排表，医生 i 在第 si 天看病人，然后在之后的每个第 di 天看诊。因此，他只在 si、si+di、si+2di、... 这些天工作。\n\n      预约每个医生有些困难，他想知道看完所有医生至少需要多少天？',
        '  输入的第一行一个正整数 n ，表示医生的数量。\n\n       接下来的 n 行，每行两个正整数 si 和 di，表示第 i 个医生的工作情况。', '   输出一行一个整数，表示阿迪看完最后一个医生的天数。',
        '3\n2 2\n1 2\n2 2', '4', '76');
INSERT INTO `t_problem_description`
VALUES ('19889630788',
        '请在代码框中填充正确的代码，完成以下功能：\n\n（1）声明一个Student类型，包含学号和成绩两个属性。\n\n（2）定义无参构造函数，从键盘输入学生的数据（学号、成绩），初始化Student对象\n\n（3）定义建立一个对象数组，存储n个学生的数据信息\n\n（4）定义一个全局函数void pass( Student *pStu,int size)，用指针作为形参，输出所有及格的学生数据（大于等于60分即为及格）。如果没有，则输出“not exist”。',
        '输入有n+1行，第一行输入正整数n，接下来的n行输入n个学生的数据，学号与成绩之间用空格分隔', '输出有若干行，分别表示学生数组中及格学生的数据，左对齐，且学号信息占12位宽度，成绩有1位小数。',
        '3\nzhangsan 100\nlisi 65.5\nwangwu 58.1', 'zhangsan    100.0\nlisi        65.5', '24');
INSERT INTO `t_problem_description`
VALUES ('20838292882', '凯撒密码的加密过程是：给定一串字符，把其中每个大写字母变换成按顺序向后移N位的字母，遇到26个字母结束要环回到字母A计算顺序，其他字符不变。请编写函数实现凯撒加密，输出密文。',
        '首先输入N的值。\n\n    然后输入一串包含一些大写字母的字符串，不包含空格，串长小于100个字符。', '输出加密后的密文字符串', '3\nABC123&*XYZ', 'DEF123&*ABC', '57');
INSERT INTO `t_problem_description`
VALUES ('21021410424',
        '设定以下汇率常量\n\n美元汇率为6.2619，表示1美元兑换6.2619元人民币\n\n欧元汇率为6.6744，表示1欧元兑换6.6744元人民币\n\n日元汇率为0.0516，表示1元日元兑换0.0516元人民币\n\n港币汇率为0.8065，表示1元港币币兑换0.8065元人民币\n\n定义一个常量指针，根据需求指针指向不同的汇率，然后计算出各种货币兑换为人民币的数量\n\n要求：不能直接使用汇率常量进行计算，必须使用常量指针，只能使用一个指针',
        '输入一个t表示有t个测试实例\n\n每行先输入一个字母，表示货币类型，然后再输入一个数字（正浮点数），表示货币数量\n\nD表示美元，E表示欧元，Y表示日圆，H表示港币\n\n依次输入t行', '输出四位浮点数',
        '1\nD 5\n', '31.3095', '42');
INSERT INTO `t_problem_description`
VALUES ('21135034629',
        '校园卡拉OK比赛设置了7名评委，当一名选手K完歌之后，主持人报出歌手名字后，7位评委同时亮分，按照惯例，去掉一个最高分和一个最低分后，其余5位评委评分总和为该选手的最终得分。\n\n       一共有n组选手参加比赛，请你编写一个程序，当所有比赛结束后，列出所有选手的排名以及最终得分情况。\n\n       假定不会出现总分相同的情况',
        '第1行为一个正整数n，表示参赛人数。随后n行，每行开始为选手的名字，随后7个正整数表示评委亮分情况，数据间以空格分隔。', '按名次升序输出所有选手的名字以及总分，总共n行。',
        '4\nAlice 90 90 85 92 90 90 90\nBob 92 99 88 92 92 92 92\nCindy 80 85 94 94 94 94 94\nDony 95 95 100 90 95 95 95',
        'Dony 475\nCindy 461\nBob 460\nAlice 450', '30');
INSERT INTO `t_problem_description`
VALUES ('21450235534', ' 你买了一箱n个苹果，很不幸的是买完时箱子里混进了一条虫子。虫子每x小时能吃掉一个苹果，假设虫子在吃完一个苹果之前不会吃另一个，那么经过y小时你还有多少个完整的苹果？',
        ' 输入仅一行，包括n，x和y（均为整数）。', '输出也仅一行，剩下的苹果个数。', '10 4 9', '7', '106');
INSERT INTO `t_problem_description`
VALUES ('23362807949',
        '为了备战游泳比赛，小张在拼命训练以获取好的名次。\n某天小张对自己的游泳训练时间进行了计时(计时按24小时制)，分别记录了自己当天开始训练的时间a时b分c秒和结束训练的时间d时e分f秒。\n请计算出小张当天总的游泳训练时间。\n',
        '游泳训练的开始时间和结束时间，开始与结束时间之间以空格作为间隔，时间格式均为“时:分:秒”。', '总的训练时间，格式为“时:分:秒”。', '11:20:15 11:25:21', '0:05:06', '102');
INSERT INTO `t_problem_description`
VALUES ('23988291694',
        '给你一个长度固定的整数数组 arr ，请你将该数组中出现的每个零都复写一遍，并将其余的元素向右平移。\n\n注意：请不要在超过该数组长度的位置写入元素。请对输入的数组 就地 进行上述修改，不要从函数返回任何东西。',
        'n位整型', 'n位整形', 'arr = [1,0,2,3,0,4,5,0]', '[1,0,0,2,3,0,0,4]', '45');
INSERT INTO `t_problem_description`
VALUES ('24770297992',
        '定义一个电话号码类CTelNumber，包含1个字符指针数据成员，以及构造、析构、打印及拷贝构造函数。\n字符指针是用于动态创建一个字符数组，然后保存外来输入的电话号码\n构造函数的功能是为对象设置键盘输入的7位电话号码，\n拷贝构造函数的功能是用原来7位号码的对象升位为8位号码对象,也就是说拷贝构造的对象是源对象的升级.电话升位的规则是原2、3、4开头的电话号码前面加8，原5、6、7、8开头的前面加2。\n注意:电话号码只能全部是数字字符，且与上述情况不符的输入均为非法)',
        '测试数据的组数 t\n\n第一个7位号码\n\n第二个7位号码\n\n…', '第一个号码升位后的号码\n\n第二个号码升位后的号码\n\n…', '3\n6545889\n3335656\n565655\n',
        '26545889\n83335656\nIllegal phone number\n', '13');
INSERT INTO `t_problem_description`
VALUES ('25215674578',
        '#include <iostream>\nusing namespace std;\nclass A {\n public:\n  int i;\n  A(int x) { i = x; }\n// 在此处补充你的代码\n};\nint main()\n{\n A a(1);\n A * pa = new A(2);\n delete pa;\n return 0;\n}\n（练习时请复制上述已有代码）\n',
        '无', '无', '无', '2\n1\n', '16');
INSERT INTO `t_problem_description`
VALUES ('28252915871',
        '莫比乌斯函数，数论函数，由德国数学家和天文学家莫比乌斯(Möbius ,1790–1868)提出。梅滕斯(Mertens)首先使用μ(n)作为莫比乌斯函数的记号。而据说，高斯(Gauss)比莫比乌斯早三十年就曾考虑过这个函数。莫比乌斯函数在数论中有着广泛应用。\n\n       莫比乌斯函数完整定义的通俗表达：\n\n       1）莫比乌斯函数μ(n)的定义域是N\n\n       2）μ(1)=1\n\n       3）当n存在平方因子时，μ(n)=0\n\n       4）当n是素数或奇数个不同素数之积时，μ(n)=-1\n\n       5）当n是偶数个不同素数之积时，μ(n)=1 \n\n\n\n      例如：\n\n             μ(8)，μ(12)，μ(18) = 0\n\n             μ(2)，μ(3)，μ(30) = -1\n\n             μ(1)，μ(6)，μ(10) = 1\n\n        给出一个数n, 计算μ(n)。',
        ' 输入一行一个整数n', '输出μ(n)', '12', '0', '88');
INSERT INTO `t_problem_description`
VALUES ('28685999113',
        '设计一个类来实现手机的功能。它包含私有属性：号码类型、号码、号码状态、停机日期；包含方法：构造、拷贝构造、打印、停机。\n1、号码类型表示用户类别，只用单个字母，A表示机构，B表示企业、C表示个人\n2、号码是11位整数，用一个字符串表示\n3、号码状态用一个数字表示，1、2、3分别表示在用、未用、停用\n4、停机日期是一个日期对象指针，在初始化时该成员指向空，该日期类包含私有属性年月日，以及构造函数和打印函数等\n5、构造函数的作用就是接受外来参数，并设置各个属性值,并输出提示信息，看示例输出\n6、拷贝构造的作用是复制已有对象的信息，并输出提示信息，看示例输出。\n想一下停机日期该如何复制，没有停机如何复制？？已经停机又如何复制？？\n7、打印功能是把对象的所有属性都输出，输出格式看示例\n8、停机功能是停用当前号码，参数是停机日期，无返回值，操作是把状态改成停用，并停机日期指针创建为动态对象，并根据参数来设置停机日期，最后输出提示信息，看示例输出\n要求：在主函数中实现号码备份的功能，对已有的虚拟手机号的所有信息进行复制，并将号码类型改成D表示备份；将手机号码末尾加字母X',
        '第一行输入t表示有t个号码\n\n第二行输入6个参数，包括号码类型、号码、状态、停机的年、月、日，用空格隔开\n\n依次输入t行',
        '每个示例输出三行，依次输出原号码信息、备份号码信息和原号码停机后的信息\n\n每个示例之间用短划线（四个）分割开，看示例输出',
        '2\nA 15712345678 1 2015 1 1\nB 13287654321 2 2012 12 12\n\n',
        'Construct a new phone 15712345678\n类型=机构||号码=15712345678||State=在用\nConstruct a copy of phone 15712345678\n类型=备份||号码=15712345678X||State=在用\nStop the phone 15712345678\n类型=机构||号码=15712345678||State=停用 ||停机日期=2015.1.1\n----\nConstruct a new phone 13287654321\n类型=企业||号码=13287654321||State=未用\nConstruct a copy of phone 13287654321\n类型=备份||号码=13287654321X||State=未用\nStop the phone 13287654321\n类型=企业||号码=13287654321||State=停用 ||停机日期=2012.12.12\n----\n',
        '15');
INSERT INTO `t_problem_description`
VALUES ('29299924177', '编写函数，求一个用字符数组存储的字符串长度。在主函数中调用该函数，输出结果。输入的字符串允许包含空格。', '一个字符串，长度不超过50.', '一个表示字符串长度的整数',
        'How are you?', '12', '55');
INSERT INTO `t_problem_description`
VALUES ('30722708728', '从键盘输入n个字符，请分别统计大写字母、小写字母、数字、其他字符的个数并输出；还需要输出所有数字字符之和。', '第一行为一个整数n（100>=n>=0），接下来n行每行一个字符。',
        '输出第1行为4个整数，分别表示大写字母、小写字母、数字、其他字符的个数，第2行为一个数字，表示其中所有数字字符所对应的数字之和，当输入的字符中不包含数字字符时，没有第2行。', '5\na\nA\n5\n6\n@',
        '1 1 2 1\n11', '94');
INSERT INTO `t_problem_description`
VALUES ('31331336253',
        '小希看到小芳很容易就找到了她满意的工作，他也想去尝试一下，并参考了小芳找工作的方法。\n\n         与小芳不同的是，小希希望根据三个条件综合评估来选择。\n\n                月薪得分:  月薪/5000*100取整\n\n                带薪假得分：有20分，无0分\n\n                离家距离得分：不超过2000公里为100分。每超过200公里减10分，不足200公里按200公里计算，直至0分为止。\n\n          给定3个公司A、B、C的数据，根据分数最大来判断小希应该接受哪家公司的offer。',
        '  输入为3行（分别为A、B和C公司的数据），每行包含3个数据，分别表示公司给定的月薪（整数）、有无带薪休假(y-有，n-无)、离家距离（整数），所有的输入保证没有两个公司最终的得分相等。',
        '输出一行一个字符(A或B或C，表示小希应该选择的公司)', '24723 y 23588\n37395 n 32313\n36389 n 21061', 'B', '95');
INSERT INTO `t_problem_description`
VALUES ('31641533728',
        '  松雅的旅馆门口有一个自动门，按照以下方式工作：\n\n当门是关闭的时候，1或多个人来到门前，门将马上自动打开，所有人都能马上入内；\n\n当门是打开的时候，1或多个人来到门前，所有人都能马上入内；\n\n打开的门在打开后的 d 秒钟内立即关闭；\n\n当门正在关闭时，1或多个人在同一时刻来到门前，所有人有足够时间入内，之后才会关闭 \n\n       例如，如果 d=3，有4人在4个不同时刻t1=4、t2=7、t3=9 和 t4=13 来到门前，门将会打开3次，即在时刻4、9和13打开，在时刻7和12关闭。\n\n       已知有 n 个员工将在 a、2*a、3*a、...、n*a（ a 是一个正整数）时刻进入，同时在 t1、t2、...、tm 时刻有 m 个客人进入。\n\n       编程求出自动门打开的次数，假定开始时门是关闭的。',
        '  第一行4个正整数 n、m、a、d，分别表示员工数、客人数、第一个雇员进入的时刻、门打开后到关闭的时间长度。\n\n       第二行包括一个正整数序列 t1、t2、...、tm，表示 m 个客人来到门前的时刻，这是一个非递减序列。',
        ' 输出门打开的次数', '1 1 3 4\n7', '1', '81');
INSERT INTO `t_problem_description`
VALUES ('31936821611', '仔细阅读主程序中的调用语句，模拟实现书籍类（Book）。每本书包含一个书架号（shelf_id）和价格（price）。',
        '总共2n+1行，第一行输入n，表示有n本书，接下来的2n行，分别输入n本书的书架号和价格。', '总共n行，每一行输出一本书的书架号和价格。输出包括前导输出信息，书架号占18个字符宽度。详见输出样例。1',
        '3\nA12 3.34\n15\nB1 11.34\n15\nC 4352.45\n60',
        'Shelf_ID: A12 3.34          Price: 15\nShelf_ID: B1 11.34          Price: 15\nShelf_ID: C 4352.45         Price: 60',
        '26');
INSERT INTO `t_problem_description`
VALUES ('31942770930', '请自行设计一个矩形类，可以计算矩形的面积、周长、对角线，判断是否是正方形。请用上类似的构造函数，自己设计main()函数，对设计的类进行测试。',
        '一行数据，两个元素表示矩形的长和宽，用空格隔开。', '五行数据，第一行输出矩形长和宽，第二行输出周长，第三行输出面积，第四行输出对角线长度，第五行输出是否为正方形（是输出Yes，否输出No），详见样例。', '5 6',
        'length = 5,width = 6\nC = 22\nS = 30\nThe diagonal length = 7.81025\nIs square ? No', '19');
INSERT INTO `t_problem_description`
VALUES ('33706275828',
        '两只小熊都喜欢吃糖果，也喜欢玩和糖果有关的游戏。\nLimak 和 Bob 在玩下面的游戏：Limak 先 吃一颗糖，然后Bob 吃两颗，接着 Limak 吃 3 颗，再接着Bob 吃 4 颗，以此类推。如果轮到一只 熊吃糖，但他却吃不到该吃那么多的糖，它就输了。 \nLimak最多能吃 A 颗糖（不然会肚子痛的），而 Bob 最多能吃 B 颗糖。谁能获胜呢？请输出胜者的名字（“Limak”或“Bob”）。\n',
        '输入的第一行包含一个整数 T，代表测试数据的组数。接下来是 T 组数据。 每组数据仅有一行，包含两个整数 A 和 B，分别代表 Limak 和 Bob 最多能吃的糖果颗数。 ', '输出共T行，代表每组测试数据的赢家',
        '10\n3 2\n4 2\n1 1\n1 2\n1 3\n9 3\n9 11\n9 12\n9 1000\n8 11',
        'Bob\nLimak\nLimak\nBob\nBob\nLimak\nLimak\nBob\nBob\nBob', '89');
INSERT INTO `t_problem_description`
VALUES ('36069508602', '两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。', '给出两个整数 x 和 y(0 ≤ x, y < 231)，用空格分隔', '输出它们之间的汉明距离', '1 4',
        '2', '86');
INSERT INTO `t_problem_description`
VALUES ('36644316628', '输出两行字符。', '无', '\"This is a C++ program.\"\nc:\\teacher\\navision', '无',
        '\"This is a C++ program.\"\nc:\\teacher\\navision', '103');
INSERT INTO `t_problem_description`
VALUES ('36905996245',
        '火星人足球赛的比赛规则与地球人的比赛规则有些非常相似，比如严重犯规，将被给予黄牌警告，特别严重的犯规，将给予红牌直接罚下，如果有人得到第2张黄牌，则自动获得红牌罚下，比赛同样采取主客场制。\n\n       与地球人足球赛不同的是，火星人足球赛每队可以上场的人数不会固定为11人，可以多个人，比赛时间也会更长一些。\n\n       比赛时的裁判员是机器人，判罚非常严厉，如果有人获得红黄牌，机器人裁判将自动记录当时的情况。    ',
        '输入的第一行为主队队名，第二行为客队队名，队名的长度不超过20个字符。\n\n       第三行为一个整数 n (0 ≤ n ≤ 90) ，表示得到红黄牌的犯规次数。\n\n       接下来的n行，每行包含用空格分隔的4个部分，表示犯规的情况:\n\n首先为一个整数，表示犯规的时间（分钟）\n\n接着为一个字符\"h\"或\"a\"，如果为\"h\"，表示该张牌会给到主队球员，否则会给到客队球员\n\n接下来为球员编号m  (1 ≤ m ≤ 99)\n\n接下来为一个字符\"y\"或\"r\"，如果为\"y\"，表示为黄牌，否则为红牌\n\n       不同球队的球员可能有相同的号码，在同一球队球员的号码不相同，犯规记录按时间顺序排列。',
        '输出按时间顺序排列的获得红牌的记录，如果时间相同，则主队排在前面，如果同一时间同一球队有多人获得红牌，则编号大的排在前面。每个红牌一行，包含3个部分：球员所属球队的名字、犯规球员编号、获得红牌时间。\n\n      如果全场比赛无红牌，输出\"No Red Card\"',
        'MC\nCSKA\n9\n28 a 3 y\n62 h 25 y\n66 h 42 y\n70 h 25 y\n77 a 4 y\n79 a 25 y\n82 h 42 r\n89 h 16 y\n90 a 13 r',
        'MC 25 70\nMC 42 82\nCSKA 13 90', '33');
INSERT INTO `t_problem_description`
VALUES ('38030969511',
        '两只老鼠兄弟分别去偷大米，它们事先约定，老大偷到的大米，必须留下1/3作为储备粮，老二必须留下1/4，剩下的它们可以自己吃掉。现給出老大和老二本次偷得的大米数，且假定它们所偷得的大米数总是为整数。求老鼠兄弟本次可以有多少储备大米？',
        '输入为两个整数，表示老鼠兄弟所偷得的大米数。', '   输出为一个数，表示最后老鼠兄弟本次可以获得的储备大米数，保留两位小数。', '12 16', '8.00', '109');
INSERT INTO `t_problem_description`
VALUES ('38390687458',
        '小希打字太慢了，因此他在苦练打字技巧。他用了一个教学 App，可以一个个显示自己打出来的英文单词。 \n\n当小希输入一个词时，他需要花0.2 秒输入第一个字母。而对于接下来的每个字母，如果在标 准指法下和前一个字母使用同侧手输入，则需要 0.4 秒；否则只需 0.2 秒。输入一个词所需的时间 为输入每个字母所需时间之和。不过，如果小希之前练过这个词，那么所需的时间可以降为初次 输入时的一半。\n\n小希输入的内容只包含26个英文字符（区分大小写），字符要求按照标准指法规定输入，其中\"qwertasdfgzxcvb\"这15个字符为左手字符，“yuiophjklnm”这11个字符为右手字符。 \n\n给定小希在练习中依次输入的词，请计算小希的总耗时。',
        '每组数据的第一行包含一个整数 N。接下来 N 行，每行包含一个字符串，代表小希输入的词。', '对于每组数据，输出一行，包含一个整数，代表小希的总耗时，单位为十分之一秒。',
        '5\nfdjkd\ndFjdk\ndfD\nfdjkd\nKkJjk', '61', '69');
INSERT INTO `t_problem_description`
VALUES ('38479180192', '设计一个三角形类Triangle，包含三角形三条边长的私有数据成员，另有一个重载运算符”+”，以实现求两个三角形对象的面积之和。', '分别输入两个三角形的三边长',
        '输出两个三角形的面积和', '3 4 5\n6 8 10', '30', '7');
INSERT INTO `t_problem_description`
VALUES ('38502291169', '编写函数exponent(num,k)，函数功能是根据整数num和底数k，求解指数x，如果找不到满足幂运算结果的底数就返回0',
        '两个整数，第一个为num的值，第二个为底数k的值，用空格隔开', '一个整数，表示指数，满足k的x次方等于num。', '32 2', '5', '54');
INSERT INTO `t_problem_description`
VALUES ('39422201925',
        '设计一个宠物类Pet，具有颜色、体重、年龄等属性，以及一个虚函数speak，其功能为输出宠物的叫声。以该类为基类，派生出Cat类和Dog类，他们各自包含自身的构造函数及speak函数的不同实现。编写对一个具体的Cat和Dog进行测试的程序。',
        '无', '分别输出宠物猫和狗的叫声', '无', 'Cat: miao miao miao...\nDog: wang wang wang...', '4');
INSERT INTO `t_problem_description`
VALUES ('40275216873', '给你一个混合字符串 s ，请你返回 s 中 第二大 的数字，如果不存在第二大的数字，请你返回 -1 。\n\n混合字符串 由小写英文字母和数字组成。', '字符串', '数字',
        'dfa12321afd', '2', '43');
INSERT INTO `t_problem_description`
VALUES ('40571426312',
        '某公司需要招聘一批员工，该公司有自己独特的评价体系，对应聘者设立了 3 个指标：技能值 Ki、智慧值 Ii 和忠诚度 Ei ，i=1, 2, ...\n\n        经过严格的初选和复选以及各项测试以后，有 N 个人进入最后的名单，公司给出了每个人的各项指标值，并规定对于某人 i，如果存在另外人 j，有Ki < Kj 、Ii < Ij 、Ei < Ej ，则 i 将会被淘汰。\n\n        请找出总共有多少人会被淘汰。',
        '第一行包含一个整数 N （1≤ N ≤ 500000），表示最终进入评价名单的人数。第二行包括 N 个整数 Ki，第三行包含 N 个整数 Ii，第四行包含 N 个整数 Ei ，0 ≤ Ki、Ii 、 Ei  ≤ 109。',
        '输出为一行一个整数。', '3\n1 4 2\n4 3 2\n2 5 3', '1', '32');
INSERT INTO `t_problem_description`
VALUES ('40871685993',
        ' 阿迪和他的朋友一共k个人，分吃n颗糖，每颗糖只能分给他们中的某个人或者丢弃。\n\n         人的编号从1到k，阿迪是第1号。阿迪将选择一个正整数x来分糖，他先给自己x颗，然后给下一个人x颗，再给第三个人x颗，如此继续，循环往复。剩余的（不能整除x的部分）将会丢弃。\n\n         阿迪不能选择大于M的x去分配，因为这样会被别人认为太贪心（嘿嘿，其实他真的很贪心）。还有，他不能选择一个小的x，使得有人会收到糖的次数超过D，这样会被认为分得太慢。\n\n         阿迪想请你找出一个有效的x，保证让阿迪能得到最多的糖。',
        '输入为一行4个整数n、k、M和D，分别表示糖的数量、人的数量、每次能分配的最大数量、人可以收到糖的最大次数。', '输出为一个整数，表示阿迪自己能收到的最大可能的糖的颗数。', '20 4 5 2', '8',
        '74');
INSERT INTO `t_problem_description`
VALUES ('41346201003',
        '国王将金币作为工资，发放给忠诚的骑士。第1天，骑士收到一枚金币；之后两天(第2天和第3天)里，每天收到两枚金币；之后三天(第4、5、6天)里，每天收到三枚金币；之后四天(第7、8、9、10天)里，每天收到四枚金币……这种工资发放模式会一直这样延续下去：当连续n天每天收到n枚金币后，骑士会在之后的连续n+1天里，每天收到n+1枚金币(n为任意正整数)。\n\n你需要编写一个程序，确定从第一天开始的给定天数内，骑士一共获得了多少金币。',
        '一个整数（范围1到10000），表示天数。', '骑士获得的金币数。', '6', '14', '84');
INSERT INTO `t_problem_description`
VALUES ('41621415128',
        ' 松雅认为，拥有自己的旅馆是赚钱的最好方式，因为她可以在任何她想要的地方赚钱和休闲。\n\n       松雅生活的国度是一个无尽头的线状型，在这条直线的每个整数坐标上有一座城市。她有n个旅馆，第i个旅馆位于具有坐标xi的城市。松雅是位聪明的女孩，她不会在同一城市开设两家或多家旅馆。\n\n       松雅想拓展业务，因此，她决定开更多的旅馆。她想让新开的旅馆到所有其他旅馆的最短距离等于d，这个女孩知道有很多地方可以建造这样的旅馆。她想知道有多少可以建造一家新旅馆的城市。 \n\n       在一家自己的旅馆，她懒洋洋地躺在按摩浴缸里，要求你帮她找出能建新旅馆的城市数目，使得从原来的n家旅馆到新的旅馆的最小距离等于d。 ',
        '输入的第一行包含两个整数n和d，表示松雅现有的旅馆数量和新旅馆到其他所有旅馆的最短距离。\n\n      第二行包括n个不同的整数，以严格递增的形式给出，表示现有的旅馆所在城市的坐标。',
        '输出为一个整数，表示松雅可以新建旅馆的城市坐标的数量。', '4 3\n-3 2 9 16', '6', '72');
INSERT INTO `t_problem_description`
VALUES ('41670862884',
        '  在本台球游戏中，包含多种颜色的球，其中：红球15只各1分、黄球1只2分、绿球1只3分、咖啡球1只4分、蓝球1只5分、粉球1只6分、黑球1只7分。\n\n        球的颜色表示为：\n\n                           r-红色球 y-黄色球 g-绿色球 c-咖啡色球 b-蓝色球 p-粉红球 B-黑色球\n\n        其中红球可能一次打进多个，且打进后不再摆回，其他球打进之后需要再摆回。\n\n        请计算n次击打之后总的得分。',
        '输入第一行为非负整数n，表示一个人进行了n次击打。\n\n        接下来为n次击打记录，每次记录有两种形式:\n\n                 如果打进红球，则有两行， 第一行为r，第二行为一个整数(<=15)，表示打进的红球个数\n\n                 如果打进其他球，仅有一行，为ygcbpB中任意一个字符。',
        ' 输出一个整数，表示该人最终的得分。', '5\nr\n3\ng\ny\nr\n1\nB', '16', '96');
INSERT INTO `t_problem_description`
VALUES ('43244791100',
        '#include <cstdlib>\n#include <iostream>\nusing namespace std;\nint strlen(const char * s) \n{ int i = 0;\n for(; s[i]; ++i);\n return i;\n}\nvoid strcpy(char * d,const char * s)\n{\n int i = 0;\n for( i = 0; s[i]; ++i)\n  d[i] = s[i];\n d[i] = 0;\n  \n}\nint strcmp(const char * s1,const char * s2)\n{\n for(int i = 0; s1[i] && s2[i] ; ++i) {\n  if( s1[i] < s2[i] )\n   return -1;\n  else if( s1[i] > s2[i])\n   return 1;\n }\n return 0;\n}\nvoid strcat(char * d,const char * s)\n{\n int len = strlen(d);         //len不过包括0\n strcpy(d+len,s);       //后面还会cpy一个0\n}\nclass MyString\n{\n// 在此处补充你的代码\n};\nint CompareString( const void * e1, const void * e2)\n{\n MyString * s1 = (MyString * ) e1;\n MyString * s2 = (MyString * ) e2;\n if( * s1 < *s2 )\n return -1;\n else if( *s1 == *s2)\n return 0;\n else if( *s1 > *s2 )\n return 1;\n}\nint main()\n{\n MyString s1(\"abcd-\"),s2,s3(\"efgh-\"),s4(s1);\n MyString SArray[4] = {\"big\",\"me\",\"about\",\"take\"};\n cout << \"1. \" << s1 << s2 << s3<< s4<< endl;\n s4 = s3;\n s3 = s1 + s3;\n cout << \"2. \" << s1 << endl;\n cout << \"3. \" << s2 << endl;\n cout << \"4. \" << s3 << endl;\n cout << \"5. \" << s4 << endl;\n cout << \"6. \" << s1[2] << endl;\n s2 = s1;\n s1 = \"ijkl-\";\n s1[2] = \'A\' ;\n cout << \"7. \" << s2 << endl;\n cout << \"8. \" << s1 << endl;\n s1 += \"mnop\";\n cout << \"9. \" << s1 << endl;\n s4 = \"qrst-\" + s2;\n cout << \"10. \" << s4 << endl;\n s1 = s2 + s4 + \" uvw \" + \"xyz\";\n cout << \"11. \" << s1 << endl;\n qsort(SArray,4,sizeof(MyString),CompareString);\n for( int i = 0;i < 4;i ++ )\n cout << SArray[i] << endl;\n //s1的从下标0开始长度为4的子串\n cout << s1(0,4) << endl;\n //s1的从下标5开始长度为10的子串\n cout << s1(5,10) << endl;\n return 0;\n}\n（练习时请复制上述已有代码）',
        '无', '无', '无',
        '1. abcd-efgh-abcd-\n2. abcd-\n3.\n4. abcd-efgh-\n5. efgh-\n6. c\n7. abcd-\n8. ijAl-\n9. ijAl-mnop\n10. qrst-abcd-\n11. abcd-qrst-abcd- uvw xyz\nabout\nbig\nme\ntake\nabcd\nqrst-abcd-\n',
        '3');
INSERT INTO `t_problem_description`
VALUES ('43840652162', '有一个房间，大小为 M×N m2，小王准备用尺寸为 2×1 m2的瓷砖铺满整个房间，每块瓷砖铺贴时可以旋转且尽可能不做切割。请问小王至少需要准备多少块这样的瓷砖？',
        '输入为两个整数 M 和 N，表示房间的大小。', ' 输出为一个整数，表示小王铺满整个房间至少需要准备的瓷砖数。', '3 3', '5', '108');
INSERT INTO `t_problem_description`
VALUES ('45919840608',
        ' 猴子王国里有n只猴子，第i只猴子有ri种技能。\n\n       猴子a可以是猴子b的导师，当且仅当猴子a的技能严格大于猴子b的技能(ra>rb)，并且a和b无性格冲突，有性格冲突的猴子在一起会打架。\n\n       给定每个猴子的技能值，以及有性格冲突的k对猴子。对于每只猴子，找出可以成为其他猴子导师的个数。',
        '  第一行包含两个正整数n和k，表示猴子的数量以及有性格冲突的猴子的对数。\n\n       第二行为一个整数序列，r1、r2、...、rn，其中ri表示第i只猴子的技能数。\n\n       接下来的k行，每行为两个正整数x、y(1≤ x、y≤n，x≠ y)，表示有性格冲突的一对猴子编号，输入保证(x,y)和(y,x)不会同时出现。',
        ' 输出n个整数，第i个整数表示第i个猴子能成为多少只猴子的导师。', '4 2\n10 4 10 15\n1 2\n4 3', '0 0 1 2', '75');
INSERT INTO `t_problem_description`
VALUES ('45953672145',
        '有一个 n×m 的网格，其中包含一些实心单元和一些空心单元。网格左上角的坐标为(1, 1)，而右下角的坐标为(n, m)。其中有 k 个实心单元，而其他的则是空心的。这时从坐标为( xs，ys )的单元中心向四个对角方向之一（也就是东北、西北、东南和西南）的方向发射一个激光束，如果激光束遇到实心单元或网格边缘则形成反射或折射。方式如下（入射角度为NE为例）：一段时间后，激光束将进入一个死循环，计算在进入死循环之前激光束穿越至少一次的空单元格总数，穿越是指穿过单元中心。',
        '输入的第一行包含三个整数 n、m 和 k (1≤n、m≤1000, 0≤k≤1000)。接下来的 k 行每行包含两个整数 xi 和 yi (1≤xi≤n，1≤yi≤m)，表示第 i 个实心单元的位置。\n\n       最后一行包含两个整数xs 、 ys (1≤xs≤n，1≤ys≤m)以及激光发射方向，分别用\"NE\"、\"NW\"、\"SE\"、\"SW\"代表东北、西北、东南、西南方向。',
        '输出仅有一行一个数字，表示激光束进入死循环之前所穿越过至少一次的空心单元格的总数。', '3 3 0\n1 2 SW', '6', '64');
INSERT INTO `t_problem_description`
VALUES ('47313171650',
        '一只小猴想去商店里购买 w 只香蕉，它购买第一只香蕉需要 k 元，购买第2只香蕉需要 2k 元，以此类推，购买第 i 只香蕉需要 i●k 元，然而它只有 n 元， 那么它还需要向它的朋友借多少元？',
        '输入为一行，包含三个数 k、n、w (1≤ k、w ≤1000，0 ≤ n ≤ 109)。', ' 输出为一个整数，表示小猴购买 w 只香蕉需要向它朋友所借的钱数，如果不需要借，则输出0。', '3 17 4',
        '13', '107');
INSERT INTO `t_problem_description`
VALUES ('47663177537',
        '输入若干个（≤105）武将的信息，包括姓名、体力、智力和武力值，直到用户输入为‘#’，表示输入结束。再输入指标编号（1表示体力 2表示智力 3表示武力），根据该指标对所有将领进行从大到小排序，指标值相同的武将保持输入时的先后顺序不变，并将排序后的结果输出，每个信息之间用空格分隔。请自己实现排序算法。',
        '‘#’之前的每一行都包含四个信息，分别是姓名、体力、智力、武力；‘#’后一行的数字表示单项指标序号，如1表示按体力排序。 ',
        '将排序后的武将信息，按行输出，每行包含姓名、体力、武力、智力等四个数据，每个数据之间用单个空格分隔。', 'guan 90 80 90\nzhao 90 90 90\nzhang 100 70 80\n#\n2',
        'zhao 90 90 90\nguan 90 80 90\nzhang 100 70 80', '37');
INSERT INTO `t_problem_description`
VALUES ('52765888981', '输入两个正整数A和B，其中A和B都小于32767，求A/B的值，精确到小数点后N位（1<=N<=200）。', '输入只有一行，包括三个整数，分别为A、B和N。',
        '输出只有一行，包括一个数，这个数有N位小数。', '10 3 10', '3.3333333333', '80');
INSERT INTO `t_problem_description`
VALUES ('54889756601',
        '#include <iostream>\n#include <string>\n#include <cstdio>\n#include <cstring>\n#include <sstream>\n#include <cstdlib>\nusing namespace std;\n\nclass Student {\n// 在此处补充你的代码\n};\n\nint main() {\n Student student;        // 定义类的对象\n student.input();        // 输入数据\n student.calculate();    // 计算平均成绩\n student.output();       // 输出数据\n}\n（练习时请复制上述代码）\n',
        '输入数据为一行，包括：\n姓名,年龄,学号,第一学年平均成绩,第二学年平均成绩,第三学年平均成绩,第四学年平均成绩。\n其中姓名为由字母和空格组成的字符串（输入保证姓名不超过20个字符，并且空格不会出现在字符串两端），年龄、学号和学年平均成绩均为非负整数。信息之间用逗号隔开。',
        '输出一行数据，包括：\n姓名,年龄,学号,四年平均成绩。\n信息之间用逗号隔开。', 'Tom Hanks,18,7817,80,80,90,70', 'Tom Hanks,18,7817,80', '18');
INSERT INTO `t_problem_description`
VALUES ('55766001084', '所谓回文数是指其各位数字左右对称的整数。例如：121，676，94249等。\n\n   输入一个正整数N，编写函数判断N是否为回文数。', '输入一个正整数N',
        '如果N是回文数则输出true，否则输出false', '121', '1', '58');
INSERT INTO `t_problem_description`
VALUES ('56221707317',
        '小熊去到商店，选择了一种它非常喜欢的糖果，其单价为 k 元，假定商店里有无穷多的这种糖果。\n\n       它的父亲允许它花费任意多的10元硬币和一个 r 元硬币去购买，但不能找零，请帮助小熊确定它能购买的最少数量的糖果是多少？',
        '输入为一行两个整数 k 和 r (1≤ k ≤1000，1≤  r ≤9)，分别表示糖果的价格以及小熊手里的单独硬币的币值。', '输出为一个数，表示小熊在不找零的情况下所能购买糖果的最小数量。', '117 3',
        '9', '50');
INSERT INTO `t_problem_description`
VALUES ('56756009437',
        '给你一个字符串 s，它仅由字母 \'a\' 和 \'b\' 组成。每一次删除操作都可以从 s 中删除一个回文 子序列。\n\n返回删除给定字符串中所有字符（字符串为空）的最小删除次数。\n\n「子序列」定义：如果一个字符串可以通过删除原字符串某些字符而不改变原字符顺序得到，那么这个字符串就是原字符串的一个子序列。\n\n「回文」定义：如果一个字符串向后和向前读是一致的，那么这个字符串就是一个回文。',
        '字符串', '整型', 's = \"ababa\"', '1', '46');
INSERT INTO `t_problem_description`
VALUES ('57037632265', 'n 个人（编号从1~n）围成一圈，从第 k 个人开始数数，数到 m 的人出圈，然后继续从未出列的下一个人开始数数，数到 m 的人出圈，重复上述过程，直到圈中仅剩下一人。',
        '输入为一行三个正整数，n、k、m。', '输出为一个正整数，表示最后剩下的人的编号。', '100 1 5', '47', '22');
INSERT INTO `t_problem_description`
VALUES ('58537753196', '仔细阅读主程序中的调用语句，请根据所给代码，模拟一个菜单类（menu）。该类存储若干条菜单选项（item），支持菜单项内容的输入和输出。',
        '总共n+1行，第一行输入整数n，表示该菜单有n项，接下来的n行，输入每个菜单项信息。', '总共n行，输出n条菜单项的具体内容，每个菜单项占一行。', '3\n1 open\n2 copy\n3 exit',
        '1 open\n2 copy\n3 exit', '25');
INSERT INTO `t_problem_description`
VALUES ('58579219361',
        '春节期间小希计划乘坐火车去旅行。开始时，火车位于位置1，目的地在位置L。火车的速度是1单位长度/分钟（也就是第1分钟火车在位置1，第2分钟在位置2，等等）。\n\n        中国人过年都喜欢挂灯笼，在该路线上就有许多灯笼，它们位于能被 v 整除的位置上（也就是说，第1个灯笼在位置 v ，第2个灯笼在位置2v，等等）。\n\n        有另外一辆火车停留在从位置 l 到 r 的地方。\n\n        显然，当 p 能被 v 整除的时候，且该处没有火车停留（p∉[l;r]），小希就可以看到处于位置 p 上的灯笼。因此，灯笼的位置如果被停留的火车遮挡，小希就看不见这些灯笼。\n\n        请输出小希在旅行期间能看到的灯笼数。',
        '输入的第一行为一个整数T，表示测试数据的组数。\n\n        接下来的T行，每行4个整数，为L、v、l、r，分别表示目的地的位置、灯笼的间距、停留火车的位置区间段。',
        ' 输出为T行，对应每个测试用例的输出结果。', '4\n10 2 3 7\n100 51 51 51\n1234 1 100 199\n1000000000 1 1 1000000000',
        '3\n0\n1134\n0', '70');
INSERT INTO `t_problem_description`
VALUES ('59553614435',
        '有一个学校的老师共用N个教室，按照规定，所有的钥匙都必须放在公共钥匙盒里，老师不能带钥匙回家。每次老师上课前，都从公共钥匙盒里找到自己上课的教室的钥匙去开门，上完课后，再将钥匙放回到钥匙盒中。\n　　钥匙盒一共有N个挂钩，从左到右排成一排，用来挂N个教室的钥匙。一串钥匙没有固定的悬挂位置，但钥匙上有标识，所以老师们不会弄混钥匙。\n　　每次取钥匙的时候，老师们都会找到自己所需要的钥匙将其取走，而不会移动其他钥匙。每次还钥匙的时候，还钥匙的老师会找到最左边的空的挂钩，将钥匙挂在这个挂钩上。如果有多位老师还钥匙，则他们按钥匙编号从小到大的顺序还。如果同一时刻既有老师还钥匙又有老师取钥匙，则老师们会先将钥匙全还回去再取出。\n　　今天开始的时候钥匙是按编号从小到大的顺序放在钥匙盒里的。有K位老师要上课，给出每位老师所需要的钥匙、开始上课的时间和上课的时长，假设下课时间就是还钥匙时间，请问最终钥匙盒里面钥匙的顺序是怎样的？',
        '输入的第一行包含两个整数N, K。\n　　接下来K行，每行三个整数w, s, c，分别表示一位老师要使用的钥匙编号、开始上课的时间和上课的时长。可能有多位老师使用同一把钥匙，但是老师使用钥匙的时间不会重叠。\n　　保证输入数据满足输入格式，你不用检查数据合法性。',
        '输出一行，包含N个整数，相邻整数间用一个空格分隔，依次表示每个挂钩上挂的钥匙编号。', '5 2\n4 3 3\n2 2 7', '1 4 3 2 5', '36');
INSERT INTO `t_problem_description`
VALUES ('61078495343',
        '矩阵是线性代数中的重要概念，应用领域非常广泛，在C/C++中，通常将矩阵定义为一个二维数组。\n\n       本问题中，将输入两个矩阵 A 和 B，实现对矩阵的数乘、矩阵加法、矩阵乘法以及行列式的计算。',
        '输入的第一行为两个正整数 M 和 N，分别表示矩阵 A 的行数和列数；\n\n       接下来的 M 行，每行 N 个用空格分隔的整数，表示矩阵 A 的元素值；\n\n       接下来的一行，为一个整数 x,  用于对矩阵 A 进行数乘；\n\n       接下来的一行为两个正整数 K 和 L, 分别表示矩阵 B 的行数和列数；\n\n       接下来的 K 行，每行为 L 个用空格分隔的整数，表示矩阵 B 的元素值。',
        '输出的第一部分为 M 行，每行为 N 个用空格分隔的整数，表示 x 数乘 A 的结果；\n\n       接下来(如果有），如果 A 和 B 可以相加，则输出 M 行，每行为 N 个用空格分隔的整数，表示矩阵 A+B 的结果；\n\n       接下来(如果有），如果 A 和 B 可以相乘，则输出 M 行，每行为 L 个用空格分隔的整数，表示矩阵 A×B 的结果；\n\n       接下来一行(如果有），如果 A 的行列式存在，则输出一个整数，表示 A 的行列式的值；\n\n       接下来一行(如果有），如果 B 的行列式存在，则输出一个整数，表示 B 的行列式的值。',
        '2 2\n29 51\n7 84\n9\n2 9\n1 1 4 8 5 7 4 5 9\n2 5 5 1 6 1 4 8 6',
        '261 459\n63 756\n131 284 371 283 451 254 320 553 567\n175 427 448 140 539 133 364 707 567\n2079', '21');
INSERT INTO `t_problem_description`
VALUES ('62563870792',
        '某班有 n 个学生，下课铃一响，大家都去饮水机喝水，没有两个人能同时使用饮水机，因此，同学们必须排队取水。\n\n      第 i 个学生在第 li 秒来到队尾，如果同一时刻有多个学生来到队伍，则编号大的排在编号小的后面，排在队伍最前面的学生将花1秒的时间取水，然后离开，其他人在后面排队。如果到第 ri 秒学生 i 还没有取到水且他前面还有人，他将不打水而直接离开队伍。\n\n       编程求每个学生取到水的时间。',
        '输入第一行为一个整数T，表示测试用例的个数。\n\n       接下来是T个测试用例，每个用例的第一行为一个整数 n，表示学生数，接下来的 n 行，每行两个整数 li 和 ri ，分别表示第 i 个同学在第 li 秒来到队伍末尾，如果第 ri 秒还没取到水则离开队伍的时间。',
        '对于每个测试用例，输出 n 个整数，表示第 i 个学生取到水的秒数，如果没取到水则为0', '2\n2\n1 3\n1 4\n3\n1 5\n1 1\n2 3', '1 2 \n1 0 2', '77');
INSERT INTO `t_problem_description`
VALUES ('63861934986',
        '#include <iostream>\nusing namespace std;\nclass Sample {\npublic:\n int v;\n// 在此处补充你的代码\n};\nvoid PrintAndDouble(Sample o)\n{\n cout << o.v;\n cout << endl;\n}\nint main()\n{\n Sample a(5);\n Sample b = a;\n PrintAndDouble(b);\n Sample c = 20;\n PrintAndDouble(c);\n Sample d;\n d = a;\n cout << d.v;\n return 0;\n}\n（练习时请复制上述代码）\n',
        '无', '无', '无', '9\n22\n5\n', '17');
INSERT INTO `t_problem_description`
VALUES ('64070845756',
        ' 小女孩塔雅在一栋多层建筑中攀爬楼梯，每次爬过一个楼梯，她喜欢从1到顶数楼梯的台阶级数，并大声地说出每个数字。如果她爬了两个楼梯，第一个有3级，第二个有4级，她将读出数字1、2、3、1、2、3、4。\n\n       给出塔雅读出的所有数字，判断她爬了多少楼梯，且输出每个楼梯有多少台阶级数？',
        '输出的第一行为一个整数n，表示塔雅读出了多少个数字。\n\n       第二行包含n个整数a1、a2、...、an，表示塔雅攀爬楼梯时读出的数字，按顺序从第1个到最后一个，当攀爬一个有x级的楼梯时，她将依次读出1、2、...、x。',
        '输出的第一行一个t，表示塔雅攀爬的楼梯个数，第二行输出t个数，表示每个楼梯的台阶数。', '7\n1 2 3 1 2 3 4', '2\n3 4', '71');
INSERT INTO `t_problem_description`
VALUES ('64748704801',
        '编写一个算法来判断一个数 n 是不是快乐数。\n\n「快乐数」 定义为：\n\n对于一个正整数，每一次将该数替换为它每个位置上的数字的平方和。\n然后重复这个过程直到这个数变为 1，也可能是 无限循环 但始终变不到 1。\n如果这个过程 结果为 1，那么这个数就是快乐数。\n如果 n 是 快乐数 就返回 true ；不是，则返回 false 。',
        '一个数', 'true 或 false', 'n = 19', 'true', '48');
INSERT INTO `t_problem_description`
VALUES ('64759199325', ' 今年夏天特别热，阿迪和朋友两人决定去买个西瓜然后分着吃，西瓜的重量为 w，他们两人都是偶数迷，将西瓜分为两份，他们能否都得到重量为偶数的西瓜？',
        ' 输入为一个整数 w(1≤ w ≤5×1010)，表示西瓜的重量。', ' 如果西瓜的重量能被分为两个偶数，输出\"Yes\"，否则输出\"No\"。', '8', 'Yes', '110');
INSERT INTO `t_problem_description`
VALUES ('65554835940',
        ' 村里刚刚通网，小芳非常激动，下载了很多文件。她的网络使用情况如下： 在最开始的 T1 分钟内，下载速度是 D1 MB/min；接下来的 T2 分钟内，下载速度是 D2 MB/min；以此类推，最后 TN 分钟内，下载速度是 DN MB/min。 互联网运营商的收费标准是，先免费提供 K 分钟的网络使用，之后每 MB 数据收取 1 元费用。请你算出小芳需要付多少网费。',
        '输入数据的第一行包含一个整数 T，表示测试数据的组数。接下来是 T 组数据。 每组数据的第一行包含两个整数 N 和 K。接下来 N 行，每行包含两个整数 Ti 和 Di，描述了小芳的网络使用状况。',
        '对于每组数据，输出一行，包含一个整数，代表小芳需要付的网费，单位为元', '3\n2 2\n2 1\n2 3\n2 2\n1 2\n2 3\n3 0\n1 2\n2 4\n10 10', '6\n3\n110',
        '85');
INSERT INTO `t_problem_description`
VALUES ('67187139811',
        '创建一个Point类，表示二维平面上的一个点，包含私有数据成员x坐标和y坐标。请参考已有代码及注释，补充代码，完成以下任务。【注意系统库中存在POINT类，所以类名请注意区分】\n\n（1）成员函数：setPoint函数，从键盘输入，设置点的x坐标和y坐标\n\n（2）成员函数：getX函数，getY函数，分别获得该点的x坐标和y坐标\n\n（3）成员函数：myDistance函数，可调用sqrt()函数，计算并输出两个点之间的距离【库函数中存在distance函数，所以改名，避免冲突】',
        '输入包括两行，每行包含两个整数，分别表示点的横坐标和纵坐标', '输出包括一行，只有一个实数，即两个点之间的距离，保留三位小数。', '0 0\n1 1', '1.414', '23');
INSERT INTO `t_problem_description`
VALUES ('67342581837',
        '有人建造了一些机器人，并且将他们放置在包含n个单元的一维网格上，一个长度为n的字符串s代表了他们的编排方式，字符串中的字符既可以是\'.\'，也可以是\'0\'~\'9\'之间的一个数字字符，字符\'.\'表示开始时在相应的单元上无机器人，数字表示开始时在相应的单元上有一个机器人。特别地，数字x表示他可以从开始点向左移动x个单元，或从开始点向右移动x个单元，每次移动距离为一个单元格。\n\n       例如，假定字符串的第7个字符为3，代表机器人从第7个单元开始，他的活动范围为第4个单元（7-3=4）到第10个单元（7+3=10）(包含两个端点），机器人仅仅可以在这个范围内移动，但不可以移出网格。一旦达到范围边界，机器人会折返。\n\n       在此范围内，开始时机器人可以在任意时间按照任意方向移动，但如果两个机器人可能同时到达同一单元格时， 就会发生碰撞。 \n\n       请判断，机器人的编排方式是否安全。 ',
        '第一行为一个整数T，代表测试数据的组数，接下来T行，每行为一个测试字符串s。', '对于每个测试用例，输出一行为\"safe\"或\"unsafe\"(无引号）。',
        '4\n....\n.2.....\n.2...2..\n1.1.1.', 'safe\nsafe\nunsafe\nunsafe', '68');
INSERT INTO `t_problem_description`
VALUES ('67829500318',
        '请编写一个程序，玩家从键盘输入猜测数字，程序根据猜测数字进行反馈，每次游戏玩家可猜测五次，猜测正确或超过五次，程序自动结束。玩家猜测错误且数值太高时输出\"Wrong! Too high!\"，太低时输出\"Wrong! Too low!\"，正确时输出\"Right!\"，正确的数字为35.',
        '每次输入一个1-100的整型数字', '提示字符串', '13\n14\n15\n19\n45',
        'Wrong! Too low!\nWrong! Too low!\nWrong! Too low!\nWrong! Too low!\nWrong! Too high!', '53');
INSERT INTO `t_problem_description`
VALUES ('67998097432',
        ' 这是一个军事阵地，为具有 n × m 个分块单元的方形区域，每个单元既可以是空（用“.”表示），或者可以被墙（用“*”表示）占用。\n\n       有一颗炸弹，如果将其放在单元 (x, y)上，引爆后将摧毁 x 行和 y 列上所有的墙。\n\n       请确定放置并引爆一颗炸弹是否可以摧毁所有的墙，其中炸弹可以放置在空的单元，也可以放置在被墙占用的单元。',
        '输入的第一行一个整数 T，表示测试用例数。\n\n       对于每个测试用例，输入的第一行包含两个整数 n 和 m (1 ≤ n, m ≤ 1000)，表示区域的行数和列数。\n\n       接下来的 n 行，每行包含 m 个符号 \".\" 或  \"*\"，表示区域上第 i 行第 j 列上的符号。',
        '输出有 T 行，每行对应一个测试用例的结果，如果不可能摧毁所有的墙，则输出\"NO\"，否则输出\"YES\"。', '2\n3 4\n.*..\n....\n.*..\n3 3\n..*\n.*.\n*..',
        'YES\nNO', '63');
INSERT INTO `t_problem_description`
VALUES ('68204119847',
        '根据以下函数关系，对输入的每个x值，求y值。函数关系：\n（1）y=x*(x+2)   2<x<=10\n（2）y=2*x         -1<x<=2\n（3）y=x-1         x<=-1\n\n',
        '输入一个小数x。', '输出对应的y值（6位小数）', '1', '2', '91');
INSERT INTO `t_problem_description`
VALUES ('69030923833',
        'Bessie和其他的所有奶牛的耳朵上都戴有一个射频识别（RFID，不能使用英文缩略词）序列号码牌。因此FJ可以机\n械化地计算他们的数量。很多奶牛有一个“牛友”：一只奶牛的牛友的序列号刚好等于奶牛自己的序列号的所有约\n数之和。在这里，一个数的“约数”不包括这个数本身。因为一些奶牛的号码约数和大于其他任何奶牛的号码，所\n以这些奶牛没有牛友。一些奶牛有一个“非常好友”。当两个奶牛互为“牛友”时，他们就是一对“非常好友”。\n注意在这道题中，忽略那些自己是自己的“非常好友”的情况。给定一个序列号S (6 <= S <= 18,000)，找到序列\n号不小于S的第一只有“非常好友”的奶牛。比如说，考虑序列号220，它的约数是1, 2, 4, 5, 10, 11, 20, 22, \n44, 55, 和110。和是284。类似的，284的约数是1, 2, 4, 71, 和142。他们的和是220',
        '第1行: 一个单独的整数: S ', '第1行: 单独一行，包含2个由空格隔开的整数。第一个整数表示第一个序列号不小于S的有非常好友的奶牛，第\n二个整数是他的好友的序列号。', '206', '220 284',
        '83');
INSERT INTO `t_problem_description`
VALUES ('71041088581', '给定一个整数表示考试成绩，判断并输出该成绩属于哪一类。设90分及以上 为“A”，80分至89分为“B”，70分至79分为“C”，60分至69分 为“D”，60分以下为“E”。',
        '输入一个整数成绩。', '输出一个字符，表示成绩的等级（大写字母）。', '59', 'E', '98');
INSERT INTO `t_problem_description`
VALUES ('71795287893',
        '可以将一个杠杆描述为一个字符串，将字符串的长度表示为|s|，那么杠杆看起来很像具有一个支点的水平棒，可以看成是在OX轴上的点0到|s-1|之间的一段。\n\n       杠杆描述的解码如下：\n\n如果字符串的第 i 个字符为“^”，意指在坐标 i 的位置水平棒下是支点\n\n如果字符串的第 i 个字符为“=”，意指在坐标 i 的位置水平棒上面没有任何内容\n\n如果字符串的第 i 个字符为c(1-9)，意指在坐标 i 的位置上的水平棒上有一个质量为c的重量\n\n        给出杠杆的描述，输出它平衡与否。忽略杠杆本身的重量，假设最初它是平衡的，所有的重量都同时施加在上面，杠杆要么向左倾斜，要么向右倾斜，要么处于平衡状态。',
        '输入的第一行为一个正整数T，表示有多组测试用例\n\n       接下来T行，每行对应一个测试用例，输入为一个非空字符串s(3 ≤|s| ≤106)，由数字1-9以及字符“^”和“=”组成，输入保证这行有且只有一个“^”字符，输入保证字符“^”不在字符串的两端。',
        '输出有T行，每行对应一个测试用例，如果杠杆向左倾斜，输出“left”，向右倾斜，输出“right”，否则输出“balance”。', '2\n9===^==1\n41^52==', 'left\nbalance',
        '65');
INSERT INTO `t_problem_description`
VALUES ('73214411936', '  给定 n (1 ≤ n ≤ 24)个正整数a1、a2、...、an，请判断这 n 个数是否是连续 n 个月份的天数，这些月份可以跨年度。',
        '输入第一行为一个整数 n，第二行为n个正整数 a1、a2、...、an(28 ≤ ai ≤ 31)。', '输出Yes或No。', '4\n31 31 30 31', 'Yes', '78');
INSERT INTO `t_problem_description`
VALUES ('74038821974', '输入年份和月份，输出该月份的天数。', '输入一行，两个整数，分别为年份和月份。', '一个整数，表示该月份的天数', '2018 3', '31', '99');
INSERT INTO `t_problem_description`
VALUES ('75623469698',
        '1. 编写三个类\nDog类和Cat类继承Animal类；\nDog类、Cat类、Animal类各有一个默认构造函数，分别输出字符串“Dog”、“Cat”和“Animal”。输出字符串后换行。注意三个字符串的首字母都是大写。\n在 Animal 类中定义纯虚函数 speak()；\n在 Dog 和 Cat类中覆写基类的 speak() 函数。Dog类的speak函数输出字符串“wang”之后换行；Cat类的speak函数输出字符串“miao”之后换行。注意字符串“wang”和“miao”都是小写字母\n上述三个类中如果有任何其它函数，则这些函数不直接或者间接输出任何信息\n2. 编写主函数\n在主函数中接受用户输入的一个整数N（大于0）；\n创建一个vector对象v （你可以用其它名字），存储Animal对象的指针。\n按照先创建一个 Dog 对象，紧接着再创建一个 Cat 对象这样交替创建的次序，一共创建 N 个 Dog对象和N个 Cat 对象；将这些Dog对象和Cat对象的指针按照创建的次序都存入v中。（提示：可以使用vector::push_back()函数）。\n将存入v中的对象，按照先后次序，逐个调用 speak() 函数，然后用 delete 显式销毁。（注意：每调用一个对象的 speak() 之后，就立即用 delete 销毁该对象）。\n程序中除了接受用户输入的整数之外，没有任何其它输入语句；\n程序中除了构造函数和speak()的输出之外，没有任何其它输出。',
        '一个大于零的整数', '输出多行信息，最后一行是空行', '2',
        'Animal\n\nDog\n\nAnimal\n\nCat\n\nAnimal\n\nDog\n\nAnimal\n\nCat\n\nwang\n\nmiao\n\nwang\n\nmiao', '2');
INSERT INTO `t_problem_description`
VALUES ('76651591270',
        '编写一个名为Person的类，使其表示人员的姓名和住址（使用string对象存放这些元素）。为你的Person类添加正确的构造函数，并提供操作使其能够返回姓名和住址，最后显示打印姓名和住址。（后两个操作均由成员函数实现）\n\ninclude<iostream>\nusing namespace std;\n/*你的代码将被嵌入到这里*/ \nint main() {\n     std::string name, address;\n     std::cin >> name >> address;\n     Person p(name, address); //使用构造函数进行初始化\n    p.display(); //显示打印姓名和住址\n    return 0;\n }\n（练习时请复制上述已有代码）',
        '第一行输入姓名。\n\n第二行输入地址。', '第一行输出Name:姓名\n\n第二行输出Address:地址', '无', '无', '12');
INSERT INTO `t_problem_description`
VALUES ('79016420488',
        '#include <iostream>\n#include <string>\nusing namespace std;\nclass Base {\npublic:\n int k;\n Base(int n):k(n) { }\n};\nclass Big\n{\npublic:\n int v;\n Base b;\n// 在此处补充你的代码\n};\nint main()\n{\n int n;\n while(cin >>n) {\n  Big a1(n);\n  Big a2 = a1;\n  cout << a1.v << \",\" << a1.b.k << endl;\n  cout << a2.v << \",\" << a2.b.k << endl;\n }\n}\n（练习时请复制上述代码）\n',
        '多组数据，每组一行，是一个整数', '对每组数据，输出两行，每行把输入的整数打印两遍', '3\n4', '3,3\n3,3\n4,4\n4,4', '28');
INSERT INTO `t_problem_description`
VALUES ('79474888060', '输入一个整数，判断其能否被3、5、7整除，若：\n\n（1）能同时被3,5,7整除，则输出It\'s divisible by 3, 5,
        7；\n\n（2）能被其中两数（要指出哪两个）整除（如能被3, 7整除），则输出It\'s divisible by 3,7；\n\n（3）能被其中一个数（要指出哪一个）整除（如能被3整除），则输出It\' s
        divisible by 3；\n\n（4）不能被3, 5, 7任一个整除，则输出null。', ' 输入一个整数n。', ' 输出一个判断信息，表示答案。', ' 30 ', ' It\'s divisible by 3,5',
        '92');
INSERT INTO `t_problem_description`
VALUES ('79912704793', '利用公式 C = 5*(F-32)/9(其中C表示摄氏温度，F表示华氏温度)进行计算转化,输入华氏温度F，输出摄氏温度C，要求精确到小数点后5位。',
        '输入一行，包含一个实数F，表示华氏温度。（F >= -459.67）', '输出一行，包含一个实数，表示对应的摄氏温度，要求精确到小数点后5位。', '41', '5', '104');
INSERT INTO `t_problem_description`
VALUES ('81245375911',
        '1. 编写两个类\nDog类继承Animal类；Animal类和Dog类各有一个默认构造函数，分别输出字符串 “Animal”和“Dog”。输出字符串后换行\n2. 编写主函数\n在主函数中接受用户输入的一个整数N（大于0）；\n按照先创建一个 Animal 对象，紧接着再创建一个 Dog 对象这样交替创建的次序，一共创建 N 个 Animal对象和Dog对象\n程序中除了接受用户输入的整数之外，没有任何其它输入语句；\n程序中除了构造函数的输出之外，没有任何其它输出。',
        '一个大于零的整数', '输出多行信息，最后一行是空行', '2', 'Animal\n\nAnimal\n\nDog\n\nAnimal\n\nAnimal\n\nDog', '1');
INSERT INTO `t_problem_description`
VALUES ('83634356877',
        '运算符sizeof()通常用于求指定数据类型或者变量的字节数，请输出短整型、整型、长整型、长长整型、单精度浮点、双精度浮点、长双精度浮点、字符类型的字节数。\n其含义为如果sizeof(int)的结果为4，则所有声明的数据类型为int的变量，在存储时均占用4bytes，理解内存字节数非常重要，请大家记住。\n',
        ' 无', '字节数', '无', '2\n4\n4\n8\n4\n8\n16\n1', '105');
INSERT INTO `t_problem_description`
VALUES ('84044209749',
        '  小希最近找到了大公司的客户经理的新工作，每天工作时间为 L 分钟，他主要为 n 个固定的高端客人服务，第 i 个客人会在第 ti 分钟到来，他需要为其服务 li 分钟，在此期间不会有其他客人到来。\n\n       他喜欢在工作的间隙放松一下，喝杯咖啡，或者做做简单的运动，每次需要 a 分钟的时间，如果可以，这样惬意的事情他能够连续做好多次。但在有顾客的时间里，他必须在工作岗位上，否则，他会被投诉。那么，在一天的工作时间之内，他最多有几次这样轻松的时光？',
        '  输入的第一行包含3个整数 n、L 和 a。\n\n       接下来的 n 行，每行两个整数 ti  和 li，分别表示第i个客人到来的时间和需要服务的时间，输入保证 ti+li ≤ ti+1',
        '输出为一个整数，表示小希在一天的工作时间内最多可以放松多少次？', '2 11 3\n0 1\n1 1', '3', '79');
INSERT INTO `t_problem_description`
VALUES ('86296422526',
        '有 n 只青蛙位于坐标轴 OX 上，对于每只青蛙，有两个已知值 xi、ti，表示第 i 只青蛙在坐标的位置（各不相同）以及它的舌头的长度。同样有 m 只蚊子一只接一只的落到坐标轴上，对于每只蚊子，有两个已知值， pj 表示第 j 只蚊子所在的位置，bj 为第 j 只蚊子的重量。青蛙和蚊子表示为坐标上的点。\n\n       如果蚊子和青蛙在同一位置或者在右边，青蛙可以吃掉蚊子，它们之间的距离不超过青蛙舌头的长度。\n\n       如果有几只青蛙都能在某一时刻吃到一只蚊子，最左边的青蛙就会吃掉它（最小的 xi）。吃完蚊子后，青蛙的舌头将增加蚊子重量的长度，在之后，青蛙又能够吃其他蚊子(在舌头长度增加之后)。 \n\n       在所有蚊子落下以及青蛙吃掉所有可能的蚊子之后，对于每个青蛙，输出两个值，即吃蚊子的数量以及舌头的长度。\n\n       每只蚊子只有在青蛙吃完之前所有可能的蚊子之后才会落到坐标上，蚊子的值是按其落到坐标轴上的顺序给出的。 ',
        '输入的第一行为两个整数(1 ≤ n，m ≤ 2*105），表示青蛙和蚊子的数量。\n\n       接下来的 n 行，每行两个整数 xi、ti（0 ≤ xi、ti ≤ 109），表示第 i 只青蛙所在的位置以及它的舌头的初始长度，输入保证所有的 xi 互不相同。\n\n       接下来的 m 行，每行两个整数 pj、bj（0 ≤ pj、bj ≤ 109），表示第 j 只蚊子落下的位置以及它的重量。',
        '输出为 n 行，第 i 行包含另两个整数值 ci、li，表示被第 i 只青蛙吃掉的蚊子数量以及最终的青蛙的舌头长度。',
        '4 6\n10 2\n15 0\n6 1\n0 1\n110 10\n1 1\n6 0\n15 10\n14 100\n12 2', '3 114\n1 10\n1 1\n1 2', '35');
INSERT INTO `t_problem_description`
VALUES ('89280654606',
        '#include <iostream>\nusing namespace std;\nclass A {\npublic:\n int val;\n\n A(int\n// 在此处补充你的代码\n};\nint main()\n{\n int m,n;\n A a;\n cout << a.val << endl;\n while(cin >> m >> n) {\n  a.GetObj() = m;\n  cout << a.val << endl;\n  a.GetObj() = A(n);\n  cout << a.val<< endl;\n }\n return 0;\n}\n（练习时请复制上述代码）\n',
        '多组数据，每组一行，是整数 m 和 n', '先输出一行：\n123\n然后，对每组数据，输出两行，第一行是m,第二行是n', '2 3\n4 5', '123\n2\n3\n4\n5 ', '27');
INSERT INTO `t_problem_description`
VALUES ('89463787825',
        '给你两个字符串 word1 和 word2 。请你从 word1 开始，通过交替添加字母来合并字符串。如果一个字符串比另一个字符串长，就将多出来的字母追加到合并后字符串的末尾。\n\n返回 合并后的字符串 。',
        '字符串', '字符串', 'word1 = \"abc\", word2 = \"pqr\"', '\"apbqcr\"', '44');
INSERT INTO `t_problem_description`
VALUES ('90054734502',
        '从一个整数开始，比如：6593。将这个整数中的各位数字全部取出，如果为0，则忽略，将他们相乘，\n得到一个新的整数，上面的例子就是6*5*9*3=810，然后继续做下去，8*1得到了一个个位数8。\n读入一个数并计算出得到一个个位数的过程。',
        '一个整数n', '在单独的一行中按顺序输出游戏过程中产生的每一个数直到一个个位数结束。', '98886', '98886 27648 2688 768 336 54 20 2', '82');
INSERT INTO `t_problem_description`
VALUES ('90606142449',
        '湖南大学正在举办一场重要的国际学术会议，出席会议的 n 位科学家来自不同的国家，每位科学家都只熟悉一种语言，为方便起见，世界上所有的语言用1~1000的数字编号来列出。\n\n       晚上，主办方安排所有科学家去看电影，电影院里有 m 部电影，每部电影可以用两个不同的整数来描述，即音频语言和字幕语言的编号。看电影的科学家，如果他熟悉电影的音频语言，他会非常高兴，如果他熟悉字幕的语言，他基本上满意，如果他两种都不熟悉，他会感到不满意(请注意，每部电影的音频语言和字幕语言总是不同的)。 \n\n       科学家们决定一起去看同一部电影。你必须帮助他们选择电影，使得非常高兴的科学家的数量是最大的，如果有多部这样的电影，在其中选择能使基本满意的科学家的数量最大，如果还有多部，则全部输出。如果没有这样的电影，则输出\"unsatisfied\"。',
        '输入的第一行为一个正整数 n (1 ≤ n ≤ 200000)  ，表示科学家的数量。\n\n       第二行为 n 个正整数a1、a2、...、an (1 ≤ ai ≤ 1000)，其中ai 表示第 i 位科学家熟悉的语言编号。\n\n       第三行包含一个正整数m(1 ≤ m ≤ 200000)，表示电影院里的电影数量，编号从1~m。\n\n       第四行包含 m 个正整数 b1, b2, ..., bm (1 ≤ bj ≤ 1000)，其中 bj 表示第  j 部电影的音频语言。\n\n        第五行包含 m 个正整数 c1, c2, ..., cm (1 ≤ cj ≤ 1000)，其中 cj 表示第  j 部电影的字幕语言。\n\n         输入保证 bj ≠ cj  。',
        '输出为若干整数，从小到大，表示科学家们可以去选择去看的电影的编号。如果没有这样的电影，则输出\"unsatisfied\"。', '3\n2 3 2\n2\n3 2\n2 3', '2', '34');
INSERT INTO `t_problem_description`
VALUES ('91297673363',
        '一头大象决定去看朋友，大象住在直线坐标0的位置，而它的朋友则住在直线坐标x（1≤|x|≤106）的位置，大象每走一步可以跨越1、3、5、...、2m-1中的任何一个数字位置，其中1≤m≤106，那么大象到达朋友处最少需要走多少步？',
        '输入为一行两个整数x、m，x表示大象朋友所住的位置，m为一个整数。', '  输出为一个整数，表示大象到达朋友处最少需要的步数。', '5 3', '1', '87');
INSERT INTO `t_problem_description`
VALUES ('92391178722', '实现Point类对象与整数加法,实现两个Point类对象的加法', '输入四个数字', '第一行 实现两个Point类对象的加法\n第二行 实现Point类对象与整数2的加法',
        '1 2 3 4', '4 6\n6 8', '6');
INSERT INTO `t_problem_description`
VALUES ('92502920480',
        '众所周知中国医药已经十三天十个涨停板，小明因为只吃了3个涨停板而感到懊恼不已，现在你站在上帝的未来视角，拥有批量的数据。假设一个股票前一段的涨跌幅和你拥有数据的一部分一样，那么接下来的涨跌幅就会和你知道的数据一样。现在小明想知道自己这支股票该怎么操作，你能帮帮他吗?\n注：\n（1） 所有数据都是从同一天开始，小明的所有股票也都是这一天买入的。因为DH不想持有太久，如果利润相同的情况下告诉他更早的那一天卖出。\n（2） 股票的价格四舍五入到小数点后第二位。',
        '第一行输入一个整数n(1 ≤n ≤100)代表你有n个股票数据。\n接下来n行数据，每一行的第一个输入一个浮点数wi(1≤wi≤ 10000)代表股票的初始价格，第二个输入一个整数ki(1≤ki≤100)代表股票涨幅数据的天数。接下来ki个数字aj(-20≤aj≤20)代表第j天该股票的涨幅。\n第n＋2行包含一个数字q(1≤ q≤ 100)，代表有q次询问。\n接下来q行数据，每一行数据第一个整数vi(1≤vi≤100)代表有vi天的数据，接下来vi个数字bj(-20≤bj≤20)代表第j天该股票的涨幅。\n注: wi, aj和bj是小数点后不超过两位的浮点数。',
        '对于每一次询问输出一行，如果可以继续持有则输出应该持有的天数，如果应该立即卖出则输出-1，如果你不知道该怎么办(没有类似数据或者能找到多个相同的股票数据)输出-2',
        '2\n1.5 6 1 1 1 0 1 0\n9.5 6 1 1 1 0 -1 1\n3\n5 1 1 1 0 1\n4 1 1 1 0\n5 1 1 1 0 -1\n', '-1\n-2\n1\n\n', '11');
INSERT INTO `t_problem_description`
VALUES ('93696897257', '设计圆类，并以圆类为基类，派生圆柱类、圆锥类和圆球类（分别求出其面积和体积）', '无', '分别输出对应的面积体积', '无',
        '创建一个圆对象\n半径 ：2.0\n面积 ：12.5664\n\n创建一个圆柱对象\n半径 ：2.0\n高度 ：3.0\n面积 ：62.8319\n体积 ：37.6991\n\n创建一个圆锥对象\n半径 ：2.0\n高度 ：3.0\n面积 ：35.2207\n体积 ：12.5664\n\n创建一个球对象\n半径 ：2.0\n面积 ：50.2655\n体积 ：33.5103',
        '5');
INSERT INTO `t_problem_description`
VALUES ('94245034554', '从键盘输入一个长度不超过200的字符串，将该字符串反转后输出。', '输入为一行一个字符串', '输出反转后的字符串', 'student', 'tneduts', '41');
INSERT INTO `t_problem_description`
VALUES ('94347222613',
        '使用函数统计指定数字的个数：读入一个大整数number和一个数字x，统计并输出大整数number中数字x（个位数）出现的个数。要求定义并调用函数  count(number, x)，它的功能是统计大整数number中数字x的个数。例如， count(12292,2)的返回值是 3。试编写相应程序。',
        '一行两个数据，即number和x，以空格分隔，number的数位长度小于30。', 'number中x的个数', '12292 2', '3', '52');
INSERT INTO `t_problem_description`
VALUES ('95017822558',
        '现给出高风险地区的左上角顶点坐标和右下角顶点坐标，请统计随后输入的 N 个坐标中，有几个点落在了高风险区域内。\n\n（1）从键盘输入高风险地区的左上角顶点坐标和右下角顶点坐标，分别用空格间隔四个整数。\n\n（2）接下来，从键盘输入 N 和2×N 个整数，分别表示这 N 个点的 X 和 Y 坐标\n\n（3）统计并落在高风险区域内的坐标个数（坐标在分界线上，也算区域内）。\n\n（4）所有坐标均为整数，且 N ≥1，且 N ≤100000。',
        '输入包括三行。第一行有四个整数，前四个整数分别表示高风险区域的左上顶点坐标和右下角顶点坐标；第二行为整数 N ；第三行为2×N 个整数，表示 N 个点的 X 和 Y 坐标；整数之间以单个空格分隔。',
        '输出只有一行，包含1个整数，即落在高风险区域内的坐标个数，若不存在，则输出0。', '0 3 4 1\n3\n0 0 2 1 3 2', '2', '38');
INSERT INTO `t_problem_description`
VALUES ('95554758518', '从键盘输入两个正整数，求他们的最大公约数和最小公倍数。', '输入为一行，两个正整数', '输入为一行，表示这两个正整数的最大公约数和最小公倍数', '15 125', '5 375',
        '51');
INSERT INTO `t_problem_description`
VALUES ('96755229314',
        '#include <iostream>\nusing namespace std;\n\nstruct A\n{\n int v;\n A(int vv):v(vv) { }\n// 在此处补充你的代码\n};\n\nint main()\n{\n const A a(10);  //常量对象可以使用常量成员函数\n const A * p = a.getPointer(); //常变量——常变量函数 \n cout << p->v << endl;\n return 0;\n}\n（练习时请复制上述代码）\n',
        '无', '无', '无', '10', '29');
INSERT INTO `t_problem_description`
VALUES ('97659223388',
        '给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。\n\n不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。\n\n元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。',
        '一个数组和一个值', '一个数组', 'nums = [3,2,2,3], val = 3', '2, nums = [2,2]', '47');
INSERT INTO `t_problem_description`
VALUES ('98947880904',
        '给定两个字符串s和t，每一次处理将从两个字符串中任选一个，删除第一个字符（也就是最左边字符），显然删除后字符串的长度减1，当然不能再从一个空字符串中去删除。\n\n       例如：\n\n           对字符串\"where\"处理后，结果为\"here\"；对字符串\"a\"处理后，结果为\"\"。\n\n       我们需要在经过最少次数的处理后，使得两个字符串相等。当然，经过处理后，两个字符串都可能为空串，这也是相等的，在这种情况下，答案很显然是两个字符串最开始时的长度之和。\n\n       编程求能使得两个字符串相等的需要处理的最小次数。',
        '输入为两行，分别为需要进行处理的两个字符串s和t，两个字符串均有小写字母组成。', '输出需要处理的最小次数。', 'test\nwest', '2', '67');
INSERT INTO `t_problem_description`
VALUES ('99052056023',
        '维亚是一家音乐俱乐部里的音乐DJ，在工作中经常使用Dubstep(回响贝斯)音乐。最近，他决定拿出几首老歌进行混音处理。\n\n       假定一首歌的歌词是一句英文句子，为了将Dubstep混录到歌曲里，维亚将一定数量（可以为0）的“WUB”插入到歌词的第一个单词之前、最后一个单词之后（可以为0）、以及两个单词之间（在相邻的一对单词之间至少一个），然后他将所有的单词包括“WUB”合并在一起形成一个混音字符串，在俱乐部里播放。\n\n       例如，歌词\"I AM X\"可以转换为回响贝斯混音“WUBWUBIWUBAMWUBWUBX”，但不能转换为“WUBWUBIAMWUBX”。\n\n       有人突发奇想，在听过维亚播放过的混音之后，尝试恢复原始的歌曲，请你帮助他。',
        '输入为一行非空字符串，由英文字母组成，长度不超过200个字符。表示这是经过混音之后的歌词，输入保证在混入“WUB”之前，原始歌词中不包括“WUB”，且歌词至少包含一个单词。', '输出为一行一个字符串，表示原始的歌词。',
        'WUBWEWUBAREWUBWUBTHEWUBCHAMPIONSWUBMYWUBFRIENDWUB', 'WE ARE THE CHAMPIONS MY FRIEND', '66');
INSERT INTO `t_problem_description`
VALUES ('99124519241', '输入一批正整数（以零或负数为结束标志），求其中的奇数的和（保证和不会超过int类型范围）。要求定义和调用函数even(n)判断数的奇偶性，当n为偶数时返回1，否则返回0。',
        '一批以零或负数为结束标志的正整数', '输入数据中奇数的和', '50 421 84 6 111 0', '532', '59');
INSERT INTO `t_problem_description`
VALUES ('99604368226', '输入3组坐标，按指定格式输出', '(x1,y1),(x2,y2),(x3,y3)', '[x1,y1]\n\n[x2,y2]\n\n[x3,y3]',
        '(1,1),(2,3),(4,5)', '[1,1]\n\n[2,3]\n\n[4,5]', '100');

-- ----------------------------
-- Table structure for t_recommend_problem
-- ----------------------------
DROP TABLE IF EXISTS `t_recommend_problem`;
CREATE TABLE `t_recommend_problem`
(
    `pk_recommend_problem_id` bigint                                                       NOT NULL,
    `student_id`              char(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci    NOT NULL,
    `problem_id`              varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`pk_recommend_problem_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_recommend_problem
-- ----------------------------

-- ----------------------------
-- Table structure for t_student
-- ----------------------------
DROP TABLE IF EXISTS `t_student`;
CREATE TABLE `t_student`
(
    `pk_student_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `id`            char(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `name`          varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `password`      varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `phone`         char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `email`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `deleted`       int NULL DEFAULT NULL,
    `class_id`      char(6) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci      NOT NULL,
    PRIMARY KEY (`pk_student_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_student
-- ----------------------------
INSERT INTO `t_student`
VALUES ('1594983270657986561', '123456', 'ljj', '123456', '13974799812', '1499489512@qq.com', 0, '260102');
INSERT INTO `t_student`
VALUES ('1594983730374676482', '1234', 'zj', '12345', '13941898177', '1499489512@qq.con', 1, '未分配');
INSERT INTO `t_student`
VALUES ('1594984265819525122', '123', 'zj', '123', '13913415511', '1499489512@qq.com', 1, '未分配');
INSERT INTO `t_student`
VALUES ('324441', '201810040106', '鞠方茂', '123456', '75551285662', 'zhiyuandai@icloud.com', 0, '080301');
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
    `pk_teacher_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `id`            varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `name`          varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `password`      varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `phone`         char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `email`         varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    `deleted`       int                                                           NOT NULL,
    PRIMARY KEY (`pk_teacher_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_teacher
-- ----------------------------
INSERT INTO `t_teacher`
VALUES ('1592029535656873986', 't1', '教师1', '123456', '13288888888', '1499489512@qq.com', 0);
INSERT INTO `t_teacher`
VALUES ('1594281977610121218', '202026010513', 'xxx', '123321123', '3424123414', 'xxx@11111.com', 0);
INSERT INTO `t_teacher`
VALUES ('1594282764524466177', '202026010512', 'xxx', '123321123', '3424123414', 'xxx@11111.com', 0);
INSERT INTO `t_teacher`
VALUES ('31242345235235423', 't23', '老师', '123456', '18888888888', 'aaa@gmail.com', 0);

-- ----------------------------
-- Table structure for t_tutor
-- ----------------------------
DROP TABLE IF EXISTS `t_tutor`;
CREATE TABLE `t_tutor`
(
    `pk_tutor_id` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `id`          varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `name`        varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `password`    varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci  NOT NULL,
    `phone`       char(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci     NOT NULL,
    `email`       varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
    PRIMARY KEY (`pk_tutor_id`) USING BTREE,
    UNIQUE INDEX `id`(`id` ASC) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of t_tutor
-- ----------------------------
INSERT INTO `t_tutor`
VALUES ('1598959803609366530', 't123456', 'ljl', '123456', '13222211111', '1499489512@qq.com');

SET
FOREIGN_KEY_CHECKS = 1;
