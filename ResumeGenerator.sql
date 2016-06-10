-- MySQL dump 10.13  Distrib 5.7.9, for osx10.9 (x86_64)
--
-- Host: localhost    Database: ResumeGenerator
-- ------------------------------------------------------
-- Server version	5.6.26

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Achievements`
--

DROP TABLE IF EXISTS `Achievements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Achievements` (
  `achieveID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `achievement` varchar(45) NOT NULL,
  PRIMARY KEY (`achieveID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Achievements`
--

LOCK TABLES `Achievements` WRITE;
/*!40000 ALTER TABLE `Achievements` DISABLE KEYS */;
/*!40000 ALTER TABLE `Achievements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Address`
--

DROP TABLE IF EXISTS `Address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Address` (
  `addressID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `address` tinytext NOT NULL,
  PRIMARY KEY (`addressID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Address`
--

LOCK TABLES `Address` WRITE;
/*!40000 ALTER TABLE `Address` DISABLE KEYS */;
/*!40000 ALTER TABLE `Address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Award`
--

DROP TABLE IF EXISTS `Award`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Award` (
  `awardID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `award` text NOT NULL,
  `yearAward` varchar(4) NOT NULL,
  PRIMARY KEY (`awardID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Award`
--

LOCK TABLES `Award` WRITE;
/*!40000 ALTER TABLE `Award` DISABLE KEYS */;
/*!40000 ALTER TABLE `Award` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Cellphone`
--

DROP TABLE IF EXISTS `Cellphone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Cellphone` (
  `cellphoneID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `cellNum` varchar(20) NOT NULL,
  PRIMARY KEY (`cellphoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Cellphone`
--

LOCK TABLES `Cellphone` WRITE;
/*!40000 ALTER TABLE `Cellphone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Cellphone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Curricular`
--

DROP TABLE IF EXISTS `Curricular`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Curricular` (
  `curricularID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `yrStart` varchar(4) NOT NULL,
  `yrFin` varchar(4) NOT NULL,
  `position` varchar(45) NOT NULL,
  `organization` varchar(45) NOT NULL,
  `workDone` text NOT NULL,
  PRIMARY KEY (`curricularID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Curricular`
--

LOCK TABLES `Curricular` WRITE;
/*!40000 ALTER TABLE `Curricular` DISABLE KEYS */;
/*!40000 ALTER TABLE `Curricular` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Education`
--

DROP TABLE IF EXISTS `Education`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Education` (
  `educationID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `yrStart` int(11) NOT NULL,
  `yrFin` int(11) NOT NULL,
  `school` varchar(45) NOT NULL,
  `educAttained` varchar(45) NOT NULL,
  `monthAttained` varchar(45) NOT NULL,
  `yearAttained` varchar(45) NOT NULL,
  PRIMARY KEY (`educationID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Education`
--

LOCK TABLES `Education` WRITE;
/*!40000 ALTER TABLE `Education` DISABLE KEYS */;
/*!40000 ALTER TABLE `Education` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LogIn`
--

DROP TABLE IF EXISTS `LogIn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LogIn` (
  `userID` int(11) NOT NULL,
  `username` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LogIn`
--

LOCK TABLES `LogIn` WRITE;
/*!40000 ALTER TABLE `LogIn` DISABLE KEYS */;
/*!40000 ALTER TABLE `LogIn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ResearchPaper`
--

DROP TABLE IF EXISTS `ResearchPaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ResearchPaper` (
  `researchPaperID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `month` varchar(45) NOT NULL,
  `year` varchar(4) NOT NULL,
  `title` varchar(70) NOT NULL,
  `summary` text NOT NULL,
  PRIMARY KEY (`researchPaperID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ResearchPaper`
--

LOCK TABLES `ResearchPaper` WRITE;
/*!40000 ALTER TABLE `ResearchPaper` DISABLE KEYS */;
/*!40000 ALTER TABLE `ResearchPaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeminarAttend`
--

DROP TABLE IF EXISTS `SeminarAttend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeminarAttend` (
  `seminarAttendID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `month` varchar(45) NOT NULL,
  `year` varchar(4) NOT NULL,
  `title` varchar(45) NOT NULL,
  `seminarHead` varchar(45) NOT NULL,
  `venue` varchar(45) NOT NULL,
  PRIMARY KEY (`seminarAttendID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeminarAttend`
--

LOCK TABLES `SeminarAttend` WRITE;
/*!40000 ALTER TABLE `SeminarAttend` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeminarAttend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SeminarConduct`
--

DROP TABLE IF EXISTS `SeminarConduct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SeminarConduct` (
  `seminarConductID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `month` varchar(45) NOT NULL,
  `year` varchar(4) NOT NULL,
  `position` varchar(45) NOT NULL,
  `title` varchar(45) NOT NULL,
  `seminarHead` varchar(45) NOT NULL,
  `venue` varchar(45) NOT NULL,
  PRIMARY KEY (`seminarConductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SeminarConduct`
--

LOCK TABLES `SeminarConduct` WRITE;
/*!40000 ALTER TABLE `SeminarConduct` DISABLE KEYS */;
/*!40000 ALTER TABLE `SeminarConduct` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Telephone`
--

DROP TABLE IF EXISTS `Telephone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Telephone` (
  `telephoneID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `telNum` varchar(20) NOT NULL,
  PRIMARY KEY (`telephoneID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Telephone`
--

LOCK TABLES `Telephone` WRITE;
/*!40000 ALTER TABLE `Telephone` DISABLE KEYS */;
/*!40000 ALTER TABLE `Telephone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `User`
--

DROP TABLE IF EXISTS `User`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `User` (
  `userID` int(11) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(45) NOT NULL,
  `middleInitial` varchar(45) NOT NULL,
  `lastName` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `objective` text,
  `background` text NOT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `userID_UNIQUE` (`userID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `User`
--

LOCK TABLES `User` WRITE;
/*!40000 ALTER TABLE `User` DISABLE KEYS */;
/*!40000 ALTER TABLE `User` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WorkExp`
--

DROP TABLE IF EXISTS `WorkExp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `WorkExp` (
  `workExpID` int(11) NOT NULL AUTO_INCREMENT,
  `userID` int(11) NOT NULL,
  `monthStart` varchar(45) NOT NULL,
  `yearStart` varchar(4) NOT NULL,
  `monthFin` varchar(45) NOT NULL,
  `yearFin` varchar(4) NOT NULL,
  `position` varchar(45) NOT NULL,
  `company` varchar(45) NOT NULL,
  `workDone` text NOT NULL,
  PRIMARY KEY (`workExpID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WorkExp`
--

LOCK TABLES `WorkExp` WRITE;
/*!40000 ALTER TABLE `WorkExp` DISABLE KEYS */;
/*!40000 ALTER TABLE `WorkExp` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-06-10 21:12:10
