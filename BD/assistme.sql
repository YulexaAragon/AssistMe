-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: assistme
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asuntos`
--

DROP TABLE IF EXISTS `asuntos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asuntos` (
  `ID_ASUNT` int(11) NOT NULL,
  `ASUNTO` varchar(25) NOT NULL,
  PRIMARY KEY (`ID_ASUNT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asuntos`
--

LOCK TABLES `asuntos` WRITE;
/*!40000 ALTER TABLE `asuntos` DISABLE KEYS */;
INSERT INTO `asuntos` VALUES (1,'Apertura de aula'),(2,'Manejo del VideoBeam'),(3,'Manejo del televisor');
/*!40000 ALTER TABLE `asuntos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `aula` (
  `ID_AULA` int(11) NOT NULL AUTO_INCREMENT,
  `AULA` char(30) NOT NULL,
  `ID_BLOQUE` int(11) NOT NULL,
  PRIMARY KEY (`ID_AULA`),
  KEY `ID_BLOQUE` (`ID_BLOQUE`),
  CONSTRAINT `aula_ibfk_1` FOREIGN KEY (`ID_BLOQUE`) REFERENCES `bloques` (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (1,'105',1),(2,'107',1),(3,'201',1),(4,'205',1),(5,'209',1);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bloques`
--

DROP TABLE IF EXISTS `bloques`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bloques` (
  `ID` int(11) NOT NULL,
  `BLOQUE` varchar(20) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bloques`
--

LOCK TABLES `bloques` WRITE;
/*!40000 ALTER TABLE `bloques` DISABLE KEYS */;
INSERT INTO `bloques` VALUES (1,'Bloque 1'),(2,'Bloque 3'),(3,'Bloque 4'),(4,'Bloque 5'),(5,'Bloque 6'),(6,'Bloque 7'),(7,'Bloque 8'),(8,'Bloque 9'),(9,'Bloque 10'),(10,'Bloque 11'),(11,'Bloque 12'),(12,'Bloque 13');
/*!40000 ALTER TABLE `bloques` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitudes`
--

DROP TABLE IF EXISTS `solicitudes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `solicitudes` (
  `ID_SOLICITUD` int(11) NOT NULL AUTO_INCREMENT,
  `BLOQUE` int(3) NOT NULL,
  `AULA` int(11) NOT NULL,
  `MOTIVO` int(3) NOT NULL,
  `DESCRIPCION` varchar(200) NOT NULL,
  PRIMARY KEY (`ID_SOLICITUD`),
  KEY `AULA` (`AULA`),
  KEY `BLOQUE` (`BLOQUE`),
  KEY `MOTIVO` (`MOTIVO`),
  CONSTRAINT `solicitudes_ibfk_1` FOREIGN KEY (`AULA`) REFERENCES `aula` (`ID_AULA`),
  CONSTRAINT `solicitudes_ibfk_2` FOREIGN KEY (`BLOQUE`) REFERENCES `bloques` (`ID`),
  CONSTRAINT `solicitudes_ibfk_3` FOREIGN KEY (`MOTIVO`) REFERENCES `asuntos` (`ID_ASUNT`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitudes`
--

LOCK TABLES `solicitudes` WRITE;
/*!40000 ALTER TABLE `solicitudes` DISABLE KEYS */;
INSERT INTO `solicitudes` VALUES (60,12,5,3,'El televisor no enciende.'),(63,1,1,1,'fggg');
/*!40000 ALTER TABLE `solicitudes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `usuario` (
  `CEDULA` int(10) NOT NULL,
  `NOMBRE` varchar(15) NOT NULL,
  `APELLIDO` varchar(15) NOT NULL,
  `TIPO` varchar(10) NOT NULL,
  PRIMARY KEY (`CEDULA`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (12345,'Camila','Suarez','Docente'),(67890,'Pablo','López','Empleado'),(1193591127,'Yulexa','Aragón','Docente');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-05-27 11:39:16
