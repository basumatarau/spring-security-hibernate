-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema spring-sec-hbm001
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `spring-sec-hbm001` ;

-- -----------------------------------------------------
-- Schema spring-sec-hbm001
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `spring-sec-hbm001` DEFAULT CHARACTER SET utf8 ;
USE `spring-sec-hbm001` ;

-- -----------------------------------------------------
-- Table `spring-sec-hbm001`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring-sec-hbm001`.`users` (
  `idUser` INT(11) NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(80) NOT NULL,
  `lastName` VARCHAR(80) NULL DEFAULT NULL,
  `email` VARCHAR(60) NOT NULL,
  `nickName` VARCHAR(60) NOT NULL,
  `salt` VARCHAR(45) NOT NULL,
  `password` VARCHAR(80) NOT NULL,
  `isEnabled` TINYINT(1) NOT NULL,
  PRIMARY KEY (`idUser`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `spring-sec-hbm001`.`authorities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `spring-sec-hbm001`.`authorities` (
  `authority` VARCHAR(45) NOT NULL,
  `users_idUser` INT(11) NOT NULL,
  PRIMARY KEY (`authority`, `users_idUser`),
  INDEX `fk_authorities_users_idx` (`users_idUser` ASC),
  CONSTRAINT `fk_authorities_users`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `spring-sec-hbm001`.`users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `spring-sec-hbm001`.`users`
-- -----------------------------------------------------
START TRANSACTION;
USE `spring-sec-hbm001`;
INSERT INTO `spring-sec-hbm001`.`users` (`idUser`, `firstName`, `lastName`, `email`, `nickName`, `salt`, `password`, `isEnabled`) VALUES (1, 'john', 'smith', 'john@mail.com', 'nickName', 'nil', '$2a$10$/NoDKoCB3XVHZdTiDx6VU.L2BoBYvnCQ.WMhFYZd9UfPNACQHkoJS', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `spring-sec-hbm001`.`authorities`
-- -----------------------------------------------------
START TRANSACTION;
USE `spring-sec-hbm001`;
INSERT INTO `spring-sec-hbm001`.`authorities` (`authority`, `users_idUser`) VALUES ('ROLE_ADMIN', 1);

COMMIT;

