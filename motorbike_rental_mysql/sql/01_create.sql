-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema motorbike_rental
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Table `address`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `address` ;

CREATE TABLE IF NOT EXISTS `address` (
  `id_address` INT(11) NOT NULL AUTO_INCREMENT,
  `zip_code` INT(11) NOT NULL,
  `city` VARCHAR(30) NOT NULL,
  `street` VARCHAR(50) NOT NULL,
  `street_number` INT(11) NOT NULL,
  PRIMARY KEY (`id_address`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


-- -----------------------------------------------------
-- Table `customer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `customer` ;

CREATE TABLE IF NOT EXISTS `customer` (
  `id_customer` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(30) NOT NULL,
  `surname` VARCHAR(30) NOT NULL,
  `personal_number` VARCHAR(15) NOT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `phone` INT(11) NULL DEFAULT NULL,
  `id_address` INT(11) NOT NULL,
  PRIMARY KEY (`id_customer`),
  INDEX `customer_address_fk` (`id_address` ASC),
  CONSTRAINT `customer_address_fk`
    FOREIGN KEY (`id_address`)
    REFERENCES `address` (`id_address`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


-- -----------------------------------------------------
-- Table `model`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `model` ;

CREATE TABLE IF NOT EXISTS `model` (
  `id_model` INT(11) NOT NULL AUTO_INCREMENT,
  `brand` VARCHAR(30) NOT NULL,
  `model_name` VARCHAR(50) NOT NULL,
  `engine_capacity` INT(11) NOT NULL,
  PRIMARY KEY (`id_model`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


-- -----------------------------------------------------
-- Table `motorbike`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `motorbike` ;

CREATE TABLE IF NOT EXISTS `motorbike` (
  `id_motorbike` INT(11) NOT NULL AUTO_INCREMENT,
  `price` INT(11) NOT NULL,
  `bike_condition` VARCHAR(100) NULL DEFAULT NULL,
  `id_model` INT(11) NOT NULL,
  PRIMARY KEY (`id_motorbike`),
  INDEX `motorbike_model_fk` (`id_model` ASC),
  CONSTRAINT `motorbike_model_fk`
    FOREIGN KEY (`id_model`)
    REFERENCES `model` (`id_model`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


-- -----------------------------------------------------
-- Table `rent`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rent` ;

CREATE TABLE IF NOT EXISTS `rent` (
  `id_rent` INT(11) NOT NULL AUTO_INCREMENT,
  `rent_date` DATE NOT NULL,
  `return_date` DATE NULL DEFAULT NULL,
  `id_motorbike` INT(11) NOT NULL,
  `id_customer` INT(11) NOT NULL,
  PRIMARY KEY (`id_rent`),
  INDEX `rent_customer_fk` (`id_customer` ASC),
  INDEX `rent_motorbike_fk` (`id_motorbike` ASC),
  CONSTRAINT `rent_customer_fk`
    FOREIGN KEY (`id_customer`)
    REFERENCES `customer` (`id_customer`),
  CONSTRAINT `rent_motorbike_fk`
    FOREIGN KEY (`id_motorbike`)
    REFERENCES `motorbike` (`id_motorbike`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_czech_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
