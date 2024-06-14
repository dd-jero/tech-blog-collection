-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema tech_blog_web
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tech_blog_web
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tech_blog_web` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `tech_blog_web` ;

-- -----------------------------------------------------
-- Table `tech_blog_web`.`blog_collection`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`blog_collection` (
  `blog_collection_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `url` VARCHAR(45) NULL DEFAULT NULL,
  `regist_time` VARCHAR(45) NULL DEFAULT NULL,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  `company_name` VARCHAR(45) NULL DEFAULT NULL,
  `category` VARCHAR(45) NULL DEFAULT NULL,
  `read_count` VARCHAR(45) NULL DEFAULT NULL,
  `like_count` VARCHAR(45) NULL DEFAULT NULL,
  `gpt_summary` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`blog_collection_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`member` (
  `member_id` VARCHAR(20) NOT NULL,
  `password` VARCHAR(45) NULL DEFAULT NULL,
  `name` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `member_level` VARCHAR(45) NULL DEFAULT NULL,
  `regist_time` VARCHAR(45) NULL DEFAULT NULL,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  `nickname` VARCHAR(45) NULL DEFAULT NULL,
  `provide` VARCHAR(45) NULL DEFAULT NULL,
  `gender` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`member_id`),
  UNIQUE INDEX `member_id_UNIQUE` (`member_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`board`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`board` (
  `board_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `member_id` VARCHAR(20) NOT NULL,
  `content` VARCHAR(45) NULL DEFAULT NULL,
  `like_count` INT NULL DEFAULT NULL,
  `read_count` INT NULL DEFAULT NULL,
  `regist_time` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  `type` INT NULL DEFAULT NULL,
  PRIMARY KEY (`board_id`, `member_id`),
  INDEX `fk_Board_Member_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Board_Member`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`comment` (
  `id` INT NOT NULL,
  `content` VARCHAR(45) NULL DEFAULT NULL,
  `board_id` INT NOT NULL,
  `member_id` VARCHAR(20) NOT NULL,
  `regist_time` VARCHAR(45) NULL DEFAULT NULL,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  `depth` VARCHAR(45) NULL DEFAULT NULL,
  `mother_comment_id` VARCHAR(45) NULL DEFAULT NULL,
  `comment_seq` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`id`, `board_id`, `member_id`),
  INDEX `fk_Comment_Board1_idx` (`board_id` ASC) VISIBLE,
  INDEX `fk_Comment_Member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_Board1`
    FOREIGN KEY (`board_id`)
    REFERENCES `tech_blog_web`.`board` (`board_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comment_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`favorite_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`favorite_blog` (
  `favorite_blog_id` INT NOT NULL,
  `member_id` VARCHAR(45) NOT NULL,
  `blog_collection_id` INT NOT NULL,
  `regist_time` VARCHAR(45) NULL DEFAULT NULL,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  `member_to_favorite_blog_member_id` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`favorite_blog_id`, `member_to_favorite_blog_member_id`, `member_id`, `blog_collection_id`),
  INDEX `fk_Favorite_Blog_Blog_Collection1_idx` (`blog_collection_id` ASC) VISIBLE,
  INDEX `fk_Favorite_Blog_Member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favorite_Blog_Blog_Collection1`
    FOREIGN KEY (`blog_collection_id`)
    REFERENCES `tech_blog_web`.`blog_collection` (`blog_collection_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Favorite_Blog_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`favorite_blog_list`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`favorite_blog_list` (
  `favorite_blog_list_id` INT NOT NULL,
  `member_id` VARCHAR(20) NOT NULL,
  `regist_time` VARCHAR(45) NULL DEFAULT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `update_time` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`favorite_blog_list_id`, `member_id`),
  UNIQUE INDEX `favorite_blog_list_UNIQUE` (`favorite_blog_list_id` ASC) VISIBLE,
  INDEX `fk_Favorite_Blog_List_Member1_idx` (`member_id` ASC) VISIBLE,
  CONSTRAINT `fk_Favorite_Blog_List_Member1`
    FOREIGN KEY (`member_id`)
    REFERENCES `tech_blog_web`.`member` (`member_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `tech_blog_web`.`list_to_blog`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tech_blog_web`.`list_to_blog` (
  `favorite_blog_list_id` INT NOT NULL,
  `favorite_blog_id` INT NOT NULL,
  PRIMARY KEY (`favorite_blog_list_id`, `favorite_blog_id`),
  INDEX `fk_list_to_blog_Favorite_Blog1_idx` (`favorite_blog_id` ASC) VISIBLE,
  CONSTRAINT `fk_list_to_blog_Favorite_Blog1`
    FOREIGN KEY (`favorite_blog_id`)
    REFERENCES `tech_blog_web`.`favorite_blog` (`favorite_blog_id`),
  CONSTRAINT `fk_list_to_blog_Favorite_Blog_List1`
    FOREIGN KEY (`favorite_blog_list_id`)
    REFERENCES `tech_blog_web`.`favorite_blog_list` (`favorite_blog_list_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
