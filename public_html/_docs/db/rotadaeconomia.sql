SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

DROP SCHEMA IF EXISTS `rota_da_economia` ;
CREATE SCHEMA IF NOT EXISTS `rota_da_economia` DEFAULT CHARACTER SET latin1 ;
USE `rota_da_economia` ;

-- -----------------------------------------------------
-- Table `rota_da_economia`.`a3m_account`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`a3m_account` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`a3m_account` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `username` VARCHAR(44) NOT NULL ,
  `email` VARCHAR(160) NOT NULL ,
  `password` VARCHAR(60) NULL ,
  `createdon` DATETIME NOT NULL ,
  `verifiedon` DATETIME NULL ,
  `lastsignedinon` DATETIME NULL ,
  `resetsenton` DATETIME NULL ,
  `deleteon` DATETIME NULL ,
  `suspendedon` DATETIME NULL ,
  `nivel` SMALLINT(3) NULL DEFAULT 10 ,
  PRIMARY KEY (`id`, `email`, `username`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`marcas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`marcas` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`marcas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(200) NOT NULL ,
  `descricao` TEXT NULL DEFAULT NULL ,
  `usuarios_id` INT(11) NOT NULL ,
  `data_hora` TIMESTAMP NULL ,
  `status` SMALLINT(1) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`, `usuarios_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`listas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`listas` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`listas` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(200) NULL DEFAULT NULL ,
  `usuario_id` INT(11) NOT NULL ,
  `status` SMALLINT(1) NULL DEFAULT '1' ,
  `publica` SMALLINT(1) NULL DEFAULT '0' ,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  PRIMARY KEY (`id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`listas_itens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`listas_itens` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`listas_itens` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `lista_id` INT(11) NOT NULL ,
  `produto_id` INT(11) NOT NULL ,
  `quantidade` INT(11) NULL ,
  `valor` VARCHAR(45) NULL ,
  `data` VARCHAR(45) NULL ,
  `status` INT(11) NULL ,
  PRIMARY KEY (`id`, `lista_id`, `produto_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`produtos` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`produtos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(200) NOT NULL ,
  `secao_id` INT(11) NOT NULL ,
  `descricao` TEXT NULL DEFAULT NULL ,
  `marca_id` INT(11) NOT NULL ,
  `tamanho` VARCHAR(11) NULL DEFAULT NULL ,
  `medida` ENUM('quilo','lata','litro','grama','unidade','pacote','caixa') NULL DEFAULT NULL ,
  `status` SMALLINT(1) NOT NULL DEFAULT '1' ,
  `usuario_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`, `marca_id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`relativo_opcoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`relativo_opcoes` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`relativo_opcoes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`estabelecimentos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`estabelecimentos` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`estabelecimentos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(128) NULL ,
  `usuario_id` INT(11) NOT NULL ,
  `latitude` VARCHAR(45) NULL ,
  `longitude` VARCHAR(45) NULL ,
  `telefone` VARCHAR(45) NULL ,
  `telefone2` VARCHAR(45) NULL ,
  `logradouro` VARCHAR(128) NULL ,
  `bairro` VARCHAR(128) NULL ,
  `cidade` VARCHAR(128) NULL ,
  `uf` CHAR(2) NULL ,
  `cep` VARCHAR(40) NULL ,
  `pais` CHAR(2) NULL ,
  PRIMARY KEY (`id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`imagens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`imagens` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`imagens` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `arquivo` VARCHAR(200) NOT NULL ,
  `data_hora` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `relativo_id` INT(11) NOT NULL ,
  `relativo_opcoes_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `relativo_id`, `relativo_opcoes_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`secoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`secoes` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`secoes` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `secao_id` INT(11) NOT NULL DEFAULT '0' ,
  `nome` VARCHAR(128) NOT NULL ,
  `descricao` TEXT NULL DEFAULT NULL ,
  `status` TINYINT(1) NOT NULL DEFAULT '1' ,
  PRIMARY KEY (`id`, `secao_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`precos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`precos` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`precos` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `produtos_id` INT(11) NOT NULL ,
  `estabelecimentos_id` INT(11) NOT NULL ,
  `usuarios_id` INT(11) NOT NULL ,
  `preco` DECIMAL(10,0)  NULL ,
  `data_hora` TIMESTAMP NULL ,
  `status` TINYINT NULL ,
  PRIMARY KEY (`id`, `produtos_id`, `estabelecimentos_id`, `usuarios_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`ci_sessions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`ci_sessions` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`ci_sessions` (
  `session_id` VARCHAR(40) NOT NULL ,
  `usuario_id` INT(11) NOT NULL ,
  `ip_address` VARCHAR(16) NOT NULL ,
  `user_agent` VARCHAR(120) NOT NULL ,
  `last_activity` INT(10) NOT NULL ,
  `user_data` TEXT NOT NULL ,
  PRIMARY KEY (`session_id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`tags` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`tags` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NOT NULL ,
  `quantidade` INT(11) NULL ,
  PRIMARY KEY (`id`, `nome`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`tags_itens`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`tags_itens` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`tags_itens` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `tag_id` INT(11) NOT NULL ,
  `relativo_id` INT(11) NOT NULL ,
  `relativo_opcoes_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `tag_id`, `relativo_id`, `relativo_opcoes_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`permissoes_pontuacoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`permissoes_pontuacoes` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`permissoes_pontuacoes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT(11) NOT NULL ,
  `permissao_id` INT(11) NOT NULL ,
  `pontos` INT(11) NULL ,
  `data_hora` TIMESTAMP NULL ,
  `status` TINYINT NULL ,
  PRIMARY KEY (`id`, `usuario_id`, `permissao_id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`permissoes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`permissoes` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`permissoes` (
  `id` INT(11) NOT NULL ,
  `nome` VARCHAR(128) NOT NULL ,
  `permissao` VARCHAR(128) NULL ,
  `minimo` INT(11) NOT NULL ,
  `maximo` INT(11) NULL ,
  `descricao` TEXT NULL ,
  `validade` VARCHAR(45) NULL ,
  `status` INT(11) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`a3m_account_details`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`a3m_account_details` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`a3m_account_details` (
  `account_id` INT NOT NULL AUTO_INCREMENT ,
  `fullname` VARCHAR(160) NULL ,
  `firstname` VARCHAR(80) NULL ,
  `lastname` VARCHAR(80) NULL ,
  `dateofbirth` DATE NULL ,
  `gender` CHAR(1) NULL ,
  `postalcode` VARCHAR(40) NULL ,
  `country` CHAR(2) NULL ,
  `language` CHAR(2) NULL ,
  `timezone` VARCHAR(40) NULL ,
  `picture` VARCHAR(240) NULL ,
  `newsletter` TINYINT(1)  NULL DEFAULT 1 ,
  PRIMARY KEY (`account_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`comentarios`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`comentarios` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`comentarios` (
  `id` INT(11) NOT NULL AUTO_INCREMENT ,
  `usuario_id` INT(11) NOT NULL ,
  `texto` TEXT NULL ,
  `status` VARCHAR(45) NULL ,
  `relativo_id` VARCHAR(45) NOT NULL ,
  `relativo_opcoes_id` VARCHAR(45) NOT NULL ,
  PRIMARY KEY (`id`, `relativo_opcoes_id`, `relativo_id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`rating`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`rating` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`rating` (
  `id` INT NOT NULL ,
  `session_id_id` INT(11) NOT NULL ,
  `total_votos` INT(11) NULL ,
  `total_valor` INT(11) NULL ,
  `relativo_id` INT(11) NOT NULL ,
  `relativo_opcoes_id` INT(11) NOT NULL ,
  PRIMARY KEY (`id`, `session_id_id`, `relativo_id`, `relativo_opcoes_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `rota_da_economia`.`usuarios_locais`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `rota_da_economia`.`usuarios_locais` ;

CREATE  TABLE IF NOT EXISTS `rota_da_economia`.`usuarios_locais` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `nome` VARCHAR(45) NULL ,
  `usuario_id` INT(11) NOT NULL ,
  `latitude` VARCHAR(45) NULL ,
  `longitude` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`, `usuario_id`) )
ENGINE = MyISAM
DEFAULT CHARACTER SET = latin1;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
