-- MySQL dump 10.13  Distrib 5.5.49, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: personal_info
-- ------------------------------------------------------
-- Server version	5.5.49-0ubuntu0.14.04.1

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
-- Table structure for table `child_info`
--

DROP TABLE IF EXISTS `child_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `child_info` (
  `childId` int(11) NOT NULL AUTO_INCREMENT,
  `rollNo` varchar(100) DEFAULT NULL,
  `childName` varchar(50) DEFAULT NULL,
  `aboutChild` varchar(100) DEFAULT NULL,
  `childPhotoPath` varchar(100) DEFAULT NULL,
  `updatedBy` varchar(20) DEFAULT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`childId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `child_info`
--

LOCK TABLES `child_info` WRITE;
/*!40000 ALTER TABLE `child_info` DISABLE KEYS */;
INSERT INTO `child_info` VALUES (1,'87EC101','Ravi','asdfasdf','',NULL,'2016-07-01 21:01:54'),(2,'87EC101','Jhonny','asdfasdf','https://alumini-public-images.s3.amazonaws.com/5e608568e19d497689faafe3aa1daffe',NULL,'2016-07-01 21:02:18'),(3,'87EC101','child 1','descc child1','https://alumini-public-images.s3.amazonaws.com/b4c59ebba6bc4422818a5da64d4bb376',NULL,'2016-07-03 13:44:12'),(4,'87EC101','test child1','test child desc ','https://alumini-public-images.s3.amazonaws.com/c7231bd43d884f1e9dade0cf496f5089',NULL,'2016-07-03 14:00:14'),(5,'87EC101','test 3',' test 3 desc','https://alumini-public-images.s3.amazonaws.com/231f2474e13a415db40b8071bb33f830',NULL,'2016-07-03 14:08:00'),(6,'87EC101','test 2','test 2 desc ','https://alumini-public-images.s3.amazonaws.com/32fdf12d58324a49aa5be03e054f9a56',NULL,'2016-07-03 14:08:02'),(7,'87EC101',NULL,NULL,'https://alumini-public-images.s3.amazonaws.com/30ba94a220a246e58eafde9d1ecfa1d2',NULL,'2016-07-03 14:55:00'),(8,'87EC140','child1 ','this is some other child','https://alumini-public-images.s3.amazonaws.com/6bd6ef4582054b8ca014e7906a4ed67b',NULL,'2016-07-03 17:54:44'),(9,'87EC140','child data 2','desc about second child','https://alumini-public-images.s3.amazonaws.com/df9fb7ec7c11497c9c2e994077d92c9c',NULL,'2016-07-03 17:58:18');
/*!40000 ALTER TABLE `child_info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `events`
--

DROP TABLE IF EXISTS `events`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `events` (
  `eventId` int(11) NOT NULL AUTO_INCREMENT,
  `eventName` varchar(20) DEFAULT NULL,
  `eventDescription` varchar(200) DEFAULT NULL,
  `eventDate` datetime DEFAULT NULL,
  `updatedBy` varchar(200) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `eventPhotosPath` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`eventId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `events`
--

LOCK TABLES `events` WRITE;
/*!40000 ALTER TABLE `events` DISABLE KEYS */;
INSERT INTO `events` VALUES (1,'pavan','asdfasdf asdfasdf','2017-04-07 00:00:00','RRRRRR','2016-07-02 00:08:11','https://alumini-public-images.s3.amazonaws.com/21ae723b90514186bcd4e5dc723fdb55'),(2,'','safasdfasdfas','2017-04-07 00:00:00','RRRRRR','2016-07-02 00:57:00','https://alumini-public-images.s3.amazonaws.com/1a1427b7e9904b1e96169c721b5f33e4'),(3,'Java','safasdfasdfas','2017-04-07 00:00:00','RRRRRR','2016-07-02 00:57:07','https://alumini-public-images.s3.amazonaws.com/79f2ad1643704517834e415c9b3a370f'),(4,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:22:52','https://alumini-public-images.s3.amazonaws.com/23085ab3c8154a3a966e605d23d741c7'),(5,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:22:54','https://alumini-public-images.s3.amazonaws.com/7db34ab409914d57a6d55fb2aafaf4e7'),(6,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:22:57','https://alumini-public-images.s3.amazonaws.com/ea5b66a6c1c14d498df9727849103296'),(7,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:12','https://alumini-public-images.s3.amazonaws.com/5d13c63c109144f0af13dc933f9ea770'),(8,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:13','https://alumini-public-images.s3.amazonaws.com/5ba95101e6074e1c9dbcc495c8dd63c4'),(9,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:14','https://alumini-public-images.s3.amazonaws.com/ae6745de07644c0fae3d3235ecee4640'),(10,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:14','https://alumini-public-images.s3.amazonaws.com/e125595be01e4369943f408a8d78a7c4'),(11,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:15','https://alumini-public-images.s3.amazonaws.com/52d34efdaf4040e9b801fb247f462744'),(12,'gfhg','sdfghjk\r\nl','2017-08-07 00:00:00','RRRRRR','2016-07-02 10:23:33','https://alumini-public-images.s3.amazonaws.com/2729393670b64e318f2b44ed2d2dd809'),(13,'sdfgsdffg','asdf asdfasd','2016-09-07 00:00:00','RRRRRR','2016-07-02 11:59:25','https://alumini-public-images.s3.amazonaws.com/b492ca3e12d7407cadb5f64bf02a2a3b'),(14,'pavan','afdasdfasdffds','2016-09-07 00:00:00','RRRRRR','2016-07-02 14:06:58','https://alumini-public-images.s3.amazonaws.com/12358782e7cc4b55baf1d23281ad2ffb');
/*!40000 ALTER TABLE `events` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faculty_Info`
--

DROP TABLE IF EXISTS `faculty_Info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty_Info` (
  `facultyId` int(10) NOT NULL DEFAULT '0',
  `year` varchar(20) DEFAULT NULL,
  `subject` varchar(200) DEFAULT NULL,
  `facultyName` varchar(200) DEFAULT NULL,
  `facultyPhotoPath` varchar(200) DEFAULT NULL,
  `aboutFaculty` varchar(200) DEFAULT NULL,
  `contact` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `updatedBy` varchar(100) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  PRIMARY KEY (`facultyId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faculty_Info`
--

LOCK TABLES `faculty_Info` WRITE;
/*!40000 ALTER TABLE `faculty_Info` DISABLE KEYS */;
INSERT INTO `faculty_Info` VALUES (1,'1987-91','Principal','B C Rao','https://alumini-public-images.s3.amazonaws.com/02b8de6239ce43e197108340bf35015c','AFSDF ASFAS FASDF  ASD FASDF ASFAS FAS FASDDFASDDF ASFASDD FASF ASFASD','9879999999','yogo@gmail.co',NULL,NULL),(2,'1987-91','HOD','Vijaya Lakshmi',NULL,NULL,NULL,NULL,NULL,NULL),(3,'1st Year','Mathematics - I','Ram Mohan',NULL,NULL,NULL,NULL,NULL,NULL),(4,'1st Year','Mathematics - II','Swamy Raj',NULL,NULL,NULL,NULL,NULL,NULL),(5,'1st Year','Physics - I','Samuel',NULL,NULL,NULL,NULL,NULL,NULL),(6,'1st Year','Chemistry','',NULL,NULL,NULL,NULL,NULL,NULL),(7,'1st Year','English','',NULL,NULL,NULL,NULL,NULL,NULL),(8,'1st Year','Computer Programming','',NULL,NULL,NULL,NULL,NULL,NULL),(9,'1st Year','Engineering Machanics','Diwakar',NULL,NULL,NULL,NULL,NULL,NULL),(10,'1st Year','Engineering Graphics','Vasu Deva Rao',NULL,NULL,NULL,NULL,NULL,NULL),(11,'2nd Year','Mathematics - III','Ram Mohan',NULL,NULL,NULL,NULL,NULL,NULL),(12,'2nd Year','Mathematics - IV','Swamy Raj',NULL,NULL,NULL,NULL,NULL,NULL),(13,'2nd Year','Physics - II','Samuel',NULL,NULL,NULL,NULL,NULL,NULL),(14,'2nd Year','Industrial Ecoomics and Management','',NULL,NULL,NULL,NULL,NULL,NULL),(15,'2nd Year','Circuit Theory','',NULL,NULL,NULL,NULL,NULL,NULL),(16,'2nd Year','Electronic Engineering - I','Jayadev/vijayalakshmi',NULL,NULL,NULL,NULL,NULL,NULL),(17,'2nd Year','Mechanical Technology','',NULL,NULL,NULL,NULL,NULL,NULL),(18,'2nd Year','Electrical Technology','Anuradha',NULL,NULL,NULL,NULL,NULL,NULL),(19,'3rd Year','Control Systems','',NULL,NULL,NULL,NULL,NULL,NULL),(20,'3rd Year','Singnals and Systems','aa','https://alumini-public-images.s3.amazonaws.com/e35673d2884846e7adf62ecbe0266919','aaaaaaaa','aaaa','aa@aaa.com',NULL,NULL),(21,'3rd Year','Electronic Engineering - II','Vijayalakshmi',NULL,NULL,NULL,NULL,NULL,NULL),(22,'3rd Year','Pulse Digital Switching Ciricuits','Nagendra Babu',NULL,NULL,NULL,NULL,NULL,NULL),(23,'3rd Year','Integrated Circuit  Applications','Khan',NULL,NULL,NULL,NULL,NULL,NULL),(24,'3rd Year','Elctromagnetic Fields  Waves','Paramahamsa',NULL,NULL,NULL,NULL,NULL,NULL),(25,'3rd Year','Net Works and Transmission Lines','Sai Baba',NULL,NULL,NULL,NULL,NULL,NULL),(26,'3rd Year','Communication Engineering','',NULL,NULL,NULL,NULL,NULL,NULL),(27,'4th Year','Micro Processors Applications','Sai Baba',NULL,NULL,NULL,NULL,NULL,NULL),(28,'4th Year','Power Electronics','Nagendra Babu',NULL,NULL,NULL,NULL,NULL,NULL),(29,'4th Year','Computer Technology','',NULL,NULL,NULL,NULL,NULL,NULL),(30,'4th Year','Electronic Measurement instrumentation','',NULL,NULL,NULL,NULL,NULL,NULL),(31,'4th Year','Communication Systems','',NULL,NULL,NULL,NULL,NULL,NULL),(32,'4th Year','Antennas and Wave Propagation','B S N Reddy',NULL,NULL,NULL,NULL,NULL,NULL),(33,'4th Year','Micro Wave Engineering Radar','Bala Krishna',NULL,NULL,NULL,NULL,NULL,NULL),(34,'4th Year','Television Engineering','T Srinivasa Rao1111111',NULL,'11111','1111111111111111','11',NULL,NULL);
/*!40000 ALTER TABLE `faculty_Info` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `family_images`
--

DROP TABLE IF EXISTS `family_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `family_images` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rollNo` varchar(20) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `updatedBy` varchar(20) DEFAULT NULL,
  `imagePath` varchar(255) DEFAULT NULL,
  `isPublic` tinyint(4) DEFAULT NULL,
  `updatedDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `family_images`
--

LOCK TABLES `family_images` WRITE;
/*!40000 ALTER TABLE `family_images` DISABLE KEYS */;
INSERT INTO `family_images` VALUES (1,'87EC101','this is sample ','87EC101','https://alumini-public-images.s3.amazonaws.com/5e608568e19d497689faafe3aa1daffe',1,'2016-07-02 14:42:28'),(2,'87EC101','this is sample2 ','87EC101','https://alumini-public-images.s3.amazonaws.com/5e608568e19d497689faafe3aa1daffe',1,'2016-07-02 14:42:51'),(3,'87EC101',NULL,'87EC101','https://alumini-public-images.s3.amazonaws.com/52b8ec1b992f4d59be75cdf2bf90ea25',1,'2016-07-03 15:13:35'),(6,'87EC101','test desc ','87EC101','https://alumini-public-images.s3.amazonaws.com/368712acd04d4313b62cdc3acd3725b7',1,'2016-07-03 15:20:28'),(7,'87EC101','asdfasdf','87EC101','https://alumini-public-images.s3.amazonaws.com/1fb5ac9ad7674971812beae88b9e37d1',1,'2016-07-03 15:25:54'),(8,'87EC101','AAAAAAAAAAAA','87EC101','https://alumini-public-images.s3.amazonaws.com/33043c41b54748588deb94234483be1e',1,'2016-07-03 15:26:22'),(9,'87EC101','qwertyuiop asdfghjkl zxcvbnm','87EC101','https://alumini-public-images.s3.amazonaws.com/88f0e2a14d5e49f496d285cf44e1577c',1,'2016-07-03 17:58:55'),(10,'87EC101','qwertyuiop asdfghjkl zxcvbnm','87EC101','https://alumini-public-images.s3.amazonaws.com/1772e5c752594a42ba9ec92ca1828689',1,'2016-07-03 17:58:56'),(11,'87EC101','asdfghjqwertyunertyu sdfghj','87EC101','https://alumini-public-images.s3.amazonaws.com/2f40a28531f34f91ba2a784f8c735cb3',1,'2016-07-03 18:00:29'),(12,'87EC140','qwertyui sdfghjk zxcvbnm ','87EC140','https://alumini-public-images.s3.amazonaws.com/170b54dc01f74f39b781924d00c505a3',1,'2016-07-03 18:06:39'),(13,'87EC140','qwertyui sdfghjk zxcvbnm ','87EC140','https://alumini-public-images.s3.amazonaws.com/3f0a95e5932f4a2ba96f9202e09f726e',1,'2016-07-03 18:06:39');
/*!40000 ALTER TABLE `family_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_info`
--

DROP TABLE IF EXISTS `personal_info`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personal_info` (
  `rollNo` varchar(50) NOT NULL,
  `password` varchar(20) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `email` varchar(200) DEFAULT NULL,
  `contactNo` varchar(20) DEFAULT NULL,
  `dob` varchar(20) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `aboutYou` text,
  `spouseName` varchar(200) DEFAULT NULL,
  `aboutSouse` varchar(200) DEFAULT NULL,
  `updatedBy` varchar(100) DEFAULT NULL,
  `updatedDate` datetime DEFAULT NULL,
  `new_photo_path` varchar(255) DEFAULT NULL,
  `old_photo_path` varchar(255) DEFAULT NULL,
  `isVerified` int(4) DEFAULT '0',
  `spousePhoto` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`rollNo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_info`
--

LOCK TABLES `personal_info` WRITE;
/*!40000 ALTER TABLE `personal_info` DISABLE KEYS */;
INSERT INTO `personal_info` VALUES ('87EC101','287045','pavan Tammineni','tammineni.pavan@gmail.com','7411184869',NULL,'banglore','India,India','test 1234....','test 123','fasdfa sdfasdf ','87EC101',NULL,'https://alumini-public-images.s3.amazonaws.com/356d29e6ddf2440e9d7a1923287a53bb','https://alumini-public-images.s3.amazonaws.com/d0121ab1335d47e6a61fa302095c9c87',0,'https://alumini-public-images.s3.amazonaws.com/85cc0c3759f14a3a80adb259ddf04b10'),('87EC103','974449','Hari Narayana','tammineni.pavan@gmail.com','7411184869',NULL,'banglore','India,India','qwertyuiopp lkjhgfdsaa zxcvbnm','spouse1','test spouse','87EC103',NULL,'https://alumini-public-images.s3.amazonaws.com/4adec7c13cda40ec93ea4858fdb751fa','https://alumini-public-images.s3.amazonaws.com/381d0659e0ee45c3b56c738fb04d1e31',0,'https://alumini-public-images.s3.amazonaws.com/e950095d5da5470db5fe2a3bc0ebb2c6'),('87EC140','838171','Srinivas Dova','yogendra.andraju@gmail.com','9876545670',NULL,'Bangalore','India,India','this is the sample account','direct 2','this is something new','87EC140',NULL,'https://alumini-public-images.s3.amazonaws.com/95b5b8b36be04ab1b7e9a41e39f4377b','https://alumini-public-images.s3.amazonaws.com/583fba73a1b048c89362d50698c56d5b',1,'https://alumini-public-images.s3.amazonaws.com/9961335b517444788ce632c82853e5a1');
/*!40000 ALTER TABLE `personal_info` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-07-05 20:47:58
