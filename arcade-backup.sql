-- MariaDB dump 10.19  Distrib 10.6.16-MariaDB, for debian-linux-gnu (aarch64)
--
-- Host: localhost    Database: arcade1
-- ------------------------------------------------------
-- Server version	10.6.16-MariaDB-0ubuntu0.22.04.1

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
-- Table structure for table `achievement`
--

DROP TABLE IF EXISTS `achievement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `achievement` (
  `player_id` int(11) NOT NULL,
  `achievement_number` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`player_id`,`achievement_number`),
  CONSTRAINT `FK_player_achievement` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `achievement`
--

LOCK TABLES `achievement` WRITE;
/*!40000 ALTER TABLE `achievement` DISABLE KEYS */;
/*!40000 ALTER TABLE `achievement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friend_request`
--

DROP TABLE IF EXISTS `friend_request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friend_request` (
  `player_id1` int(11) NOT NULL,
  `player_id2` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `status` varchar(10) NOT NULL,
  PRIMARY KEY (`player_id1`,`player_id2`,`date`),
  KEY `FK_player_friend_request2` (`player_id2`),
  CONSTRAINT `FK_player_friend_request1` FOREIGN KEY (`player_id1`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_player_friend_request2` FOREIGN KEY (`player_id2`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friend_request`
--

LOCK TABLES `friend_request` WRITE;
/*!40000 ALTER TABLE `friend_request` DISABLE KEYS */;
INSERT INTO `friend_request` VALUES (1,3,'2024-04-21 04:30:20','PENDING'),(2,3,'2024-04-18 22:09:05','PENDING');
/*!40000 ALTER TABLE `friend_request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `player_id1` int(11) NOT NULL,
  `player_id2` int(11) NOT NULL,
  PRIMARY KEY (`player_id1`,`player_id2`),
  KEY `FK_player_friends2` (`player_id2`),
  CONSTRAINT `FK_player_friends1` FOREIGN KEY (`player_id1`) REFERENCES `player` (`id`),
  CONSTRAINT `FK_player_friends2` FOREIGN KEY (`player_id2`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (1,2),(2,4);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `email` varchar(50) NOT NULL,
  `registration_date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
INSERT INTO `player` VALUES (1,'test','$2y$10$Zh2v7q8jTb47.TRkuwXAoOEWScCjBujJbVQjFcQkYxc2EsOFLNgYi','test@test.com','2024-04-18 13:03:34'),(2,'test2','$2y$10$s5B8Nd0SltvZGS99.OMIa.1fuzyMkQtotnXhFOfYp0DtEHM10KXOa','asd@asd.com','2024-04-18 13:12:47'),(3,'test3','$2y$10$CXNMzo/tm0BUH.tnOCWwk.g310GJndZOSdx5kKUqjTck3LBVlzSGW','asd@asd.com','2024-04-18 13:14:12'),(4,'hash','$2y$10$wt4tXTjXAEnePLe1b2hdXe6Mlx/6Q0CMHPUnCLbBSChl04j6L2z0S','test@hash.com','2024-04-18 13:41:25'),(5,'testa','$2y$10$7CEsHzaZhFo1CdW6ZxX8zu/kDY0ngA9jdxCPrpSQG30xT21gGRvdO','test@test.com','2024-04-18 21:13:23'),(6,'testuser','$2y$10$k7b4EQ1ECzMcoWb7h2HuOO4Ukbo/Jsd21P4U5dpPRXRHu0PExXeXm','test@test.com','2024-04-21 00:27:21'),(7,'Robkill108','$2y$10$zFrdvsvo7ahve6Xz7exUwOGtEqR6bgR5uwOv.tEJG5VcZ8.Y/h3U2','','2024-04-22 01:20:09'),(8,'','$2y$10$LVVTe/yKpY.XM4He3oyJZec/tZLHh0/Q6Yl8L3VkIob6IaouQNVry','','2024-04-26 06:06:47'),(9,'asy210000','$2y$10$Nmofn4x8qkU6KKeItfPLpedOyhdidWu4sEplX2FgCcWhfV2heQOkC','asy210000@ut.edu','2024-04-28 15:02:38');
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scoreboard`
--

DROP TABLE IF EXISTS `scoreboard`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scoreboard` (
  `player_id` int(11) NOT NULL,
  `session_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `game` varchar(50) NOT NULL,
  `play_time` int(11) NOT NULL,
  `date` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`player_id`,`session_id`),
  CONSTRAINT `FK_player_scoreboard` FOREIGN KEY (`player_id`) REFERENCES `player` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scoreboard`
--

LOCK TABLES `scoreboard` WRITE;
/*!40000 ALTER TABLE `scoreboard` DISABLE KEYS */;
INSERT INTO `scoreboard` VALUES (1,1,100,'test',1000,'2024-04-18 17:11:30'),(1,2,1000,'test',1000,'2024-04-18 17:17:28'),(1,3,9999,'fakegame',1000,'2024-04-20 02:40:21'),(1,4,1337,'test',1111,'2024-04-21 03:27:23'),(1,5,100,'test',200,'2024-04-26 23:58:48'),(1,6,100,'test',1,'2024-04-26 23:58:55'),(1,7,1000,'test',100,'2024-04-28 14:36:37'),(1,8,1000,'test',100,'2024-04-28 14:38:05'),(2,1,2000,'test',1000,'2024-04-18 22:00:17'),(2,2,200,'test',1000,'2024-04-18 22:00:40'),(2,3,100,'test',3,'2024-04-27 00:02:47'),(2,4,1000,'test',3,'2024-04-27 00:08:12'),(2,5,1000,'test',3,'2024-04-28 14:42:37'),(2,6,1000,'test',3,'2024-04-28 14:44:41'),(2,7,1000,'test',3,'2024-04-28 14:46:31'),(2,8,1000,'test',3,'2024-04-28 14:50:28'),(3,1,1337,'test',1111,'2024-04-21 03:32:00'),(3,2,9999,'INVADERS',99,'2024-04-28 14:51:54'),(3,3,9999,'INVADERS',99,'2024-04-29 05:24:50'),(3,4,9999,'INVADERS',100,'2024-04-29 05:38:12'),(3,5,99,'invaders',99,'2024-04-29 05:45:29'),(5,1,9999,'INVADERS',99,'2024-04-29 05:24:43'),(9,1,9999,'INVADERS',99,'2024-04-29 05:24:47'),(9,2,200,'Cosmic Invaders',5,'2024-04-29 06:19:15'),(9,3,200,'Cosmic Invaders',4,'2024-04-29 06:19:28'),(9,4,150,'Cosmic Invaders',4,'2024-04-29 06:20:11'),(9,5,500,'Cosmic Invaders',10,'2024-04-29 06:20:18'),(9,6,350,'Cosmic Invaders',4,'2024-04-29 06:25:48'),(9,7,200,'Cosmic Invaders',4,'2024-04-29 06:27:44'),(9,8,200,'Cosmic Invaders',4,'2024-04-29 06:55:58'),(9,9,250,'Cosmic Invaders',4,'2024-04-29 08:32:37'),(9,10,300,'Cosmic Invaders',5,'2024-04-29 08:32:53'),(9,11,250,'Cosmic Invaders',5,'2024-04-29 15:02:26'),(9,12,200,'Cosmic Invaders',6,'2024-04-29 15:04:01'),(9,13,200,'Cosmic Invaders',6,'2024-04-29 15:04:01'),(9,14,100,'Cosmic Invaders',6,'2024-04-29 15:09:01'),(9,15,200,'Cosmic Invaders',5,'2024-04-29 15:11:04'),(9,16,300,'Cosmic Invaders',5,'2024-04-29 15:35:29'),(9,17,250,'Cosmic Invaders',5,'2024-04-29 16:07:39'),(9,18,200,'Cosmic Invaders',5,'2024-04-29 16:13:15'),(9,19,200,'Cosmic Invaders',4,'2024-04-29 16:15:46'),(9,20,200,'Cosmic Invaders',4,'2024-04-29 16:34:10'),(9,21,350,'Cosmic Invaders',5,'2024-04-29 16:42:27'),(9,22,200,'Cosmic Invaders',4,'2024-04-29 16:46:03'),(9,23,250,'Cosmic Invaders',4,'2024-04-29 16:46:33'),(9,24,150,'Cosmic Invaders',4,'2024-04-29 16:47:03'),(9,25,100,'Cosmic Invaders',5,'2024-04-29 16:48:25'),(9,26,200,'Cosmic Invaders',5,'2024-04-29 16:50:27'),(9,27,200,'Cosmic Invaders',5,'2024-04-29 16:53:23'),(9,28,200,'Cosmic Invaders',4,'2024-04-29 17:11:42'),(9,29,200,'Cosmic Invaders',4,'2024-04-29 17:13:12'),(9,30,200,'Cosmic Invaders',5,'2024-04-29 17:18:04'),(9,31,200,'Cosmic Invaders',5,'2024-04-29 17:19:32'),(9,32,150,'Cosmic Invaders',4,'2024-04-29 17:30:29'),(9,33,250,'Cosmic Invaders',5,'2024-04-29 17:32:09');
/*!40000 ALTER TABLE `scoreboard` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-04-29 18:40:50
