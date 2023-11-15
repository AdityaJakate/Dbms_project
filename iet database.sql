CREATE DATABASE  IF NOT EXISTS `iet2` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `iet2`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: iet2
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `accomidation`
--

DROP TABLE IF EXISTS `accomidation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accomidation` (
  `StationId` int NOT NULL,
  `DriverId` int NOT NULL,
  `Date` date NOT NULL,
  `RoomNumber` smallint DEFAULT NULL,
  PRIMARY KEY (`StationId`,`DriverId`,`Date`),
  KEY `DriverId` (`DriverId`),
  CONSTRAINT `Accomidation_ibfk_1` FOREIGN KEY (`StationId`) REFERENCES `stations` (`StationId`),
  CONSTRAINT `Accomidation_ibfk_2` FOREIGN KEY (`DriverId`) REFERENCES `drivers` (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accomidation`
--

LOCK TABLES `accomidation` WRITE;
/*!40000 ALTER TABLE `accomidation` DISABLE KEYS */;
INSERT INTO `accomidation` VALUES (1,1,'2023-01-01',101),(2,2,'2023-01-02',102),(3,3,'2023-01-03',103),(4,4,'2023-01-04',104),(5,5,'2023-01-05',105),(6,6,'2023-01-06',106),(7,7,'2023-01-07',107),(8,8,'2023-01-08',108),(9,9,'2023-01-09',109),(10,10,'2023-01-10',110);
/*!40000 ALTER TABLE `accomidation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `backup_trains`
--

DROP TABLE IF EXISTS `backup_trains`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `backup_trains` (
  `Train_id` int DEFAULT NULL,
  `RouteId` int DEFAULT NULL,
  KEY `Train_id` (`Train_id`),
  KEY `RouteId` (`RouteId`),
  CONSTRAINT `Backup_Trains_ibfk_1` FOREIGN KEY (`Train_id`) REFERENCES `train` (`Train_id`),
  CONSTRAINT `Backup_Trains_ibfk_2` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `backup_trains`
--

LOCK TABLES `backup_trains` WRITE;
/*!40000 ALTER TABLE `backup_trains` DISABLE KEYS */;
INSERT INTO `backup_trains` VALUES (1,1),(2,2),(3,3),(4,4),(5,5),(6,6),(7,7),(8,8),(9,9),(10,10);
/*!40000 ALTER TABLE `backup_trains` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bookings` (
  `BookingID` int NOT NULL,
  `PassengerID` int DEFAULT NULL,
  `RouteID` int DEFAULT NULL,
  `ScheduleID` int DEFAULT NULL,
  `BookingDate` date DEFAULT NULL,
  `TicketPrice` decimal(10,2) DEFAULT NULL,
  `DiscountType` varchar(20) DEFAULT NULL,
  `TravelAgentID` int DEFAULT NULL,
  `seatnumber` int DEFAULT NULL,
  `coachnumber` varchar(50) DEFAULT NULL,
  `IsCancelled` int DEFAULT NULL,
  PRIMARY KEY (`BookingID`),
  KEY `PassengerID` (`PassengerID`),
  KEY `RouteID` (`RouteID`),
  KEY `ScheduleID` (`ScheduleID`),
  KEY `TravelAgentID` (`TravelAgentID`),
  KEY `bbc` (`seatnumber`,`coachnumber`),
  CONSTRAINT `bbc` FOREIGN KEY (`seatnumber`, `coachnumber`) REFERENCES `seats` (`SeatNumber`, `CoachNumber`),
  CONSTRAINT `Bookings_ibfk_1` FOREIGN KEY (`PassengerID`) REFERENCES `passengers` (`PassengerID`),
  CONSTRAINT `Bookings_ibfk_2` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `Bookings_ibfk_3` FOREIGN KEY (`ScheduleID`) REFERENCES `trainschedules` (`ScheduleID`),
  CONSTRAINT `Bookings_ibfk_4` FOREIGN KEY (`TravelAgentID`) REFERENCES `travelagents` (`AgentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
INSERT INTO `bookings` VALUES (1,1,1,1,'2023-09-09',50.00,'None',1,NULL,NULL,NULL),(2,2,1,2,'2023-09-09',45.00,'None',1,1,'C101',NULL),(3,3,1,3,'2023-01-03',60.00,'None',NULL,1,'C101',NULL),(4,4,4,4,'2023-01-04',55.00,'None',NULL,1,'C101',NULL),(5,5,5,5,'2023-01-05',70.00,'None',4,1,'C101',NULL),(6,6,6,6,'2023-01-06',65.00,'None',6,1,'C101',NULL),(7,7,7,7,'2023-01-07',80.00,'None',7,1,'C101',1),(8,8,8,8,'2023-01-08',75.00,'None',8,1,'C101',NULL),(9,9,9,9,'2023-01-09',90.00,'None',9,1,'C101',NULL),(10,10,10,10,'2023-01-10',85.00,'None',10,1,'C101',NULL),(11,5,5,5,'2023-10-02',100.00,'None',4,1,'C101',NULL),(12,12,1,2,'2023-11-15',60.00,'child',NULL,1,'C301',NULL),(13,13,11,2,'2023-09-09',60.00,'child',1,2,'C301',1),(14,14,11,1,'2023-09-09',60.00,'child',1,3,'C301',NULL),(15,15,12,2,'2023-09-09',60.00,'Senior Citizen',1,4,'C301',NULL),(16,16,5,5,'2023-09-09',60.00,'Senior Citizen',1,5,'C301',1),(17,17,5,5,'2023-09-09',60.00,'Senior Citizen',1,2,'C101',NULL),(18,18,13,7,'2023-09-09',60.00,'None',1,3,'C101',1),(19,19,13,9,'2023-09-09',60.00,'None',1,4,'C104',NULL),(20,20,10,9,'2023-09-09',60.00,'None',1,5,'C105',NULL),(21,5,1,2,'2023-11-15',60.00,'None',NULL,1,'C301',NULL);
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `coaches`
--

DROP TABLE IF EXISTS `coaches`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `coaches` (
  `CoachNumber` varchar(10) NOT NULL,
  `Mileage` int DEFAULT NULL,
  `LastMaintenanceDate` date DEFAULT NULL,
  `NextMaintenanceDate` date DEFAULT NULL,
  `Train_id` int DEFAULT NULL,
  PRIMARY KEY (`CoachNumber`),
  KEY `tid` (`Train_id`),
  CONSTRAINT `tid` FOREIGN KEY (`Train_id`) REFERENCES `train` (`Train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `coaches`
--

LOCK TABLES `coaches` WRITE;
/*!40000 ALTER TABLE `coaches` DISABLE KEYS */;
INSERT INTO `coaches` VALUES ('C101',5000,'2022-12-01','2023-03-01',1),('C102',6000,'2022-11-15','2023-02-15',2),('C103',5500,'2022-10-20','2023-01-20',3),('C104',6200,'2022-09-25','2023-02-25',4),('C105',5300,'2022-08-30','2023-01-30',5),('C106',6100,'2022-07-05','2023-01-05',6),('C107',5400,'2022-06-10','2023-01-10',7),('C108',6300,'2022-05-15','2023-02-15',8),('C109',5200,'2022-04-20','2023-01-20',9),('C110',5900,'2022-03-25','2023-02-25',10),('C203',5000,'2020-10-12','2023-10-11',1),('C204',5000,'2020-10-12','2023-10-01',1),('C205',5000,'2020-10-12','2023-10-01',1),('C211',5000,'2020-10-12','2023-10-10',1),('C212',5000,'2020-10-12','2023-12-01',1),('C213',5000,'2020-10-12','2023-12-01',1),('C214',5000,'2020-11-12','2023-12-11',1),('C215',5000,'2020-11-12','2023-12-11',1),('C301',4000,'2023-09-01','2023-07-01',3),('C302',4000,'2023-09-01','2023-07-01',3),('C303',4000,'2023-09-01','2024-05-01',3),('C304',4000,'2023-09-01','2023-05-01',3);
/*!40000 ALTER TABLE `coaches` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `drivers`
--

DROP TABLE IF EXISTS `drivers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `drivers` (
  `DriverID` int NOT NULL,
  `DriverName` varchar(100) DEFAULT NULL,
  `ContactNumber` varchar(20) DEFAULT NULL,
  `CityOfResidence` varchar(100) DEFAULT NULL,
  `RestDay` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `drivers`
--

LOCK TABLES `drivers` WRITE;
/*!40000 ALTER TABLE `drivers` DISABLE KEYS */;
INSERT INTO `drivers` VALUES (1,'Amit Kumar','9876543210','Delhi','Sunday'),(2,'Priya Sharma','8765432109','Mumbai','Monday'),(3,'Rajesh Singh','7890123456','Bangalore','Tuesday'),(4,'Deepika Verma','8901234567','Chennai','Wednesday'),(5,'Vikas Patel','9012345678','Kolkata','Thursday'),(6,'Neha Gupta','7654321098','Hyderabad','Friday'),(7,'Ravi Verma','6543210987','Ahmedabad','Saturday'),(8,'Anjali Singh','5432109876','Pune','Sunday'),(9,'Sandeep Kumar','4321098765','Jaipur','Monday'),(10,'Kavita Patel','3210987654','Lucknow','Tuesday');
/*!40000 ALTER TABLE `drivers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `intermediatestations`
--

DROP TABLE IF EXISTS `intermediatestations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `intermediatestations` (
  `RouteId` int NOT NULL,
  `StationId` int NOT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DepartartureTime` time DEFAULT NULL,
  `Date` date DEFAULT NULL,
  PRIMARY KEY (`RouteId`,`StationId`),
  KEY `StationId` (`StationId`),
  CONSTRAINT `IntermediateStations_ibfk_1` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `IntermediateStations_ibfk_2` FOREIGN KEY (`StationId`) REFERENCES `stations` (`StationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `intermediatestations`
--

LOCK TABLES `intermediatestations` WRITE;
/*!40000 ALTER TABLE `intermediatestations` DISABLE KEYS */;
INSERT INTO `intermediatestations` VALUES (1,1,'08:00:00','08:05:00','2023-01-01'),(1,2,'10:00:00','10:05:00','2023-01-01'),(2,3,'12:00:00','12:05:00','2023-01-02'),(2,4,'14:00:00','14:05:00','2023-01-02'),(3,5,'16:00:00','16:05:00','2023-01-03'),(3,6,'18:00:00','18:05:00','2023-01-03'),(4,7,'20:00:00','20:05:00','2023-01-04'),(4,8,'22:00:00','22:05:00','2023-01-04'),(5,9,'00:00:00','00:05:00','2023-01-05'),(5,10,'02:00:00','02:05:00','2023-01-05');
/*!40000 ALTER TABLE `intermediatestations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `passengers`
--

DROP TABLE IF EXISTS `passengers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `passengers` (
  `PassengerID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `Age` int DEFAULT NULL,
  `ContactInformation` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`PassengerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `passengers`
--

LOCK TABLES `passengers` WRITE;
/*!40000 ALTER TABLE `passengers` DISABLE KEYS */;
INSERT INTO `passengers` VALUES (1,'Neha Gupta',28,'7890123456'),(2,'Rahul Verma',35,'8901234567'),(3,'Sonia Patel',22,'9012345678'),(4,'Vivek Singh',30,'7654321098'),(5,'Pooja Sharma',45,'6543210987'),(6,'Rajat Kumar',32,'5432109876'),(7,'Anita Verma',28,'4321098765'),(8,'Alok Singh',40,'3210987654'),(9,'Swati Patel',26,'2109876543'),(10,'Deepak Verma',35,'1098765432'),(11,'Aditya Jakate',24,'1545956832'),(12,'Rohit Sah',5,'1545956832'),(13,'Prince Kewatkar',4,'1545956832'),(14,'Simrun ',2,'1545956832'),(15,'Sreelakshmi',70,'1545956832'),(16,'Ayush',66,'1545956832'),(17,'Akshay',84,'1545956832'),(18,'Rohit',30,'1545956832'),(19,'Sam ',25,'1545956832'),(20,'Aditya',21,'1545956832');
/*!40000 ALTER TABLE `passengers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routeactivedays`
--

DROP TABLE IF EXISTS `routeactivedays`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routeactivedays` (
  `RouteId` int NOT NULL,
  `ActiveDay` varchar(50) NOT NULL,
  PRIMARY KEY (`RouteId`,`ActiveDay`),
  CONSTRAINT `RouteActiveDays_ibfk_1` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routeactivedays`
--

LOCK TABLES `routeactivedays` WRITE;
/*!40000 ALTER TABLE `routeactivedays` DISABLE KEYS */;
INSERT INTO `routeactivedays` VALUES (1,'Monday'),(1,'Wednesday'),(2,'Thursday'),(2,'Tuesday'),(3,'Friday'),(3,'Sunday'),(4,'Monday'),(4,'Saturday'),(5,'Sunday'),(5,'Tuesday');
/*!40000 ALTER TABLE `routeactivedays` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `routes`
--

DROP TABLE IF EXISTS `routes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `routes` (
  `RouteID` int NOT NULL,
  `OriginId` int DEFAULT NULL,
  `DestinationId` int DEFAULT NULL,
  `Distance` int DEFAULT NULL,
  `TravelTime` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`RouteID`),
  KEY `OriginId` (`OriginId`),
  KEY `DestinationId` (`DestinationId`),
  CONSTRAINT `routes_ibfk_1` FOREIGN KEY (`OriginId`) REFERENCES `stations` (`StationId`),
  CONSTRAINT `routes_ibfk_2` FOREIGN KEY (`DestinationId`) REFERENCES `stations` (`StationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `routes`
--

LOCK TABLES `routes` WRITE;
/*!40000 ALTER TABLE `routes` DISABLE KEYS */;
INSERT INTO `routes` VALUES (1,1,2,1200,'16 hours'),(2,3,4,800,'10 hours'),(3,5,6,1600,'20 hours'),(4,7,8,600,'8 hours'),(5,9,10,500,'6 hours'),(6,4,3,500,'3 hours'),(7,1,7,500,'3 hours'),(8,7,1,500,'3 hours'),(9,8,3,500,'3 hours'),(10,6,8,500,'3 hours'),(11,20,21,1062,'10 hours 45 minutes'),(12,21,20,1062,'10 hours 45 minutes'),(13,2,1,588,'6 hours ');
/*!40000 ALTER TABLE `routes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seats`
--

DROP TABLE IF EXISTS `seats`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `seats` (
  `SeatNumber` int NOT NULL,
  `CoachNumber` varchar(50) NOT NULL,
  PRIMARY KEY (`SeatNumber`,`CoachNumber`),
  KEY `CoachNumber` (`CoachNumber`),
  CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`CoachNumber`) REFERENCES `coaches` (`CoachNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seats`
--

LOCK TABLES `seats` WRITE;
/*!40000 ALTER TABLE `seats` DISABLE KEYS */;
INSERT INTO `seats` VALUES (1,'C101'),(2,'C101'),(3,'C101'),(2,'C102'),(3,'C103'),(4,'C104'),(5,'C105'),(6,'C106'),(7,'C107'),(8,'C108'),(9,'C109'),(10,'C110'),(1,'C301'),(2,'C301'),(3,'C301'),(4,'C301'),(5,'C301');
/*!40000 ALTER TABLE `seats` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stations`
--

DROP TABLE IF EXISTS `stations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stations` (
  `StationId` int NOT NULL,
  `StationName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`StationId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stations`
--

LOCK TABLES `stations` WRITE;
/*!40000 ALTER TABLE `stations` DISABLE KEYS */;
INSERT INTO `stations` VALUES (1,'Goa'),(2,'Mumbai Central'),(3,'Bangalore City'),(4,'Chennai Central'),(5,'Howrah Junction'),(6,'Hyderabad Deccan'),(7,'Ahmedabad Junction'),(8,'Pune Junction'),(9,'Jaipur Junction'),(10,'Lucknow Charbagh'),(11,'Gandhinagar'),(12,'New Delhi'),(13,'Himachal'),(14,'Secunderabad'),(15,'Vishakhapatnam'),(16,'Sai Nagar'),(17,'shirdi'),(18,'Solapur'),(19,'Bhopal'),(20,'Lonavla'),(21,'Ajmer'),(22,'Dharwad'),(23,'Indore');
/*!40000 ALTER TABLE `stations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ticket`
--

DROP TABLE IF EXISTS `ticket`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ticket` (
  `TicketId` int NOT NULL,
  `RouteId` int DEFAULT NULL,
  `ScheduleID` int DEFAULT NULL,
  `Price` float DEFAULT NULL,
  `TotalTickets` smallint DEFAULT NULL,
  `SoldTickets` smallint DEFAULT NULL,
  `AvailbleTickets` smallint DEFAULT NULL,
  PRIMARY KEY (`TicketId`),
  KEY `RouteId` (`RouteId`),
  KEY `ScheduleID` (`ScheduleID`),
  CONSTRAINT `Ticket_ibfk_1` FOREIGN KEY (`RouteId`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `Ticket_ibfk_2` FOREIGN KEY (`ScheduleID`) REFERENCES `trainschedules` (`ScheduleID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ticket`
--

LOCK TABLES `ticket` WRITE;
/*!40000 ALTER TABLE `ticket` DISABLE KEYS */;
INSERT INTO `ticket` VALUES (1,1,1,50,100,1,99),(2,2,2,45,150,1,149),(3,3,3,60,120,1,119),(4,4,4,55,130,1,129),(5,5,5,70,110,1,109),(6,6,6,65,140,1,139),(7,7,7,100,200,1,199);
/*!40000 ALTER TABLE `ticket` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `train`
--

DROP TABLE IF EXISTS `train`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `train` (
  `Train_id` int NOT NULL,
  `TrainName` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`Train_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `train`
--

LOCK TABLES `train` WRITE;
/*!40000 ALTER TABLE `train` DISABLE KEYS */;
INSERT INTO `train` VALUES (1,'Rajdhani Express'),(2,'Shatabdi Express'),(3,'Duronto Express'),(4,'Garib Rath'),(5,'Jan Shatabdi Express'),(6,'Sampark Kranti Express'),(7,'Humsafar Express'),(8,'Tejas Express'),(9,'Double Decker Express'),(10,'Antyodaya Express'),(11,'Vande Bharat'),(12,'Godavari Express'),(13,'Punjab Mail'),(14,'Howrah Mail'),(15,'Vivek Express'),(16,'Gatiman Express'),(17,'Kerala Express'),(18,'Deccan Queen'),(19,'Konkan Kanya Express'),(20,'Golden Temple Express');
/*!40000 ALTER TABLE `train` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trainschedules`
--

DROP TABLE IF EXISTS `trainschedules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trainschedules` (
  `ScheduleID` int NOT NULL,
  `RouteID` int DEFAULT NULL,
  `DepartureTime` time DEFAULT NULL,
  `ArrivalTime` time DEFAULT NULL,
  `DriverID` int DEFAULT NULL,
  `CoDriverID` int DEFAULT NULL,
  `Date` date DEFAULT NULL,
  `TrainId` int DEFAULT NULL,
  `ActualArrivalTime` time DEFAULT NULL,
  PRIMARY KEY (`ScheduleID`),
  KEY `RouteID` (`RouteID`),
  KEY `DriverID` (`DriverID`),
  KEY `CoDriverID` (`CoDriverID`),
  CONSTRAINT `TrainSchedules_ibfk_1` FOREIGN KEY (`RouteID`) REFERENCES `routes` (`RouteID`),
  CONSTRAINT `TrainSchedules_ibfk_2` FOREIGN KEY (`DriverID`) REFERENCES `drivers` (`DriverID`),
  CONSTRAINT `TrainSchedules_ibfk_3` FOREIGN KEY (`CoDriverID`) REFERENCES `drivers` (`DriverID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trainschedules`
--

LOCK TABLES `trainschedules` WRITE;
/*!40000 ALTER TABLE `trainschedules` DISABLE KEYS */;
INSERT INTO `trainschedules` VALUES (1,1,'08:00:00','12:00:00',1,2,'2023-01-01',1,'12:05:00'),(2,1,'10:00:00','14:00:00',2,1,'2023-01-02',2,'14:05:00'),(3,1,'12:00:00','16:00:00',3,4,'2023-09-10',3,'16:00:00'),(4,4,'14:00:00','18:00:00',4,3,'2023-01-04',4,'18:00:00'),(5,5,'16:00:00','20:00:00',5,6,'2023-01-05',5,'20:00:00'),(6,6,'18:00:00','22:00:00',6,5,'2023-10-10',6,'22:05:00'),(7,7,'20:00:00','00:00:00',7,8,'2023-01-07',7,'00:05:00'),(8,8,'22:00:00','02:00:00',8,7,'2023-01-08',8,'02:05:00'),(9,9,'00:00:00','04:00:00',9,10,'2023-01-09',9,'04:05:00'),(10,10,'02:00:00','06:00:00',10,9,'2023-01-10',10,'06:05:00'),(11,11,'12:00:00','01:55:00',2,3,'2023-09-10',3,'01:55:00'),(12,12,'01:00:00','01:55:00',2,3,'2023-09-10',3,'01:55:00'),(13,13,'01:10:00','01:55:00',2,3,'2023-09-10',3,'01:55:00');
/*!40000 ALTER TABLE `trainschedules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `travelagents`
--

DROP TABLE IF EXISTS `travelagents`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `travelagents` (
  `AgentID` int NOT NULL,
  `Name` varchar(100) DEFAULT NULL,
  `CommissionPercentage` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`AgentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `travelagents`
--

LOCK TABLES `travelagents` WRITE;
/*!40000 ALTER TABLE `travelagents` DISABLE KEYS */;
INSERT INTO `travelagents` VALUES (1,'Travel India Tours',10.00),(2,'Royal Travels',10.00),(3,'Discover Bharat',10.00),(4,'Golden Triangle Tours',10.00),(5,'Divine Journeys',10.00),(6,'Elegant Voyages',10.00),(7,'Majestic Holidays',10.00),(8,'Incredible Expeditions',10.00),(9,'Spiritual Sojourns',10.00),(10,'Eastern Odyssey',10.00);
/*!40000 ALTER TABLE `travelagents` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-11-15 16:29:37
