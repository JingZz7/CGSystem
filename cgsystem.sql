SET FOREIGN_KEY_CHECKS = 0;
DROP TABLE IF EXISTS `t_student`;
DROP TABLE IF EXISTS `t_class`;
DROP TABLE IF EXISTS `t_teacher`;
DROP TABLE IF EXISTS `t_tutor`;
DROP TABLE IF EXISTS `t_administrator`;
DROP TABLE IF EXISTS `t_knowledge_point`;
DROP TABLE IF EXISTS `t_problem`;
DROP TABLE IF EXISTS `t_problem_description`;
DROP TABLE IF EXISTS `t_favorite`;
DROP TABLE IF EXISTS `t_recommend_problem`;
DROP TABLE IF EXISTS `t_comment_student`;
DROP TABLE IF EXISTS `t_model_input`;
DROP TABLE IF EXISTS `t_model_output`;
DROP TABLE IF EXISTS `t_comment_teacher`;
DROP TABLE IF EXISTS `t_model_output_knowledge`;
DROP TABLE IF EXISTS `t_model_output_score`;
SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE `t_student` (
    `pk_student_id` BIGINT NOT NULL,
    `id` CHAR(12) NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `phone` CHAR(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `class_id` CHAR(6) NOT NULL,
    PRIMARY KEY (`pk_student_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_class` (
    `pk_class_id` BIGINT NOT NULL,
    `id` CHAR(6) NOT NULL,
    `name` VARCHAR(8) NOT NULL,
    PRIMARY KEY (`pk_class_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_teacher` (
    `pk_teacher_id` BIGINT NOT NULL,
    `id` VARCHAR(16) NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `phone` CHAR(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`pk_teacher_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_tutor` (
    `pk_tutor_id` BIGINT NOT NULL,
    `id` VARCHAR(16) NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `phone` CHAR(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`pk_tutor_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_administrator` (
    `pk_administrator_id` BIGINT NOT NULL,
    `id` VARCHAR(16) NOT NULL,
    `name` VARCHAR(10) NOT NULL,
    `password` VARCHAR(16) NOT NULL,
    `phone` CHAR(11) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`pk_administrator_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_knowledge_point` (
    `pk_knowledge_point_id` BIGINT NOT NULL,
    `id` VARCHAR(10) NOT NULL,
    `name` VARCHAR(255) NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    PRIMARY KEY (`pk_knowledge_point_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_problem` (
    `pk_problem_id` BIGINT NOT NULL,
    `id` VARCHAR(10) NOT NULL,
    `knowledge_point_id` VARCHAR(10) NOT NULL,
    `name` VARCHAR(20) NOT NULL,
    `difficulty` CHAR(1) NOT NULL,
    `label` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`pk_problem_id`),
    UNIQUE (`id`)
);

CREATE TABLE `t_problem_description` (
    `pk_problem_description_id` BIGINT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `input_form` VARCHAR(255) NOT NULL,
    `output_form` VARCHAR(255) NOT NULL,
    `sample_input_1` VARCHAR(255) NOT NULL,
    `sample_output_1` VARCHAR(255) NOT NULL,
    `sample_input_2` VARCHAR(255) NOT NULL,
    `sample_output_2` VARCHAR(255) NOT NULL,
    `problem_id` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`pk_problem_description_id`)
);

CREATE TABLE `t_favorite` (
    `pk_favorite_id` BIGINT NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    `problem_id` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`pk_favorite_id`)
);

CREATE TABLE `t_recommend_problem` (
    `pk_recommend_problem_id` BIGINT NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    `problem_id` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`pk_recommend_problem_id`)
);

CREATE TABLE `t_comment_student` (
    `pk_comment_student_id` BIGINT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    `problem_id` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`pk_comment_student_id`)
);

CREATE TABLE `t_model_input` (
    `pk_model_input_id` BIGINT NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    `homework_chapter` VARCHAR(255) NOT NULL,
    `homework_score` DECIMAL NOT NULL,
    PRIMARY KEY (`pk_model_input_id`)
);

CREATE TABLE `t_comment_teacher` (
    `pk_comment_teacher_id` BIGINT NOT NULL,
    `description` VARCHAR(255) NOT NULL,
    `teacher_id` VARCHAR(16) NOT NULL,
    `problem_id` VARCHAR(10) NOT NULL,
    PRIMARY KEY (`pk_comment_teacher_id`)
);

CREATE TABLE `t_model_output_knowledge` (
    `pk_model_output_knowledge_id` BIGINT NOT NULL,
    `student_id` CHAR(12) NOT NULL,
    `knowledge_point_id` VARCHAR(10) NOT NULL,
    `forecast` DECIMAL NOT NULL,
    PRIMARY KEY (`pk_model_output_knowledge_id`)
);

CREATE TABLE `t_model_output_score` (
    `pk_model_output_score_id` BIGINT NOT NULL,
    `student_id` CHAR(6) NOT NULL,
    `exam_score` DECIMAL NOT NULL,
    PRIMARY KEY (`pk_model_output_score_id`)
);

ALTER TABLE `t_student` ADD FOREIGN KEY (`class_id`) REFERENCES `t_class`(`id`);
ALTER TABLE `t_knowledge_point` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_problem` ADD FOREIGN KEY (`knowledge_point_id`) REFERENCES `t_knowledge_point`(`id`);
ALTER TABLE `t_problem_description` ADD FOREIGN KEY (`problem_id`) REFERENCES `t_problem`(`id`);
ALTER TABLE `t_favorite` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_favorite` ADD FOREIGN KEY (`problem_id`) REFERENCES `t_problem`(`id`);
ALTER TABLE `t_recommend_problem` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_recommend_problem` ADD FOREIGN KEY (`problem_id`) REFERENCES `t_problem`(`id`);
ALTER TABLE `t_comment_student` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_comment_student` ADD FOREIGN KEY (`problem_id`) REFERENCES `t_problem`(`id`);
ALTER TABLE `t_model_input` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_comment_teacher` ADD FOREIGN KEY (`teacher_id`) REFERENCES `t_teacher`(`id`);
ALTER TABLE `t_comment_teacher` ADD FOREIGN KEY (`problem_id`) REFERENCES `t_problem`(`id`);
ALTER TABLE `t_model_output_knowledge` ADD FOREIGN KEY (`student_id`) REFERENCES `t_student`(`id`);
ALTER TABLE `t_model_output_knowledge` ADD FOREIGN KEY (`knowledge_point_id`) REFERENCES `t_knowledge_point`(`id`);
ALTER TABLE `t_model_output_score` ADD FOREIGN KEY (`student_id`) REFERENCES `t_class`(`id`);