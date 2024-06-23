CREATE DATABASE  IF NOT EXISTS `meubanco` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `meubanco`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: meubanco
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Telefone` varchar(20) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`ID_Cliente`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Pedro Santos','pedro.santos@example.com','(31) 99876-5432','345.678.901-22'),(2,'Ana Costa','ana.costa@example.com','(41) 95678-1234','456.789.012-33'),(3,'Lucas Pereira','lucas.pereira@example.com','(51) 94765-4321','567.890.123-44'),(4,'Juliana Rocha','juliana.rocha@example.com','(61) 94567-8901','678.901.234-55'),(5,'Carlos Almeida','carlos.almeida@example.com','(71) 93456-7890','789.012.345-66'),(6,'Fernanda Lima','fernanda.lima@example.com','(81) 92345-6789','890.123.456-77'),(7,'Rafael Fernandes','rafael.fernandes@example.com','(91) 91234-5678','901.234.567-88'),(8,'Beatriz Souza','beatriz.souza@example.com','(31) 99876-5432','012.345.678-99'),(9,'Bruno Carvalho','bruno.carvalho@example.com','(21) 95555-4444','123.123.123-12'),(10,'Camila Ferreira','camila.ferreira@example.com','(11) 96666-3333','234.234.234-23'),(11,'Daniel Souza','daniel.souza@example.com','(31) 97777-2222','345.345.345-34'),(12,'Elisa Martins','elisa.martins@example.com','(41) 98888-1111','456.456.456-45'),(13,'Fabio Alves','fabio.alves@example.com','(51) 99999-0000','567.567.567-56'),(14,'Gabriela Pereira','gabriela.pereira@example.com','(61) 90000-9999','678.678.678-67'),(15,'Henrique Barros','henrique.barros@example.com','(71) 91111-8888','789.789.789-78'),(16,'Isabel Rodrigues','isabel.rodrigues@example.com','(81) 92222-7777','890.890.890-89'),(17,'João Moura','joao.moura@example.com','(91) 93333-6666','901.901.901-90'),(18,'Karen Lima','karen.lima@example.com','(31) 94444-5555','012.012.012-01'),(19,'Leonardo Nogueira','leonardo.nogueira@example.com','(21) 95555-4444','123.456.789-22'),(20,'Marina Silva','marina.silva@example.com','(11) 96666-3333','234.567.890-33');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cliente_compra_produto`
--

DROP TABLE IF EXISTS `cliente_compra_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente_compra_produto` (
  `ID_Cliente` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `Data_Compra` date NOT NULL,
  `Quantidade` int(11) NOT NULL,
  PRIMARY KEY (`ID_Cliente`,`ID_Produto`),
  KEY `ID_Produto` (`ID_Produto`),
  CONSTRAINT `cliente_compra_produto_ibfk_1` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  CONSTRAINT `cliente_compra_produto_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente_compra_produto`
--

LOCK TABLES `cliente_compra_produto` WRITE;
/*!40000 ALTER TABLE `cliente_compra_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cliente_compra_produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produto` (
  `ID_Produto` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(25) NOT NULL,
  `Descrição` text NOT NULL,
  `Preço` decimal(7,2) NOT NULL,
  PRIMARY KEY (`ID_Produto`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Serviço de Pedreiro','Reparos gerais, construção de muros e reformas.',150.00),(2,'Marido de Aluguel','Pequenos reparos domésticos, montagem de móveis, instalação de prateleiras.',100.00),(3,'Serviço de Faxina','Limpeza completa de casas e escritórios, organização de ambientes.',200.00),(4,'Eletricista Residencial','Instalação e manutenção elétrica, troca de fiação e consertos.',180.00),(5,'Encanador','Desentupimento de pias, conserto de vazamentos, instalação de torneiras.',170.00),(6,'Jardinagem','Manutenção de jardins, poda de árvores, plantio de flores e grama.',120.00),(7,'Pintor Residencial','Pintura interna e externa, preparação de superfícies.',160.00),(8,'Limpeza Pós-Obra','Limpeza especializada após reformas e construções.',250.00),(9,'Montagem de Móveis','Montagem de móveis novos e ajustes em móveis existentes.',110.00),(10,'Serviço de Mudança','Transporte de móveis e objetos, desmontagem e montagem.',300.00),(11,'Limpeza de Vidros','Limpeza de janelas e vidros de difícil acesso.',140.00),(12,'Assistência Técnica','Conserto e manutenção de eletrodomésticos e eletrônicos.',130.00),(13,'Consultoria de Decoração','Sugestões e planos de decoração para ambientes residenciais.',200.00),(14,'Diarista','Serviço de limpeza e manutenção periódica de residências.',150.00),(15,'Limpeza de Estofados','Limpeza e higienização de sofás, poltronas e colchões.',180.00),(16,'Manutenção de Ar-Condicio','Limpeza, instalação e reparo de sistemas de ar-condicionado.',200.00),(17,'Serviço de Segurança Resi','Instalação de câmeras, alarmes e sistemas de segurança.',250.00),(18,'Babá','Cuidado de crianças, atividades educativas e recreativas.',100.00),(19,'Assistência em Eventos','Apoio em festas e eventos, organização e atendimento.',120.00),(20,'Serviço de Pintura Decora','Pintura artística e personalizada para interiores.',220.00);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissional`
--

DROP TABLE IF EXISTS `profissional`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissional` (
  `ID_Profissional` int(11) NOT NULL AUTO_INCREMENT,
  `Nome` varchar(30) NOT NULL,
  `Especialidade` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `CPF` varchar(14) NOT NULL,
  PRIMARY KEY (`ID_Profissional`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `CPF` (`CPF`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissional`
--

LOCK TABLES `profissional` WRITE;
/*!40000 ALTER TABLE `profissional` DISABLE KEYS */;
INSERT INTO `profissional` VALUES (1,'João da Bonifacio','Serviço de Pedreiro','joao.bonifacio@email.com','123.456.789-21'),(2,'José Santos','Marido de Aluguel','jose.santos@email.com','987.654.321-70'),(3,'Maria Oliveira','Serviço de Faxina','maria.oliveira@email.com','456.789.123-00'),(4,'Carlos Pera','Eletricista Residenc','carlos.pera@email.com','321.654.987-00'),(5,'Ana Souzy','Encanador','ana.souzy@email.com','654.321.987-00'),(6,'Roberto Arruda','Jardinagem','roberto.arruda@email.com','789.456.321-00'),(7,'Camila Almeida','Pintor Residencial','camila.almeida@email.com','234.567.890-01'),(8,'Lucas Lima','Limpeza Pós-Obra','lucas.lima@email.com','567.890.123-00'),(9,'Juliana Monte','Montagem de Móveis','juliana.monte@email.com','890.123.456-01'),(10,'Rafael Carreiro','Serviço de Mudança','rafael.carreiro@email.com','678.901.234-00'),(11,'Patrícia Pires','Limpeza de Vidros','patricia.pires@email.com','901.234.567-02'),(12,'Arlindo Conte','Assistência Técnica','arlindo.conte@email.com','456.789.012-05'),(13,'Jessica Jessy','Consultoria de Decor','jessica.jessy@email.com','890.234.567-00'),(14,'Dayanne Silva','Diarista','dayanne.silva@email.com','345.678.901-33'),(15,'Estuart Leandro','Limpeza de Estofados','estuart.leandro@email.com','678.123.456-00'),(16,'Manuel Arnaldo','Manutenção de Ar-Con','manuel.arnaldo@email.com','123.789.456-15'),(17,'Regis Santos','Serviço de Segurança','regis.santos@email.com','789.012.345-00'),(18,'Barbara Batista','Babá','barbara.batista@email.com','567.890.123-55'),(19,'Everton Assis','Assistência em Event','everton.assis@email.com','323.345.983-97'),(20,'Pedro Daniel','Serviço de Pintura D','pedro.daniel@email.comm','901.234.567-07');
/*!40000 ALTER TABLE `profissional` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `profissional_realiza_produto`
--

DROP TABLE IF EXISTS `profissional_realiza_produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `profissional_realiza_produto` (
  `ID_Profissional` int(11) NOT NULL,
  `ID_Produto` int(11) NOT NULL,
  `Data_Realizacao` date NOT NULL,
  PRIMARY KEY (`ID_Profissional`,`ID_Produto`),
  KEY `ID_Produto` (`ID_Produto`),
  CONSTRAINT `profissional_realiza_produto_ibfk_1` FOREIGN KEY (`ID_Profissional`) REFERENCES `profissional` (`ID_Profissional`),
  CONSTRAINT `profissional_realiza_produto_ibfk_2` FOREIGN KEY (`ID_Produto`) REFERENCES `produto` (`ID_Produto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `profissional_realiza_produto`
--

LOCK TABLES `profissional_realiza_produto` WRITE;
/*!40000 ALTER TABLE `profissional_realiza_produto` DISABLE KEYS */;
/*!40000 ALTER TABLE `profissional_realiza_produto` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-21  0:20:31
