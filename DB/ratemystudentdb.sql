-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema RateMyStudentDB
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `RateMyStudentDB` ;

-- -----------------------------------------------------
-- Schema RateMyStudentDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `RateMyStudentDB` DEFAULT CHARACTER SET utf8 ;
USE `RateMyStudentDB` ;

-- -----------------------------------------------------
-- Table `school`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `school` ;

CREATE TABLE IF NOT EXISTS `school` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `student` ;

CREATE TABLE IF NOT EXISTS `student` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `graduation_year` YEAR NULL,
  `school_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Student_School1_idx` (`school_id` ASC),
  CONSTRAINT `fk_Student_School1`
    FOREIGN KEY (`school_id`)
    REFERENCES `school` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `subject`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `subject` ;

CREATE TABLE IF NOT EXISTS `subject` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `teacher` ;

CREATE TABLE IF NOT EXISTS `teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(200) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `enabled` TINYINT NOT NULL DEFAULT 1,
  `role` VARCHAR(45) NOT NULL DEFAULT 'user',
  `school_id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NULL,
  `email` VARCHAR(100) NOT NULL,
  `subject_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  INDEX `fk_Teacher_School1_idx` (`school_id` ASC),
  INDEX `fk_Teacher_Subject1_idx` (`subject_id` ASC),
  CONSTRAINT `fk_Teacher_School1`
    FOREIGN KEY (`school_id`)
    REFERENCES `school` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_Subject1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review` ;

CREATE TABLE IF NOT EXISTS `review` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review_text` TEXT NOT NULL,
  `teacher_id` INT NOT NULL,
  `student_id` INT NOT NULL,
  `rating` INT(1) NULL,
  `subject_id` INT NOT NULL,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `title` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Review_Teacher1_idx` (`teacher_id` ASC),
  INDEX `fk_Review_Student1_idx` (`student_id` ASC),
  INDEX `fk_Review_Course1_idx` (`subject_id` ASC),
  CONSTRAINT `fk_Review_Teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Student1`
    FOREIGN KEY (`student_id`)
    REFERENCES `student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Course1`
    FOREIGN KEY (`subject_id`)
    REFERENCES `subject` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `comment`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `comment` ;

CREATE TABLE IF NOT EXISTS `comment` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `review_id` INT NOT NULL,
  `in_reply_to` INT NULL,
  `comment_text` TEXT NULL,
  `created_at` DATETIME NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_Comments_Review1_idx` (`review_id` ASC),
  INDEX `fk_Comments_Comments1_idx` (`in_reply_to` ASC),
  CONSTRAINT `fk_Comments_Review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Comments1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `badge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `badge` ;

CREATE TABLE IF NOT EXISTS `badge` (
  `id` INT NOT NULL,
  `name` VARCHAR(200) NOT NULL,
  `image` VARCHAR(200) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `review_badge`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `review_badge` ;

CREATE TABLE IF NOT EXISTS `review_badge` (
  `review_id` INT NOT NULL,
  `badge_id` INT NOT NULL,
  PRIMARY KEY (`review_id`, `badge_id`),
  INDEX `fk_Review_has_Badge_Badge1_idx` (`badge_id` ASC),
  INDEX `fk_Review_has_Badge_Review1_idx` (`review_id` ASC),
  CONSTRAINT `fk_Review_has_Badge_Review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_has_Badge_Badge1`
    FOREIGN KEY (`badge_id`)
    REFERENCES `badge` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE = '';
DROP USER IF EXISTS teacher@localhost;
SET SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
CREATE USER 'teacher'@'localhost' IDENTIFIED BY 'teacher';

GRANT SELECT, INSERT, TRIGGER, UPDATE, DELETE ON TABLE * TO 'teacher'@'localhost';

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `school`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `school` (`id`, `name`) VALUES (1, 'Skill Distillery');
INSERT INTO `school` (`id`, `name`) VALUES (2, 'Fairview Elementary');
INSERT INTO `school` (`id`, `name`) VALUES (3, 'Fox Mill Elementary');
INSERT INTO `school` (`id`, `name`) VALUES (4, 'School Of Rock');

COMMIT;


-- -----------------------------------------------------
-- Data for table `student`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (1, 'Allan', 'Meyer', 2027, 3);
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (2, 'Timmy', 'Turner', 2007, 1);
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (3, 'Johnny', 'Cochran', 1986, 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `subject` (`id`, `name`) VALUES (1, 'math');
INSERT INTO `subject` (`id`, `name`) VALUES (2, 'english');
INSERT INTO `subject` (`id`, `name`) VALUES (3, 'history');
INSERT INTO `subject` (`id`, `name`) VALUES (4, 'science');
INSERT INTO `subject` (`id`, `name`) VALUES (5, 'computer science');
INSERT INTO `subject` (`id`, `name`) VALUES (6, 'music');

COMMIT;


-- -----------------------------------------------------
-- Data for table `teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (1, 'teacher', 'teacher', 1, 'admin', 1, 'Jill', 'Valentine', 'JValentine@SkillDistillery.com', 5);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (2, 'Jblack', 'Jblack', 1, 'user', 4, 'Jack', 'Black', 'Jblack@SOR.com', 6);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (3, 'frizzle', 'frizzle', 1, 'user', 3, 'Mrs.', 'Frizzle', 'frizzle@magicschoolbus.edu', 4);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `review` (`id`, `review_text`, `teacher_id`, `student_id`, `rating`, `subject_id`, `created_at`, `title`) VALUES (1, 'This is a review!', 2, 3, 4, 6, DEFAULT, 'This is a Title');
INSERT INTO `review` (`id`, `review_text`, `teacher_id`, `student_id`, `rating`, `subject_id`, `created_at`, `title`) VALUES (2, 'This is a bad review!', 3, 1, 1, 4, DEFAULT, 'Title here!');

COMMIT;


-- -----------------------------------------------------
-- Data for table `comment`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `comment` (`id`, `review_id`, `in_reply_to`, `comment_text`, `created_at`) VALUES (1, 1, NULL, 'This is a comment', NULL);
INSERT INTO `comment` (`id`, `review_id`, `in_reply_to`, `comment_text`, `created_at`) VALUES (2, 1, 1, 'This is a comment on a comment.', NULL);
INSERT INTO `comment` (`id`, `review_id`, `in_reply_to`, `comment_text`, `created_at`) VALUES (3, 2, NULL, 'This is another comment', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `badge`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `badge` (`id`, `name`, `image`) VALUES (1, 'Hard Worker', NULL);
INSERT INTO `badge` (`id`, `name`, `image`) VALUES (2, 'Loud Mouth', NULL);
INSERT INTO `badge` (`id`, `name`, `image`) VALUES (3, 'Brown Noser', NULL);
INSERT INTO `badge` (`id`, `name`, `image`) VALUES (4, 'Helpful', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `review_badge`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `review_badge` (`review_id`, `badge_id`) VALUES (1, 1);
INSERT INTO `review_badge` (`review_id`, `badge_id`) VALUES (1, 4);
INSERT INTO `review_badge` (`review_id`, `badge_id`) VALUES (2, 2);
INSERT INTO `review_badge` (`review_id`, `badge_id`) VALUES (2, 3);

COMMIT;

