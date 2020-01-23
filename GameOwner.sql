-- MariaDB dump 10.17  Distrib 10.4.11-MariaDB, for Win64 (AMD64)
--
-- Host: 127.0.0.1    Database: gameowner
-- ------------------------------------------------------
-- Server version	10.4.11-MariaDB

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
-- Table structure for table `gameslist`
--

DROP TABLE IF EXISTS `gameslist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gameslist` (
  `id_game` int(11) NOT NULL AUTO_INCREMENT,
  `game_name` varchar(30) NOT NULL,
  `price` int(11) NOT NULL,
  `genres` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gameslist`
--

LOCK TABLES `gameslist` WRITE;
/*!40000 ALTER TABLE `gameslist` DISABLE KEYS */;
INSERT INTO `gameslist` VALUES (1,'Bioshock',80,'Action'),(2,'Lol',0,'Moba'),(3,'Cs Go',0,'Fps'),(4,'Terraria',14,'adventure'),(5,'Tlou',12,'Survival'),(6,'Infamous Second Son',12,'Action/Adventure'),(7,'The Witcher 3',30,'Action'),(8,'Dying Light',30,'Survival horror'),(9,'Resident evil 2 remake',35,'Survival horror'),(10,'Dark souls 3',60,'Action'),(11,'Radiata stories',50,'Action RPG Adventure');
/*!40000 ALTER TABLE `gameslist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `havethatgame`
--

DROP TABLE IF EXISTS `havethatgame`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `havethatgame` (
  `id_user` int(11) NOT NULL,
  `id_game` int(11) NOT NULL,
  KEY `id_user` (`id_user`),
  KEY `id_game` (`id_game`),
  CONSTRAINT `havethatgame_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`),
  CONSTRAINT `havethatgame_ibfk_2` FOREIGN KEY (`id_game`) REFERENCES `gameslist` (`id_game`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `havethatgame`
--

LOCK TABLES `havethatgame` WRITE;
/*!40000 ALTER TABLE `havethatgame` DISABLE KEYS */;
INSERT INTO `havethatgame` VALUES (9,11),(9,5),(9,7),(9,6),(3,6),(3,7),(3,1),(3,8),(10,11),(10,4),(9,2),(7,5),(7,6),(2,1),(2,2),(2,4),(4,4),(4,5);
/*!40000 ALTER TABLE `havethatgame` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(30) NOT NULL,
  `email` varchar(30) NOT NULL,
  `login` varchar(30) NOT NULL,
  `Userpassword` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL DEFAULT 'Brasil',
  `favorite_game` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_user`),
  KEY `favorite_game` (`favorite_game`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`favorite_game`) REFERENCES `gameslist` (`id_game`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Edward','edgamer@anymail.com','Striker','fauhyUFHYAUFASIIUisdu@','Brasil',3),(2,'Jack Russel','JR2005@anymail.com','Arbitrator','aufhufwnuvwh@aieq','EUA',11),(3,'Victor ','cadark@anymail.com','Altres','EOLORONEO#$T#45','Japan',5),(4,'Solerion','SlSun@anymail.com','Woltrs','erigejiejq5a7$#@','Australia',7),(5,'Triton','Altr@anymail.com','Velks','fei2juiu4i@##','Brasil',3),(6,'Roger','Zekron@anymail.com','Alvs','aqidjqiqi@miadm','EUA',6),(7,'Icerbert','deltrb@anymail.com','aof3','icerdarktrist@telorus','Groeland',8),(8,'Gowain','KingofTheDay@anymail.com','Ganz','LionSmashRoyale@atk','EUA',11),(9,'Vinicius G','AnyGamer@anymail.com','Login','User#password!no!Obvious','Brasil',11),(10,'Elwen','TheaterVacoon@anymail.com','Avcoor','HolyGranSword','EUA',11);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gameowner'
--

--
-- Dumping routines for database 'gameowner'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-01-23 11:55:40
