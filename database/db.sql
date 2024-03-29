-- MySQL Script generated by MySQL Workbench
-- qui 18 jan 2024 13:58:57
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zssn
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zssn
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zssn` DEFAULT CHARACTER SET utf8 ;
USE `zssn` ;

-- -----------------------------------------------------
-- Table `zssn`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zssn`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `gender` ENUM("F", "M") NOT NULL,
  `lat` VARCHAR(45) NOT NULL,
  `long` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zssn`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zssn`.`user` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  `gender` ENUM("F", "M") NOT NULL,
  `lat` VARCHAR(45) NOT NULL,
  `long` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zssn`.`item`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zssn`.`item` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `value` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zssn`.`inventory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zssn`.`inventory` (
  `quantity` INT UNSIGNED NOT NULL DEFAULT 0,
  `user_id` INT UNSIGNED NOT NULL,
  `item_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_id`, `item_id`),
  INDEX `fk_inventory_user_idx` (`user_id` ASC) VISIBLE,
  INDEX `fk_inventory_item1_idx` (`item_id` ASC) VISIBLE,
  CONSTRAINT `fk_inventory_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `zssn`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_inventory_item1`
    FOREIGN KEY (`item_id`)
    REFERENCES `zssn`.`item` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zssn`.`infection_register`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zssn`.`infection_register` (
  `created_at` DATE NOT NULL,
  `user_report` INT UNSIGNED NOT NULL,
  `user_infected` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`user_report`, `user_infected`),
  INDEX `fk_infection_register_user1_idx` (`user_report` ASC) VISIBLE,
  INDEX `fk_infection_register_user2_idx` (`user_infected` ASC) VISIBLE,
  CONSTRAINT `fk_infection_register_user1`
    FOREIGN KEY (`user_report`)
    REFERENCES `zssn`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_infection_register_user2`
    FOREIGN KEY (`user_infected`)
    REFERENCES `zssn`.`user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
