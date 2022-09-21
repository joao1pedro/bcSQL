
-- -----------------------------------------------------
-- `Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(255) NOT NULL,
  `Telefone` CHAR(11) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `idCliente_UNIQUE` (`idCliente` ASC) VISIBLE);


-- -----------------------------------------------------
-- Veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo` (
  `idVeiculo` INT NOT NULL,
  `Modelo` VARCHAR(45) NOT NULL,
  `Placa` VARCHAR(45) NOT NULL,
  `Ano` DATE NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idVeiculo`, `Cliente_idCliente`),
  UNIQUE INDEX `idVeiculo_UNIQUE` (`idVeiculo` ASC) VISIBLE,
  INDEX `fk_Veiculo_Cliente_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_Cliente`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`));


-- -----------------------------------------------------
-- `Equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe` (
  `idEquipe` INT NOT NULL,
  PRIMARY KEY (`idEquipe`));


-- -----------------------------------------------------
-- `Mecânico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico` (
  `código` INT NOT NULL,
  `Nome` VARCHAR(45) NOT NULL,
  `Endereço` VARCHAR(45) NOT NULL,
  `Especialidade` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`código`),
  UNIQUE INDEX `idMecânico_UNIQUE` (`código` ASC) VISIBLE);


-- -----------------------------------------------------
-- `Mecânico_pertence_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mecânico_pertence_equipe` (
  `Mecânico_código` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`Mecânico_código`, `Equipe_idEquipe`),
  INDEX `fk_Mecânico_has_Equipe_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Mecânico_has_Equipe_Mecânico1_idx` (`Mecânico_código` ASC) VISIBLE,
  CONSTRAINT `fk_Mecânico_has_Equipe_Mecânico1`
    FOREIGN KEY (`Mecânico_código`)
    REFERENCES `mydb`.`Mecânico` (`código`)
  CONSTRAINT `fk_Mecânico_has_Equipe_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`));


-- -----------------------------------------------------
-- Veiculo_pertence_equipe`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Veiculo_pertence_equipe` (
  `Veiculo_idVeiculo` INT NOT NULL,
  `Veiculo_Cliente_idCliente` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`Veiculo_idVeiculo`, `Veiculo_Cliente_idCliente`, `Equipe_idEquipe`),
  INDEX `fk_Veiculo_has_Equipe_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_Veiculo_has_Equipe_Veiculo1_idx` (`Veiculo_idVeiculo` ASC, `Veiculo_Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Veiculo_has_Equipe_Veiculo1`
    FOREIGN KEY (`Veiculo_idVeiculo` , `Veiculo_Cliente_idCliente`)
    REFERENCES `mydb`.`Veiculo` (`idVeiculo` , `Cliente_idCliente`)
  CONSTRAINT `fk_Veiculo_has_Equipe_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`));


-- -----------------------------------------------------
-- OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`OS` (
  `idOS` INT NOT NULL,
  `Tipo` VARCHAR(45) NOT NULL,
  `DataEmissao` DATE NOT NULL,
  `DataConclusao` DATE NOT NULL,
  PRIMARY KEY (`idOS`),
  UNIQUE INDEX `idOS_UNIQUE` (`idOS` ASC) VISIBLE);


-- -----------------------------------------------------
-- ''Mão-de-obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Mão-de-obra` (
  `idMão-de-obra` INT NOT NULL,
  `Preço` FLOAT NOT NULL,
  PRIMARY KEY (`idMão-de-obra`),
  UNIQUE INDEX `idMão-de-obra_UNIQUE` (`idMão-de-obra` ASC) VISIBLE,
  CONSTRAINT `fk_Mão-de-obra_OS1`
    FOREIGN KEY (`idMão-de-obra`)
    REFERENCES `mydb`.`OS` (`idOS`));


-- -----------------------------------------------------
-- `Peça`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peça` (
  `idPeça` INT NOT NULL,
  `Quantidade` INT NOT NULL,
  `Valor` FLOAT NOT NULL,
  PRIMARY KEY (`idPeça`),
  UNIQUE INDEX `idPeça_UNIQUE` (`idPeça` ASC) VISIBLE);


-- -----------------------------------------------------
-- `Peça_has_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Peça_has_OS` (
  `Peça_idPeça` INT NOT NULL,
  `OS_idOS` INT NOT NULL,
  PRIMARY KEY (`Peça_idPeça`, `OS_idOS`),
  INDEX `fk_Peça_has_OS_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  INDEX `fk_Peça_has_OS_Peça1_idx` (`Peça_idPeça` ASC) VISIBLE,
  CONSTRAINT `fk_Peça_has_OS_Peça1`
    FOREIGN KEY (`Peça_idPeça`)
    REFERENCES `mydb`.`Peça` (`idPeça`)
  CONSTRAINT `fk_Peça_has_OS_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `mydb`.`OS` (`idOS`));


-- -----------------------------------------------------
-- Equipe_OS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Equipe_OS` (
  `OS_idOS` INT NOT NULL,
  `Equipe_idEquipe` INT NOT NULL,
  PRIMARY KEY (`OS_idOS`, `Equipe_idEquipe`),
  INDEX `fk_OS_has_Equipe_Equipe1_idx` (`Equipe_idEquipe` ASC) VISIBLE,
  INDEX `fk_OS_has_Equipe_OS1_idx` (`OS_idOS` ASC) VISIBLE,
  CONSTRAINT `fk_OS_has_Equipe_OS1`
    FOREIGN KEY (`OS_idOS`)
    REFERENCES `mydb`.`OS` (`idOS`)
  CONSTRAINT `fk_OS_has_Equipe_Equipe1`
    FOREIGN KEY (`Equipe_idEquipe`)
    REFERENCES `mydb`.`Equipe` (`idEquipe`));
