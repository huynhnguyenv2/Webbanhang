-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: om
-- ------------------------------------------------------
-- Server version	5.7.21-log

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
-- Table structure for table `account`
--

DROP TABLE IF EXISTS `account`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `account` (
  `AccountID` int(11) NOT NULL,
  `UserName` varchar(40) NOT NULL,
  `PassWord` varchar(80) NOT NULL,
  `Type` int(11) NOT NULL,
  `Active` varchar(1) NOT NULL,
  PRIMARY KEY (`UserName`),
  UNIQUE KEY `AccountID` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `account`
--

LOCK TABLES `account` WRITE;
/*!40000 ALTER TABLE `account` DISABLE KEYS */;
INSERT INTO `account` VALUES (1,'admin','21232f297a57a5a743894a0e4a801fc3',1,'Y'),(2,'dungtham','4b2b3ac1710c96ce8839dcc6fe3709c9',2,'Y'),(4,'khanhhoang','ace3374f89ce2cbd2cbf13eddc5d1165',2,'Y'),(3,'nganguyen','eaf1cfdb7ef71e0003668fa52a6a8e3e',2,'Y'),(5,'truonggiang','9d7cad53d73988c6db9b746b3604a25a',2,'Y');
/*!40000 ALTER TABLE `account` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `approve`
--

DROP TABLE IF EXISTS `approve`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `approve` (
  `ID` int(11) NOT NULL,
  `OrdersID` int(11) NOT NULL,
  `SalesmanID` int(11) NOT NULL,
  `DateApprove` datetime NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `OrdersID` (`OrdersID`),
  KEY `SalesmanID` (`SalesmanID`),
  CONSTRAINT `approve_ibfk_1` FOREIGN KEY (`OrdersID`) REFERENCES `orders` (`OrdersID`),
  CONSTRAINT `approve_ibfk_2` FOREIGN KEY (`SalesmanID`) REFERENCES `salesman` (`SalesmanID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `approve`
--

LOCK TABLES `approve` WRITE;
/*!40000 ALTER TABLE `approve` DISABLE KEYS */;
/*!40000 ALTER TABLE `approve` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `CartID` int(11) NOT NULL,
  `TotalPrice` int(11) DEFAULT '0',
  PRIMARY KEY (`CartID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,29990000),(2,1000000);
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_product`
--

DROP TABLE IF EXISTS `cart_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_product` (
  `LineID` int(11) NOT NULL,
  `CartID` int(11) NOT NULL,
  `ProductID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT '0',
  PRIMARY KEY (`LineID`),
  KEY `CartID` (`CartID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `cart_product_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `cart_product_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_product`
--

LOCK TABLES `cart_product` WRITE;
/*!40000 ALTER TABLE `cart_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `cart_v`
--

DROP TABLE IF EXISTS `cart_v`;
/*!50001 DROP VIEW IF EXISTS `cart_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `cart_v` AS SELECT 
 1 AS `CartID`,
 1 AS `TotalPrice`,
 1 AS `ProductID`,
 1 AS `ProductNumber`,
 1 AS `Description`,
 1 AS `QuantityInStock`,
 1 AS `QuantityInCart`,
 1 AS `ManuID`,
 1 AS `ManuName`,
 1 AS `Status`,
 1 AS `ImageID`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `change_history`
--

DROP TABLE IF EXISTS `change_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `change_history` (
  `ID` int(11) NOT NULL,
  `SalesmanID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  `DateChange` datetime NOT NULL,
  `ActionType` varchar(1) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `change_history`
--

LOCK TABLES `change_history` WRITE;
/*!40000 ALTER TABLE `change_history` DISABLE KEYS */;
/*!40000 ALTER TABLE `change_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `CustomerID` int(11) NOT NULL,
  `CustomerNumber` varchar(10) NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Street` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `District` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`CustomerID`),
  UNIQUE KEY `CustomerNumber` (`CustomerNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'KH00001','Hoàng','Phạm Khánh Huy','M','0909099900','250 Lý Thường Kiệt','Quận 10','HCM'),(2,'KH00002','Giang','Nguyễn Trường','M','01224445665','73 Võ Văn Ngân','Thủ Đức','HCM');
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `manufacturer`
--

DROP TABLE IF EXISTS `manufacturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `manufacturer` (
  `ManuID` int(11) NOT NULL,
  `ManuName` varchar(100) DEFAULT NULL,
  `ManuNumber` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`ManuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `manufacturer`
--

LOCK TABLES `manufacturer` WRITE;
/*!40000 ALTER TABLE `manufacturer` DISABLE KEYS */;
INSERT INTO `manufacturer` VALUES (1,'Apple','NSX001'),(2,'Samsung','NSX002'),(3,'Sony','NSX003'),(4,'Oppo','NSX004'),(5,'Acer','NSX005'),(6,'Asus','NSX006'),(7,'Hp','NSX007'),(8,'Dell','NSX008'),(9,'Lenovo','NSX009'),(10,'Canon','NSX010');
/*!40000 ALTER TABLE `manufacturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `OrdersID` int(11) NOT NULL,
  `OrdersNumber` varchar(10) NOT NULL,
  `OrderDate` datetime DEFAULT NULL,
  `Status` varchar(10) DEFAULT NULL,
  `TransportationMethod` varchar(50) DEFAULT NULL,
  `CartID` int(11) DEFAULT NULL,
  `SalesmanID` int(11) DEFAULT NULL,
  `CustomerID` int(11) DEFAULT NULL,
  PRIMARY KEY (`OrdersID`),
  UNIQUE KEY `OrdersNumber` (`OrdersNumber`),
  KEY `CartID` (`CartID`),
  KEY `SalesmanID` (`SalesmanID`),
  KEY `CustomerID` (`CustomerID`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`CartID`) REFERENCES `cart` (`CartID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`SalesmanID`) REFERENCES `salesman` (`SalesmanID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`CustomerID`) REFERENCES `customer` (`CustomerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `orders_v`
--

DROP TABLE IF EXISTS `orders_v`;
/*!50001 DROP VIEW IF EXISTS `orders_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `orders_v` AS SELECT 
 1 AS `OrdersID`,
 1 AS `OrdersNumber`,
 1 AS `OrderDate`,
 1 AS `OrdersStatus`,
 1 AS `TransportationMethod`,
 1 AS `CartID`,
 1 AS `TotalPrice`,
 1 AS `ProductNumber`,
 1 AS `Description`,
 1 AS `QuantityInStock`,
 1 AS `QuantityInCart`,
 1 AS `ManuID`,
 1 AS `ManuName`,
 1 AS `ProductStatus`,
 1 AS `ImageID`,
 1 AS `SalesmanID`,
 1 AS `SalesmanNumber`,
 1 AS `SalesmanFirstName`,
 1 AS `SalesmanLastName`,
 1 AS `SalesmanBirthday`,
 1 AS `SalesmanSex`,
 1 AS `CustomerID`,
 1 AS `CustomerNumber`,
 1 AS `CustomerFirstName`,
 1 AS `CustomerLastName`,
 1 AS `CustomerSex`,
 1 AS `CustomerPhoneNumber`,
 1 AS `CustomerStreet`,
 1 AS `CustomerDistrict`,
 1 AS `CustomerCity`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `ProductID` int(11) NOT NULL,
  `ProductNumber` varchar(20) NOT NULL,
  `ProductName` varchar(300) CHARACTER SET utf8 DEFAULT NULL,
  `Description` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  `Price` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `ManuID` int(11) DEFAULT NULL,
  `Status` varchar(1) DEFAULT NULL,
  `ImageID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ProductID`),
  UNIQUE KEY `ProductNumber` (`ProductNumber`),
  KEY `ManuID` (`ManuID`),
  CONSTRAINT `product_ibfk_1` FOREIGN KEY (`ManuID`) REFERENCES `manufacturer` (`ManuID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,'SP00001','Iphone X 64GB','\"Màn hình\":\"OLED, 5.8, Super Retina\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"2 camera 12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"3GB\", \"Memory\":\"64GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2716 mAh\"',29990000,10,1,'1',1),(2,'SP00002','Iphone X 256GB','\"Màn hình\":\"OLED, 5.8, Super Retina\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"2 camera 12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"3GB\", \"Memory\":\"256GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2716 mAh\"',34790000,10,1,'1',2),(3,'SP00003','Iphone 8 Plus 256GB','\"Màn hình\":\"LED-backlit IPS LCD, 5.5, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"2 camera 12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"3GB\", \"Memory\":\"256GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2691 mAh\"',28790000,4,1,'1',3),(4,'SP00004','Iphone 8 Plus 64GB','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"2GB\", \"Memory\":\"256GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1821 mAh\"',25790000,5,1,'1',4),(5,'SP00005','Iphone 8 256GB','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"2GB\", \"Memory\":\"256GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1821 mAh\"',25790000,3,1,'1',5),(6,'SP00006','Iphone 8 64GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A11 Bionic 6 nhân\",\"RAM\":\"2GB\", \"Memory\":\"64GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1821 mAh\"\n',20990000,11,1,'1',6),(7,'SP00007','Iphone 7 Plus 128GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 5.5, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"2 camera 12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A10 Fusion 4 nhân 64-bit\",\"RAM\":\"3GB\", \"Memory\":\"32GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2900 mAh\"\n',22990000,5,1,'1',7),(8,'SP00008','Iphone 7 Plus 32GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 5.5, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"2 camera 12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A10 Fusion 4 nhân 64-bit\",\"RAM\":\"3GB\", \"Memory\":\"128GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2900 mAh\"\n',19990000,7,1,'1',8),(9,'SP00009','Iphone 7 32GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"7 MP\",\"CPU\":\"Apple A10 Fusion 4 nhân 64-bit\",\"RAM\":\"2GB\", \"Memory\":\"32GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1960 mAh\"\n',15990000,2,1,'1',9),(10,'SP00010','Iphone 6s Plus 32GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 5.5, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"5 MP\",\"CPU\":\"Apple A9 2 nhaan 64-bit\",\"RAM\":\"2GB\", \"Memory\":\"64GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"2750 mAh\"\n',13990000,14,1,'1',10),(11,'SP00011','Iphone 6s 32GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"12 MP\",\"Camera trước\":\"5 MP\",\"CPU\":\"Apple A9 2 nhân 64-bit\",\"RAM\":\"2GB\", \"Memory\":\"32GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1715 mAh\"\n',12490000,10,1,'1',11),(12,'SP00012','Iphone 6 32GB\n','\"Màn hình\":\"LED-backlit IPS LCD, 4.7, Retina HD\",\"Hệ điều hành\":\"iOS 11\",\"Camera sau\":\"8 MP\",\"Camera trước\":\"1.2 MP\",\"CPU\":\"Apple A8 2 nhân 64-bit\",\"RAM\":\"1GB\", \"Memory\":\"32GB\", \"SIM\":\"1 Nano SIM, Hỗ trợ 4G\", \"Dung lượng pin\":\"1810 mAh\"\n',7990000,6,1,'1',12);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `product_v`
--

DROP TABLE IF EXISTS `product_v`;
/*!50001 DROP VIEW IF EXISTS `product_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `product_v` AS SELECT 
 1 AS `ProductID`,
 1 AS `ProductNumber`,
 1 AS `ProductName`,
 1 AS `Description`,
 1 AS `Price`,
 1 AS `Quantity`,
 1 AS `ImageID`,
 1 AS `ManuID`,
 1 AS `ManuName`,
 1 AS `Status`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ProductID` int(11) NOT NULL,
  `Content` varchar(2000) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `review_ibfk_1` FOREIGN KEY (`ProductID`) REFERENCES `product` (`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salesman`
--

DROP TABLE IF EXISTS `salesman`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `salesman` (
  `SalesmanID` int(11) NOT NULL,
  `SalesmanNumber` varchar(10) NOT NULL,
  `FirstName` varchar(20) CHARACTER SET utf8 NOT NULL,
  `LastName` varchar(30) CHARACTER SET utf8 NOT NULL,
  `Birthday` date DEFAULT NULL,
  `Sex` varchar(1) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL,
  `Street` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `District` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `City` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `AccountID` int(11) DEFAULT NULL,
  PRIMARY KEY (`SalesmanID`),
  UNIQUE KEY `SalesmanNumber` (`SalesmanNumber`),
  KEY `AccountID` (`AccountID`),
  CONSTRAINT `salesman_ibfk_1` FOREIGN KEY (`AccountID`) REFERENCES `account` (`AccountID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salesman`
--

LOCK TABLES `salesman` WRITE;
/*!40000 ALTER TABLE `salesman` DISABLE KEYS */;
INSERT INTO `salesman` VALUES (1,'SM0001','Dũng','Thẩm Quốc','1997-01-01','M','0128489984','200 Phạm Văn Đồng','Bình Thạnh','HCM',2),(2,'SM0002','Nga','Nguyễn Tuyết','1997-10-10','F','0122484848','10 Phạm Ngọc Thạch','Quận 3','HCM',3);
/*!40000 ALTER TABLE `salesman` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `salesman_v`
--

DROP TABLE IF EXISTS `salesman_v`;
/*!50001 DROP VIEW IF EXISTS `salesman_v`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `salesman_v` AS SELECT 
 1 AS `SalesmanID`,
 1 AS `SalesmanNumber`,
 1 AS `FirstName`,
 1 AS `LastName`,
 1 AS `Birthday`,
 1 AS `Sex`,
 1 AS `PhoneNumber`,
 1 AS `Street`,
 1 AS `District`,
 1 AS `City`,
 1 AS `AccountID`,
 1 AS `UserName`,
 1 AS `PassWord`,
 1 AS `Type`,
 1 AS `Active`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `cart_v`
--

/*!50001 DROP VIEW IF EXISTS `cart_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `cart_v` AS select `c`.`CartID` AS `CartID`,`c`.`TotalPrice` AS `TotalPrice`,`p`.`ProductID` AS `ProductID`,`p`.`ProductNumber` AS `ProductNumber`,`p`.`Description` AS `Description`,`p`.`Quantity` AS `QuantityInStock`,`cp`.`Quantity` AS `QuantityInCart`,`p`.`ManuID` AS `ManuID`,`m`.`ManuName` AS `ManuName`,`p`.`Status` AS `Status`,`p`.`ImageID` AS `ImageID` from (((`cart` `c` join `product` `p`) join `cart_product` `cp`) join `manufacturer` `m`) where ((`c`.`CartID` = `cp`.`CartID`) and (`p`.`ProductID` = `cp`.`ProductID`) and (`p`.`ManuID` = `m`.`ManuID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `orders_v`
--

/*!50001 DROP VIEW IF EXISTS `orders_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `orders_v` AS select `o`.`OrdersID` AS `OrdersID`,`o`.`OrdersNumber` AS `OrdersNumber`,`o`.`OrderDate` AS `OrderDate`,`o`.`Status` AS `OrdersStatus`,`o`.`TransportationMethod` AS `TransportationMethod`,`o`.`CartID` AS `CartID`,`c`.`TotalPrice` AS `TotalPrice`,`c`.`ProductNumber` AS `ProductNumber`,`c`.`Description` AS `Description`,`c`.`QuantityInStock` AS `QuantityInStock`,`c`.`QuantityInCart` AS `QuantityInCart`,`c`.`ManuID` AS `ManuID`,`c`.`ManuName` AS `ManuName`,`c`.`Status` AS `ProductStatus`,`c`.`ImageID` AS `ImageID`,`o`.`SalesmanID` AS `SalesmanID`,`sm`.`SalesmanNumber` AS `SalesmanNumber`,`sm`.`FirstName` AS `SalesmanFirstName`,`sm`.`LastName` AS `SalesmanLastName`,`sm`.`Birthday` AS `SalesmanBirthday`,`sm`.`Sex` AS `SalesmanSex`,`o`.`CustomerID` AS `CustomerID`,`cus`.`CustomerNumber` AS `CustomerNumber`,`cus`.`FirstName` AS `CustomerFirstName`,`cus`.`LastName` AS `CustomerLastName`,`cus`.`Sex` AS `CustomerSex`,`cus`.`PhoneNumber` AS `CustomerPhoneNumber`,`cus`.`Street` AS `CustomerStreet`,`cus`.`District` AS `CustomerDistrict`,`cus`.`City` AS `CustomerCity` from (((`orders` `o` join `cart_v` `c`) join `salesman` `sm`) join `customer` `cus`) where ((`o`.`CartID` = `c`.`CartID`) and (`o`.`CustomerID` = `cus`.`CustomerID`) and (`o`.`SalesmanID` = `sm`.`SalesmanID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `product_v`
--

/*!50001 DROP VIEW IF EXISTS `product_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `product_v` AS select `p`.`ProductID` AS `ProductID`,`p`.`ProductNumber` AS `ProductNumber`,`p`.`ProductName` AS `ProductName`,`p`.`Description` AS `Description`,`p`.`Price` AS `Price`,`p`.`Quantity` AS `Quantity`,`p`.`ImageID` AS `ImageID`,`p`.`ManuID` AS `ManuID`,`m`.`ManuName` AS `ManuName`,`p`.`Status` AS `Status` from (`product` `p` join `manufacturer` `m`) where (`p`.`ManuID` = `m`.`ManuID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `salesman_v`
--

/*!50001 DROP VIEW IF EXISTS `salesman_v`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `salesman_v` AS select `sm`.`SalesmanID` AS `SalesmanID`,`sm`.`SalesmanNumber` AS `SalesmanNumber`,`sm`.`FirstName` AS `FirstName`,`sm`.`LastName` AS `LastName`,`sm`.`Birthday` AS `Birthday`,`sm`.`Sex` AS `Sex`,`sm`.`PhoneNumber` AS `PhoneNumber`,`sm`.`Street` AS `Street`,`sm`.`District` AS `District`,`sm`.`City` AS `City`,`sm`.`AccountID` AS `AccountID`,`acc`.`UserName` AS `UserName`,`acc`.`PassWord` AS `PassWord`,`acc`.`Type` AS `Type`,`acc`.`Active` AS `Active` from (`salesman` `sm` join `account` `acc`) where (`sm`.`AccountID` = `acc`.`AccountID`) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-11 19:15:43
