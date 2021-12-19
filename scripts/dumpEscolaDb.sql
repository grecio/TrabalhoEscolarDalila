-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: EscolaDb
-- ------------------------------------------------------
-- Server version	8.0.27

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tblAluno`
--

DROP TABLE IF EXISTS `tblAluno`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblAluno` (
  `Id` varchar(36) NOT NULL,
  `PessoaId` varchar(36) NOT NULL,
  `Matricula` varchar(45) DEFAULT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblAluno`
--

LOCK TABLES `tblAluno` WRITE;
/*!40000 ALTER TABLE `tblAluno` DISABLE KEYS */;
/*!40000 ALTER TABLE `tblAluno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblCurso`
--

DROP TABLE IF EXISTS `tblCurso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblCurso` (
  `Id` varchar(36) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblCurso`
--

LOCK TABLES `tblCurso` WRITE;
/*!40000 ALTER TABLE `tblCurso` DISABLE KEYS */;
INSERT INTO `tblCurso` VALUES ('f0662aec-6084-11ec-8225-0242ac110004','Enfermagem'),('f06833a0-6084-11ec-8225-0242ac110004','Tecnologia da Informação'),('f068beab-6084-11ec-8225-0242ac110004','Radiologia');
/*!40000 ALTER TABLE `tblCurso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblMatriculaStatus`
--

DROP TABLE IF EXISTS `tblMatriculaStatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblMatriculaStatus` (
  `Id` int NOT NULL,
  `Status` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblMatriculaStatus`
--

LOCK TABLES `tblMatriculaStatus` WRITE;
/*!40000 ALTER TABLE `tblMatriculaStatus` DISABLE KEYS */;
INSERT INTO `tblMatriculaStatus` VALUES (1,'Ativa'),(2,'Inativa'),(3,'Suspensa');
/*!40000 ALTER TABLE `tblMatriculaStatus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPeriodo`
--

DROP TABLE IF EXISTS `tblPeriodo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblPeriodo` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Ano` int NOT NULL,
  `Ciclo` int NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPeriodo`
--

LOCK TABLES `tblPeriodo` WRITE;
/*!40000 ALTER TABLE `tblPeriodo` DISABLE KEYS */;
INSERT INTO `tblPeriodo` VALUES (1,2021,1),(2,2021,2),(3,2022,1),(4,2022,2);
/*!40000 ALTER TABLE `tblPeriodo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblPessoa`
--

DROP TABLE IF EXISTS `tblPessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblPessoa` (
  `Id` varchar(36) NOT NULL,
  `Nome` varchar(255) NOT NULL,
  `CPF` varchar(11) NOT NULL,
  `RG` varchar(11) DEFAULT NULL,
  `Email` varchar(255) NOT NULL,
  `Telefone` varchar(45) NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	Tabela Responsável Por Gravar Dados Comuns a Pessoas			';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblPessoa`
--

LOCK TABLES `tblPessoa` WRITE;
/*!40000 ALTER TABLE `tblPessoa` DISABLE KEYS */;
INSERT INTO `tblPessoa` VALUES ('7c757a91-6084-11ec-8225-0242ac110004','Wesley','06770809486','','wesleyyagami@gmail.com','84994657913');
/*!40000 ALTER TABLE `tblPessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tblUsuario`
--

DROP TABLE IF EXISTS `tblUsuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tblUsuario` (
  `Id` varchar(36) NOT NULL,
  `PessoaId` varchar(36) NOT NULL,
  `Login` varchar(45) DEFAULT NULL,
  `Senha` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id`),
  KEY `UsuarioPessoa_FK_idx` (`PessoaId`),
  CONSTRAINT `UsuarioPessoa_FK` FOREIGN KEY (`PessoaId`) REFERENCES `tblPessoa` (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tblUsuario`
--

LOCK TABLES `tblUsuario` WRITE;
/*!40000 ALTER TABLE `tblUsuario` DISABLE KEYS */;
INSERT INTO `tblUsuario` VALUES ('188c8002-6085-11ec-8225-0242ac110004','7c757a91-6084-11ec-8225-0242ac110004','admin','123');
/*!40000 ALTER TABLE `tblUsuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-19  1:41:35
