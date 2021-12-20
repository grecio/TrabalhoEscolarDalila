CREATE TABLE `tblPessoa` (
  `Id` varchar(36) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `RG` varchar(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Telefone` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
);
CREATE TABLE `tblUsuario` (
  `Id` varchar(36) NOT NULL,
  `PessoaId` varchar(36) NOT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `UsuarioPessoa_FK_idx` (`PessoaId`),
  CONSTRAINT `UsuarioPessoa_FK` FOREIGN KEY (`PessoaId`) REFERENCES `tblPessoa` (`Id`)
);
CREATE TABLE `tblCurso` (
  `Id` varchar(36) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `tblPeriodo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ano` int NOT NULL,
  `Ciclo` int NOT NULL,
  PRIMARY KEY (`Id`)
);

CREATE TABLE `tblMatriculaStatus` (
  `Id` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
);
CREATE TABLE `tblMatricula` (
  `Id` varchar(36) NOT NULL,
  `PessoaId` varchar(36) NOT NULL,
  `Numero` varchar(45) DEFAULT NULL,
  `CursoId` varchar(36) DEFAULT NULL,
  `PeriodoId` int DEFAULT NULL,
  `MatriculaStatusId` int DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `AlunoPessoa_FK_idx` (`PessoaId`),
  KEY `AlunoCurso_FK_idx` (`CursoId`),
  KEY `AlunoMatriculaStatus_FK_idx` (`MatriculaStatusId`),
  KEY `AlunoPeriodo_FK_idx` (`PeriodoId`),
  CONSTRAINT `AlunoCurso_FK` FOREIGN KEY (`CursoId`) REFERENCES `tblCurso` (`Id`),
  CONSTRAINT `AlunoMatriculaStatus_FK` FOREIGN KEY (`MatriculaStatusId`) REFERENCES `tblMatriculaStatus` (`Id`),
  CONSTRAINT `AlunoPeriodo_FK` FOREIGN KEY (`PeriodoId`) REFERENCES `tblPeriodo` (`Id`),
  CONSTRAINT `AlunoPessoa_FK` FOREIGN KEY (`PessoaId`) REFERENCES `tblPessoa` (`Id`)
);

CREATE TABLE `tblBoletim` (
  `Id` varchar(36) NOT NULL,
  `MatriculaId` varchar(36) NOT NULL,
  `Nota1` decimal(10,0) NOT NULL,
  `Nota2` decimal(10,0) NOT NULL,
  `Nota3` decimal(10,0) NOT NULL,
  `Nota4` decimal(10,0) NOT NULL,
  `Media` decimal(10,0) NOT NULL,
  `Status` varchar(2) NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `BoletimMatricula_FK_idx` (`MatriculaId`),
  CONSTRAINT `BoletimMatricula_FK` FOREIGN KEY (`MatriculaId`) REFERENCES `tblMatricula` (`Id`)
);