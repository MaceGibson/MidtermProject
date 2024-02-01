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
-- Table `Student`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student` ;

CREATE TABLE IF NOT EXISTS `Student` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `grade_level` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Teacher` ;

CREATE TABLE IF NOT EXISTS `Teacher` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `enabled` TINYINT NULL,
  `role` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Course`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Course` ;

CREATE TABLE IF NOT EXISTS `Course` (
  `id` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `description` VARCHAR(45) NULL,
  `subject` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Class` ;

CREATE TABLE IF NOT EXISTS `Class` (
  `id` INT NOT NULL,
  `course_id` INT NOT NULL,
  `capacity` VARCHAR(45) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Class_Course_idx` (`course_id` ASC),
  CONSTRAINT `fk_Class_Course`
    FOREIGN KEY (`course_id`)
    REFERENCES `Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student_has_Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_has_Class` ;

CREATE TABLE IF NOT EXISTS `Student_has_Class` (
  `Student_id` INT NOT NULL,
  `Class_id` INT NOT NULL,
  `Grade` VARCHAR(45) NULL,
  PRIMARY KEY (`Student_id`, `Class_id`),
  INDEX `fk_Student_has_Class_Class1_idx` (`Class_id` ASC),
  INDEX `fk_Student_has_Class_Student1_idx` (`Student_id` ASC),
  CONSTRAINT `fk_Student_has_Class_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Class_Class1`
    FOREIGN KEY (`Class_id`)
    REFERENCES `Class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Teacher_has_Class`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Teacher_has_Class` ;

CREATE TABLE IF NOT EXISTS `Teacher_has_Class` (
  `Teacher_id` INT NOT NULL,
  `Class_id` INT NOT NULL,
  PRIMARY KEY (`Teacher_id`, `Class_id`),
  INDEX `fk_Teacher_has_Class_Class1_idx` (`Class_id` ASC),
  INDEX `fk_Teacher_has_Class_Teacher1_idx` (`Teacher_id` ASC),
  CONSTRAINT `fk_Teacher_has_Class_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `Teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Teacher_has_Class_Class1`
    FOREIGN KEY (`Class_id`)
    REFERENCES `Class` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Student_has_Teacher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Student_has_Teacher` ;

CREATE TABLE IF NOT EXISTS `Student_has_Teacher` (
  `Student_id` INT NOT NULL,
  `Teacher_id` INT NOT NULL,
  PRIMARY KEY (`Student_id`, `Teacher_id`),
  INDEX `fk_Student_has_Teacher_Teacher1_idx` (`Teacher_id` ASC),
  INDEX `fk_Student_has_Teacher_Student1_idx` (`Student_id` ASC),
  CONSTRAINT `fk_Student_has_Teacher_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `Student` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Student_has_Teacher_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `Teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Review`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Review` ;

CREATE TABLE IF NOT EXISTS `Review` (
  `id` INT NOT NULL,
  `Review Text` BLOB NULL,
  `Course_id` INT NOT NULL,
  `Teacher_id` INT NOT NULL,
  `Student_id` INT NOT NULL,
  `Rating` INT(1) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Review_Course1_idx` (`Course_id` ASC),
  INDEX `fk_Review_Teacher1_idx` (`Teacher_id` ASC),
  INDEX `fk_Review_Student1_idx` (`Student_id` ASC),
  CONSTRAINT `fk_Review_Course1`
    FOREIGN KEY (`Course_id`)
    REFERENCES `Course` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Teacher1`
    FOREIGN KEY (`Teacher_id`)
    REFERENCES `Teacher` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Review_Student1`
    FOREIGN KEY (`Student_id`)
    REFERENCES `Student` (`id`)
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
-- Data for table `Teacher`
-- -----------------------------------------------------
START TRANSACTION;
USE `RateMyStudentDB`;
INSERT INTO `Teacher` (`id`, `username`, `password`, `enabled`, `role`) VALUES (1, 'teacher', 'teacher', 1, 'user');

COMMIT;

