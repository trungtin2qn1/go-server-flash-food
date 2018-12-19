CREATE DATABASE  IF NOT EXISTS `flashfood` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `flashfood`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: flashfood
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `customer_notifications`
--

DROP TABLE IF EXISTS `customer_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customer_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customer_id` (`customer_id`) USING BTREE,
  CONSTRAINT `customer_notifications_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_notifications`
--

LOCK TABLES `customer_notifications` WRITE;
/*!40000 ALTER TABLE `customer_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `customers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `token` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
INSERT INTO `customers` VALUES (1,'01234567890','175/60/22 quận 9','Trần Thanh Tịnh',NULL,'thanhtinhpas1','123123',NULL),(2,'01652138425','152 Cách Mạng Tháng 8, quận 3','Nguyễn Thanh Xuân',NULL,'thanhtinhpas2','123123',NULL),(3,'01629514200','61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh','Nguyễn Thu An',NULL,'thanhtinhpas3','123123',NULL),(4,'0935214625','652 Huỳnh Tấn Phát, quận 7','Trần Quốc Vương',NULL,'thanhtinhpas4','123123',NULL),(5,'0953268741','12/2 Nguyễn Thị Minh Khai, quận 1','Lê Văn Thắng',NULL,'thanhtinhpas5','123123',NULL),(6,'01652315485','123 Nguyễn Tri Phương, quận 5','Hồ Mỹ Linh',NULL,'thanhtinhpas6','123123',NULL),(7,'0905214621','452 Xa lộ Hà Nội, quận 9','Phạm Hoàng Anh',NULL,'thanhtinhpas7','123123',NULL),(8,'0906214896','176 Linh Trung, quận Thủ Đức','Phan Lê Dũng',NULL,'thanhtinhpas8','123123',NULL),(9,'01236321458','17/6 Lê Văn Việt, quận 9','Lê Hoàng Dũng',NULL,'thanhtinhpas9','123123',NULL),(10,'0977855621','132 Võ Văn Ngân, quận Thủ Đức','Đinh Văn Hoàng',NULL,'thanhtinhpas10','123123',NULL),(11,'0985632221','562 Lê Hồng Phong, quận 5','Hoàng Thu Phương',NULL,'thanhtinhpas11','123123',NULL),(12,'01635214852','252/1 Điện Biên Phủ, quận Bình Thạnh','Hoàng Quốc Long',NULL,'thanhtinhpas12','123123',NULL),(13,'0912365125','852 Phạm Văn Đồng, quận Gò Vấp','Nguyễn Hoàng Quốc',NULL,'thanhtinhpas13','123123',NULL),(14,'01236523019','253 Đinh Tiên Hoàng, quận 1','Nguyễn Lê Vân',NULL,'thanhtinhpas14','123123',NULL),(15,'01666322253','365 Võ Văn Tần, quận 1','Lê Thị Trúc',NULL,'thanhtinhpas15','123123',NULL),(16,'0985652365','332 Kha Vạn Cân, quận Thủ Đức','Trần Văn Giàu',NULL,'thanhtinhpas16','123123',NULL),(17,'0169987546','165 Nguyễn Hữu Cảnh, quận Bình Thạnh','Huỳnh Văn Hải',NULL,'thanhtinhpas17','123123',NULL),(18,'01236321025','741 Xa Lộ Hà Nội, quận 2','Nguyễn Văn Nam',NULL,'thanhtinhpas18','123123',NULL),(19,'01610235412','214 Bạch Đằng, quận Bình Thạnh','Đinh Văn Nam',NULL,'thanhtinhpas19','123123',NULL),(20,'01623216540','325 Sư Vạn Hạnh, quận 10','Nguyễn Trường Thịnh',NULL,'thanhtinhpas20','123123',NULL),(21,'01631456325','45 Phan Đăng Lưu, quận Bình Thạnh','Mạc Đăng Khoa',NULL,'thanhtinhpas21','123123',NULL),(22,'01648521452','231 Trần Hưng Đạo, quận 1','Trịnh Hoàng Anh',NULL,'thanhtinhpas22','123123',NULL),(23,'01659653265','15/6 Trường Sa, quận 1','Nguyễn Thanh Tùng',NULL,'thanhtinhpas23','123123',NULL),(24,'01669874156','32/3 Lê Quang Định, quận Bình Thạnh','Trịnh Thăng Bình',NULL,'thanhtinhpas24','123123',NULL),(25,'01671234513','62/2 Cộng Hòa, quận Tân Bình','Trấn Thành',NULL,'thanhtinhpas25','123123',NULL),(26,'01689636542','123/5/6 Nơ Trang Long, quận Bình Thạnh','Trường Giang',NULL,'thanhtinhpas26','123123',NULL),(27,'01693256325','32/3 Nguyễn Xí, quận Bình Thạnh','HariWon',NULL,'thanhtinhpas27','123123',NULL),(29,'234234234','aeawe','tioe','aweawe','thanhtinhpas28','123123',NULL),(30,'234234234','aeawe','tioe','aweawe','thanhtinhpas29','123123',NULL),(31,'234234234','aeawe','tioe','aweawe','thanhtinhpas30','123123',NULL);
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery_orders`
--

DROP TABLE IF EXISTS `delivery_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `orderId` int(11) NOT NULL,
  `shipperId` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `orderId` (`orderId`) USING BTREE,
  KEY `shipperId` (`shipperId`) USING BTREE,
  CONSTRAINT `delivery_orders_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `delivery_orders_ibfk_2` FOREIGN KEY (`shipperId`) REFERENCES `shippers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_orders`
--

LOCK TABLES `delivery_orders` WRITE;
/*!40000 ALTER TABLE `delivery_orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `delivery_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `feedbacks`
--

DROP TABLE IF EXISTS `feedbacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `feedbacks` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL,
  `rate` tinyint(10) NOT NULL,
  `comment` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `product_id` (`product_id`) USING BTREE,
  CONSTRAINT `feedbacks_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `feedbacks`
--

LOCK TABLES `feedbacks` WRITE;
/*!40000 ALTER TABLE `feedbacks` DISABLE KEYS */;
INSERT INTO `feedbacks` VALUES (1,2,5,'Ngon',2);
/*!40000 ALTER TABLE `feedbacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_details` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `productId` int(255) NOT NULL,
  `orderId` int(255) DEFAULT NULL,
  `customerId` int(255) NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `amount` int(255) NOT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `productId` (`productId`) USING BTREE,
  KEY `customerId` (`customerId`) USING BTREE,
  KEY `orderId` (`orderId`) USING BTREE,
  CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`productId`) REFERENCES `products` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`orderId`) REFERENCES `orders` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_details`
--

LOCK TABLES `order_details` WRITE;
/*!40000 ALTER TABLE `order_details` DISABLE KEYS */;
INSERT INTO `order_details` VALUES (1,1,2,1,'100000',1,1,'2018-10-31 23:49:57'),(2,2,2,2,'90000',1,2,'2018-10-31 23:49:57'),(3,2,2,5,'189000',1,3,'2018-10-31 23:49:57'),(4,10,2,9,'195000',1,5,'2018-10-31 23:49:57'),(5,26,2,14,'80000',0,4,'2018-10-31 23:49:57'),(6,15,2,17,'290000',0,1,'2018-10-31 23:49:57'),(7,23,2,20,'149000',0,1,'2018-10-31 23:49:57'),(8,14,2,8,'340000',0,10,'2018-10-31 23:49:57'),(9,6,2,13,'100000',0,4,'2018-10-31 23:49:57'),(10,7,2,16,'45000',0,3,'2018-10-31 23:49:57'),(11,11,2,29,'280000',0,4,'2018-10-31 23:49:57'),(12,29,2,26,'310000',0,2,'2018-10-31 23:49:57'),(13,30,2,23,'240000',0,20,'2018-10-31 23:49:57'),(14,18,2,19,'116000',0,2,'2018-10-31 23:49:57'),(15,13,2,30,'660000',0,11,'2018-10-31 23:49:57'),(16,21,2,35,'37000',0,1,'2018-10-31 23:49:57'),(17,9,2,41,'780000',0,20,'2018-10-31 23:49:57'),(18,10,2,34,'149000',0,1,'2018-10-31 23:49:57'),(19,14,2,32,'128000',0,8,'2018-10-31 23:49:57'),(20,17,2,40,'180000',0,12,'2018-10-31 23:49:57'),(21,23,2,2,'90000',0,2,'2018-10-31 23:49:57'),(22,20,2,11,'160000',0,4,'2018-10-31 23:49:57'),(23,5,2,6,'78000',0,1,'2018-10-31 23:49:57'),(24,1,2,13,'100000',0,4,'2018-10-31 23:49:57'),(25,25,2,14,'100000',0,5,'2018-10-31 23:49:57'),(26,19,2,16,'45000',0,3,'2018-10-31 23:49:57'),(27,9,2,18,'116000',0,2,'2018-10-31 23:49:57'),(28,24,2,17,'58000',0,2,'2018-10-31 23:49:57'),(29,27,2,22,'149000',0,1,'2018-10-31 23:49:57'),(30,30,2,25,'120000',0,40,'2018-10-31 23:49:57');
/*!40000 ALTER TABLE `order_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `customerId` int(255) NOT NULL,
  `shipperId` int(255) DEFAULT NULL,
  `date` datetime DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `status` tinyint(1) NOT NULL DEFAULT '0',
  `sum_price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `address_customer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(11) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `storeId` int(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `customerId` (`customerId`) USING BTREE,
  KEY `shipperId` (`shipperId`) USING BTREE,
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customerId`) REFERENCES `customers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`shipperId`) REFERENCES `shippers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (2,3,6,'2018-10-20 16:23:19',0,'189000','61/1, Xô Viết Nghệ Tĩnh, quận Bình Thạnh','01629514200',2),(3,4,7,'2018-10-25 21:15:32',0,'90000','652 Huỳnh Tấn Phát, quận 7','0935214625',2),(4,5,8,'2018-10-27 08:32:29',0,'189000','12/2 Nguyễn Thị Minh Khai, quận 1','0953268741',2),(5,6,9,'2018-10-15 09:31:11',0,'90000','452 Xa lộ Hà Nội, quận 9','0905214621',2),(6,7,10,'2018-10-14 15:16:17',0,'90000','123 Nguyễn Tri Phương, quận 5','01652315485',2),(7,8,12,'2018-10-18 17:14:13',0,'34000','176 Linh Trung, quận Thủ Đức','0906214896',2),(8,9,15,'2018-10-21 19:31:32',0,'90000','17/6 Lê Văn Việt, quận 9','01236321458',2),(9,10,11,'2018-10-20 09:16:22',0,'90000','132 Võ Văn Ngân, quận Thủ Đức','0977855621',2),(10,11,11,'2018-10-22 21:11:57',0,'90000','562 Lê Hồng Phong, quận 5','0985632221',2),(11,12,7,'2018-10-23 12:12:11',0,'90000','252/1 Điện Biên Phủ, quận Bình Thạnh','01635214852',2),(12,13,25,'2018-10-24 11:14:16',0,'100000','852 Phạm Văn Đồng, quận Gò Vấp','0912365125',2),(13,14,2,'2018-10-25 19:16:22',0,'80000','253 Đinh Tiên Hoàng, quận 1','01236523019',2),(14,15,3,'2018-10-18 22:11:05',0,'90000','365 Võ Văn Tần, quận 1','01666322253',2),(15,16,17,'2018-10-23 10:15:23',0,'45000','332 Kha Vạn Cân, quận Thủ Đức','0985652365',2),(16,17,19,'2018-10-21 11:05:22',0,'58000','165 Nguyễn Hữu Cảnh, quận Bình Thạnh','0169987546',2),(17,18,19,'2018-10-21 11:05:22',0,'116000','741 Xa Lộ Hà Nội, quận 2','01236321025',2),(18,19,21,'2018-10-21 11:05:22',0,'116000','214 Bạch Đằng, quận Bình Thạnh','01610235412',2),(19,20,21,'2018-10-21 11:05:22',0,'149000','325 Sư Vạn Hạnh, quận 10','01623216540',2),(20,1,1,'2018-11-07 14:29:20',0,'574000','0++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-','01234567890',1);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `products` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `price` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `storeId` int(255) NOT NULL,
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `amount` int(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`storeId`) USING BTREE,
  CONSTRAINT `store_id` FOREIGN KEY (`storeId`) REFERENCES `stores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `products`
--

LOCK TABLES `products` WRITE;
/*!40000 ALTER TABLE `products` DISABLE KEYS */;
INSERT INTO `products` VALUES (1,'Bánh','100000',1,'Bánh ngon','vlxx.tv','Bánh',1),(2,'Trà sữa trân châu','45000',2,'Đậu đỏ, bạc hà, dưa gang','',NULL,1),(3,'Trà xanh','36000',2,'Chanh quất, chanh leo, xoài','',NULL,1),(4,'Ô long','45000',2,'Kem phô mai, thái cực, ngân nhĩ','',NULL,1),(5,'Cold Brew','63000',3,'Phương pháp ủ chậm với nước lạnh trong hơn 10 tiếng để cho ra món cà phê mát lạnh, mượt mà với hậu vị ngọt tự nhiên và đậm đà','',NULL,1),(6,'Cappucino','78000',3,'Thức uống cổ điển được kết hợp giữa cà phê Espresso cùng một lượng sữa vừa phải được đánh nóng để đem tới lớp bọt dày mịn, làm tăng thêm hương vị đậm đà cho cà phê.','',NULL,1),(7,'Chai Tea Latte','78000',3,'Sự kết hợp ấn tượng giữa trà Chai có vị cay thảo mộc cùng sữa tươi được đánh nóng. Chúng tôi cũng phục vụ thức uống này với đá.','',NULL,1),(8,'Khúc bạch thập cẩm','34000',4,'','',NULL,1),(9,'Thập cẩm trái cây ','39000',4,'','',NULL,1),(10,'Khúc bạch đào','30000',4,'','',NULL,1),(11,'Sinh tố bơ','40000',5,'','',NULL,1),(12,'Sinh tố dâu','30000',5,'','',NULL,1),(13,'Sinh tố dừa','25000',5,'','',NULL,1),(14,'Hủ tiếu đặc biệt','20000',6,'','',NULL,1),(15,'Hủ tiếu thịt','12000',6,'','',NULL,1),(16,'Hủ tiếu xương','15000',6,'','',NULL,1),(17,'Gà lên mâm','290000',7,'','',NULL,1),(18,'Lòng gà trứng non','58000',7,'','',NULL,1),(19,'Sụn gà chiên nước mắm','58000',7,'','',NULL,1),(20,'Cheese Castella','149000',8,'','',NULL,1),(21,'Chocolate Castella','149000',8,'','',NULL,1),(22,'Bánh bông lan phô mai','149000',8,'','',NULL,1),(23,'Bánh bột lọc nhân tôm','12000',9,'','',NULL,1),(24,'Bánh bèo','15000',9,'','',NULL,1),(25,'Bánh đúc','3000',9,'','',NULL,1),(26,'Vịt quay truyền thống','155000',10,'','',NULL,1),(27,'Phá lấu','46000',10,'','',NULL,1),(28,'Xá xíu','46000',10,'','',NULL,1),(29,'Bánh bò thốt nốt','70000',11,'','',NULL,1),(30,'Bánh đục tình khúc','60000',11,'','',NULL,1),(31,'Bánh bông lan cuộn','80000',11,'','',NULL,1),(32,'Xôi hành phi','16000',12,'','',NULL,1),(33,'Salad trộn dầu chanh','18000',12,'','',NULL,1),(34,'Gà nướng ớt cay địa trung hải','149000',12,'','',NULL,1),(35,'Mỳ Ý sốt bò bằm','37000',13,'','',NULL,1),(36,'Mỳ Ý Double B','57000',13,'','',NULL,1),(37,'Mỳ Ý tôm xào cay','57000',13,'','',NULL,1),(38,'Phá lấu lớn','30000',14,'','',NULL,1),(39,'Phá lấu xào bơ me','35000',14,'','',NULL,1),(40,'Há cảo hấp','15000',14,'','',NULL,1),(41,'Cơm gà luộc','39000',15,'','',NULL,1),(42,'Cơm gà xé','27000',15,'','',NULL,1),(43,'Canh rau thịt','15000',15,'','',NULL,1);
/*!40000 ALTER TABLE `products` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper_locations`
--

DROP TABLE IF EXISTS `shipper_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipper_locations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `float_x` float(255,0) NOT NULL,
  `float_y` float(255,0) NOT NULL,
  `shipper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shipper_id` (`shipper_id`) USING BTREE,
  CONSTRAINT `shipper_locations_ibfk_1` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper_locations`
--

LOCK TABLES `shipper_locations` WRITE;
/*!40000 ALTER TABLE `shipper_locations` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipper_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipper_notifications`
--

DROP TABLE IF EXISTS `shipper_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shipper_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `contain` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `shipper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `shipper_id` (`shipper_id`) USING BTREE,
  CONSTRAINT `shipper_notifications_ibfk_1` FOREIGN KEY (`shipper_id`) REFERENCES `shippers` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipper_notifications`
--

LOCK TABLES `shipper_notifications` WRITE;
/*!40000 ALTER TABLE `shipper_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipper_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shippers`
--

DROP TABLE IF EXISTS `shippers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `shippers` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(55) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '0',
  `avatar` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shippers`
--

LOCK TABLES `shippers` WRITE;
/*!40000 ALTER TABLE `shippers` DISABLE KEYS */;
INSERT INTO `shippers` VALUES (1,'Phạm Quang Triệu',0,NULL,'thanhtinhpas1','123123',NULL),(2,'Chí Tài',0,NULL,NULL,NULL,NULL),(3,'Ưng Hoàng Phúc',0,NULL,NULL,NULL,NULL),(4,'Đức Phúc',0,NULL,NULL,NULL,NULL),(5,'Erik',0,NULL,NULL,NULL,NULL),(6,'Quang Vinh',0,NULL,NULL,NULL,NULL),(7,'Tuấn Hưng',0,NULL,NULL,NULL,NULL),(8,'Khắc Việt',0,NULL,NULL,NULL,NULL),(9,'Hà Anh Tuấn',0,NULL,NULL,NULL,NULL),(10,'Quang Dũng',0,NULL,NULL,NULL,NULL),(11,'Bùi Anh Tuấn',0,NULL,NULL,NULL,NULL),(12,'Trung Quân',0,NULL,NULL,NULL,NULL),(13,'Tiến Đạt',0,NULL,NULL,NULL,NULL),(14,'Bằng Kiều',0,NULL,NULL,NULL,NULL),(15,'Miu Lê',0,NULL,NULL,NULL,NULL),(16,'Nguyễn Anh Tuấn',0,NULL,NULL,NULL,NULL),(17,'Phạm Văn Nam',0,NULL,NULL,NULL,NULL),(18,'Trúc Nhân',0,NULL,NULL,NULL,NULL),(19,'Khánh Linh',0,NULL,NULL,NULL,NULL),(20,'Mỹ Linh',0,NULL,NULL,NULL,NULL),(21,'Hoài Lâm',0,NULL,NULL,NULL,NULL),(22,'Nguyễn Nhật Trung',0,NULL,NULL,NULL,NULL),(23,'Phạm Đức Trung',0,NULL,NULL,NULL,NULL),(24,'Trần Duy Khoa',0,NULL,NULL,NULL,NULL),(25,'Nguyễn Đức Trà',0,NULL,NULL,NULL,NULL),(26,'Phan Văn Dũng',0,NULL,NULL,NULL,NULL),(27,'Nguyễn Đức Nhân',0,NULL,NULL,NULL,NULL),(28,'Nguyễn Sĩ Hùng',0,NULL,NULL,NULL,NULL),(29,'Nguyễn Ngô Tín',0,NULL,NULL,NULL,NULL),(30,'Huỳnh Trung Tín',0,NULL,NULL,NULL,NULL),(31,'Phạm Hoàng Long',0,NULL,NULL,NULL,NULL),(32,'Trần Trung Kiên',0,NULL,NULL,NULL,NULL),(33,'Đinh Mạnh Ninh',0,NULL,NULL,NULL,NULL),(34,'Soobin Hoàng Sơn',0,NULL,NULL,NULL,NULL),(35,'Lê Văn Thanh',0,NULL,NULL,NULL,NULL),(36,'Nguyễn Ngọc Sơn',0,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `shippers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_notifications`
--

DROP TABLE IF EXISTS `store_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `store_notifications` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `contain` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `store_id` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `store_id` (`store_id`) USING BTREE,
  CONSTRAINT `store_notifications_ibfk_1` FOREIGN KEY (`store_id`) REFERENCES `stores` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_notifications`
--

LOCK TABLES `store_notifications` WRITE;
/*!40000 ALTER TABLE `store_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `store_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `stores`
--

DROP TABLE IF EXISTS `stores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `stores` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `district` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `street` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `revenue` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `avatar` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stores`
--

LOCK TABLES `stores` WRITE;
/*!40000 ALTER TABLE `stores` DISABLE KEYS */;
INSERT INTO `stores` VALUES (1,'Bánh Huế','9','HCM','175/60 Lê Văn Việt','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbanhhue.jpg?alt=media&token=e6a9a1b9-314f-4a3b-822a-68fafb8eeedd'),(2,'Toco Toco Bubble Tea','10','HCM','770 Sư Vạn Hạnh','',NULL,NULL,NULL,'Đồ Uống ','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Ftoco_toco.jpg?alt=media&token=a3770bba-40f3-4d57-81ec-6002e8561d44'),(3,'Starbucks Coffee - Đông Du','1','HCM','38 Đông Du','',NULL,NULL,NULL,'Đồ Uống','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fstarbuck.jpg?alt=media&token=9df1d3eb-1d25-4b63-b0c1-f4a652b43528'),(4,'Chè Khúc Bạch Đỗ Ngọc','1','HCM','245/23 Nguyễn Trãi','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fchekhucbach.jpg?alt=media&token=f17b2891-6149-42ef-af80-e728f412be43'),(5,'Five Boys - Sinh Tố Bùi Viện','1','HCM','84/7 Bùi Viện','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Ffiveboys-sinhtobuivien.jpg?alt=media&token=44d05291-bfd5-48a4-8aac-7dadbe0d5c60'),(6,'Hủ Tiếu Gõ - Đỗ Tấn Phong','Phú Nhuận','HCM','54 Đỗ Tấn Phong','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fhutieugo-Dotanphong.jpg?alt=media&token=cd02935c-f7d8-45f8-9560-29c758ce2a52'),(7,'Gà Cơ Bắp - Chuyên Các Món Gà','3','HCM','237/44 Trần Văn Đang','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fgacobap.jpg?alt=media&token=793741a6-efc6-40bf-888a-061e92e4e5b1'),(8,'Le Castella Viet Nam','10','HCM','175/60 304 Nguyễn Tri Phương','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2FleCastela.jpg?alt=media&token=dd3bb733-436d-4e87-88f3-abe88b2b3b36'),(9,'Bánh bột lọc cô Hương','Phú Nhuận','HCM','Kios 38, 84A Trần Hữu Trang','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbanhbotloccohuong.jpg?alt=media&token=f5521e77-74ef-4561-8d12-2fa745a28598'),(10,'Thân Thiệu Nhiên','5','HCM','105A Ngô Quyền','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fthanthieunhien.jpg?alt=media&token=b35439d9-2c8a-43e7-8e26-27f6d0fcd360'),(11,'Ngô Đỏ Bakery','Bình Thạnh','HCM','118/164 Bạch Đằng','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fngodobaraky.jpg?alt=media&token=e633ec38-55a9-4227-a7c4-6e360fb11593'),(12,'Gà nướng Ò Ó O','3','HCM','816 Trường Sa','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fganuongooo.jpg?alt=media&token=b2fbe1a3-e26a-432d-b398-b633b939d5c6'),(13,'Mỳ Ý Double B','10','HCM','266/70 Tô Hiến Thành','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2FmiydoubleB.jpg?alt=media&token=3039cd0f-c85d-43e6-b328-107c89fc8215'),(14,'Phá lấu Ngọc Thắm','3','HCM','26Bis Bàn Cờ','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2FPhaLauNgocTham.jpg?alt=media&token=02e64687-f3b5-40f1-99c3-34dbd3455826'),(15,'Bé Ba-Cơm Gà Nha Trang','8','HCM','797A Tạ Quang Bửu','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbebacomganhatrang.jpg?alt=media&token=ffcf5eba-53db-4d8b-8ea2-33f874d08eab'),(16,'Pizza Hut-Phổ Quang','Tân Bình','HCM','66 Phổ Quang','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fpizzahutphoquang.jpg?alt=media&token=92a9de73-1130-45ac-a676-ac32acf62199'),(17,'Uncle Tea','4','HCM','K44 Hoàng Diệu','',NULL,NULL,NULL,'Đồ Uống','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Funcletea.jpg?alt=media&token=1aff0f8c-f469-4b60-90f6-3fdc253f2742'),(18,'Bánh Canh Cua-Trần Khắc Chân','1','HCM','87 Trần Khắc Chân','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2FbanhcanhcuaTrankhacchan.jpg?alt=media&token=2eae11c4-c0ee-4111-8773-fed706c85421'),(19,'Mỳ Quảng 3 anh em','7','HCM','577 Nguyễn Thị Thập','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fmiquang3anhem.jpg?alt=media&token=4ec8b53e-bcdb-4664-aa93-a10c520971b2'),(20,'Bún bò Bà Chiểu','Gò Vấp','HCM','218A Lê Văn Thọ','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbunbobachieu.jpg?alt=media&token=59667987-f2e9-40bf-adcb-9cbb8c4f2a3f'),(21,'Chè Bưởi Vĩnh Long','5','HCM','220 Tô Hiến Thành','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fchebuoivinhlong.jpg?alt=media&token=31a5c22c-fd38-425c-876a-022bc2366350'),(22,'Cơm gà da giòn','Bình Thạnh','HCM','129 Nguyễn Gia Trí (D2)','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fcomgadagion.jpg?alt=media&token=1dc35f9b-72b5-446b-a304-587e496da5a1'),(23,'Tèo Bokki','Tân Phú','HCM','14A Huỳnh Thiện Lộc','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fteobokki.jpg?alt=media&token=466db7d2-eb23-45d1-80fb-bca667752be3'),(24,'Chè Bưởi Tứ Sắc','Phú Nhuận','HCM','170D/5 Phan Đăng Lưu','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fchebuoitusac.jpg?alt=media&token=cd27a405-d6f3-407f-b79f-11d77c7e9eb6'),(25,'Phá lấu Cô Ba Vân','Gò Vấp','HCM','288 Thống Nhất','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fphalaucobavan.jpg?alt=media&token=861cccf0-d5d6-47bd-b6a4-511235368521'),(26,'Súp cua Trần Bội Cơ','5','HCM','266 Hải Thượng Lãn Ông','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fsupcuatranboico.jpg?alt=media&token=4d744f56-4003-4108-bac1-1360c03de35e'),(27,'Bún đậu mẹt','7','HCM','554 Lê Văn Lương','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbundaumet.jpg?alt=media&token=6b94ece3-4db2-4511-8636-e3ec95eb30d9'),(28,'Cơm cháy Chà bông chất','3','HCM','256B Cách Mạng Tháng Tám','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fcomchaychabongchat.jpg?alt=media&token=2994355b-bd64-45b5-a923-2978c1223010'),(29,'Hoàng Ty-Đặc sản Trảng Bàng','Phú Nhuận','HCM','32 Hoa Mai','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fhoangtydacsantrangbang.jpg?alt=media&token=7af68006-09a6-4d45-9f93-1d5e7ef7723e'),(30,'Thiệu Ký-Mì tưới kéo sợi kiểu Hoa','11','HCM','66/5 Lê Đại Hành','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2FthieukyMituoikeosoikieuhoa.jpg?alt=media&token=9240dd0f-aaf5-4202-a0d0-46a1593ea169'),(31,'Hoành thánh lá','3','HCM','325 Nguyễn Thượng Hiền','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fhoanhthanhla.jpg?alt=media&token=b4f69c0b-c8b0-4717-a955-69f8bc57e76a'),(32,'Bánh tráng cuộn trộn dì Dương','4','HCM','Nhà thờ Xóm Chiếu','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbanhtrancuontrondiduong.jpg?alt=media&token=e27a8f6b-2b45-48e0-9183-10e5ba2fcabd'),(33,'Chè Huế Bé Sa','10','HCM','Lô R chung cư Ngô Gia Tự','',NULL,NULL,NULL,'Ăn Vặt','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fchehuebesa.jpg?alt=media&token=228520a0-0dd3-4d8e-b8c6-1be6aac6f718'),(34,'Phở Bắc- Đường A','2','HCM','B25 Đường A','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fphobacduonga.jpg?alt=media&token=e03410ce-d005-414b-a3c2-359a0c4d30be'),(35,'Hội An Sense','1','HCM','12 Phan Kế Bính','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fhoiansense.jpg?alt=media&token=04981bb4-f9f9-4f7c-baa6-8f98d5dd7466'),(36,'Nếp vàng','7','HCM','37 đường số 6, khu Him Lam','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fnepvang.jpg?alt=media&token=d0db21cc-9c12-4c4b-9505-3943097037d3'),(37,'Trà sữa nhà làm Hoa Ly','Bình Thạnh','HCM','143/4C Ung Văn Khiêm','',NULL,NULL,NULL,'Đồ Uống','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Ftrasuanhalamhoaly.jpg?alt=media&token=03ce24f8-9e85-4aa2-97a7-682ebf7a1a12'),(38,'Bánh mỳ Huỳnh Hoa','1','HCM','26 Lê Thị Riêng','',NULL,NULL,NULL,'Món Mặn','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fbanhihuynhhoa.jpg?alt=media&token=85db4b87-50d6-4728-b897-5f37f1076255'),(39,'Quán Chay Thảo','6','HCM','30/11 Nguyễn Đình Chi',NULL,NULL,NULL,NULL,'Món Chay','https://firebasestorage.googleapis.com/v0/b/flashfood-ce894.appspot.com/o/food%2Fquanchaythao.jpg?alt=media&token=3378210a-752b-414c-843c-e349fee6d519'),(40,'abc','1','hcm','abc',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `stores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `role` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'thanhtinhpas2','123123','ROLE_ADMIN'),(3,'thanhtinhpas3','123123','ROLE_USER'),(4,'thanhtinhpas1','123123','ROLE_USER');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-12 14:48:20
