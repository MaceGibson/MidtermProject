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
  `school_id` INT NULL,
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
  `teacher_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comments_Review1_idx` (`review_id` ASC),
  INDEX `fk_Comments_Comments1_idx` (`in_reply_to` ASC),
  INDEX `fk_comment_teacher1_idx` (`teacher_id` ASC),
  CONSTRAINT `fk_Comments_Review1`
    FOREIGN KEY (`review_id`)
    REFERENCES `review` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comments_Comments1`
    FOREIGN KEY (`in_reply_to`)
    REFERENCES `comment` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_comment_teacher1`
    FOREIGN KEY (`teacher_id`)
    REFERENCES `teacher` (`id`)
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
INSERT INTO `school` (`id`, `name`) VALUES (1, 'Hogwarts School of Witchcraft and Wizardry');
INSERT INTO `school` (`id`, `name`) VALUES (2, 'Beauxbatons Academy of Magic');
INSERT INTO `school` (`id`, `name`) VALUES (3, 'Durmstrang Institute');

COMMIT;


-- -----------------------------------------------------
-- Data for table `student`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (1, 'Harry', 'Potter', 1998, 1);
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (2, 'Ron', 'Weasley', 1998, 1);
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (3, 'Hermoine', 'Granger', 1998, 1);
INSERT INTO `student` (`id`, `first_name`, `last_name`, `graduation_year`, `school_id`) VALUES (4, 'Draco', 'Malfoy', 1998, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `subject`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `subject` (`id`, `name`) VALUES (1, 'Defense Against the Dark Arts');
INSERT INTO `subject` (`id`, `name`) VALUES (2, 'Potions');
INSERT INTO `subject` (`id`, `name`) VALUES (3, 'Transfiguration');
INSERT INTO `subject` (`id`, `name`) VALUES (4, 'Divination');
INSERT INTO `subject` (`id`, `name`) VALUES (5, 'Administration');

COMMIT;


-- -----------------------------------------------------
-- Data for table `teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (1, 'Adumbledore', 'Fawkes', 1, 'admin', 1, 'Albus', 'Dumbledore', 'Adumb@Hogwarts.edu', 5);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (2, 'Mmcgonagall', 'Tabby', 1, 'user', 1, 'Minerva', 'McGonagall', 'Mmine@Hogwarts.edu', 3);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (3, 'Ssnape', 'Lily', 1, 'user', 1, 'Severus', 'Snape', 'Ssnap@Hogwarts.edu', 2);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (4, 'STrelawny', 'Death', 1, 'user', 1, 'Sybill', 'Trelawney', 'Strel@Hogwarts.edu', 4);
INSERT INTO `teacher` (`id`, `username`, `password`, `enabled`, `role`, `school_id`, `first_name`, `last_name`, `email`, `subject_id`) VALUES (5, 'RLupin', 'Moony', 1, 'user', 1, 'Remus', 'Lupin', 'RLupi@Hogwarts.edu', 1);

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

