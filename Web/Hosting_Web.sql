-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.32-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Dumping database structure for hosting_web
CREATE DATABASE IF NOT EXISTS `hosting_web` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `hosting_web`;

-- Dumping structure for table hosting_web.domain
CREATE TABLE IF NOT EXISTS `domain` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) DEFAULT NULL,
  `domain_Product` varchar(100) NOT NULL,
  `date_HH` date NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_User` (`ID_User`),
  CONSTRAINT `domain_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.history
CREATE TABLE IF NOT EXISTS `history` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `date_History` timestamp NOT NULL DEFAULT current_timestamp(),
  `type_History` enum('user_activity','error','system_message') NOT NULL,
  `detail_History` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.hosting
CREATE TABLE IF NOT EXISTS `hosting` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `name_Hosting` varchar(100) NOT NULL,
  `mo_ta` text DEFAULT NULL,
  `GiaTien` decimal(10,2) NOT NULL,
  `data_Hosting` int(11) NOT NULL,
  `bandwidth` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.orders
CREATE TABLE IF NOT EXISTS `orders` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) DEFAULT NULL,
  `ID_Name_Hosting` int(11) DEFAULT NULL,
  `ID_Domain` int(11) DEFAULT NULL,
  `date_Order` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('pending','completed','cancelled') DEFAULT 'pending',
  PRIMARY KEY (`ID`),
  KEY `ID_User` (`ID_User`),
  KEY `ID_Name_Hosting` (`ID_Name_Hosting`),
  KEY `ID_Domain` (`ID_Domain`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`ID_Name_Hosting`) REFERENCES `hosting` (`ID`),
  CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`ID_Domain`) REFERENCES `domain` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.setup
CREATE TABLE IF NOT EXISTS `setup` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `setup_Name` varchar(100) NOT NULL,
  `setup_Value` text DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.support
CREATE TABLE IF NOT EXISTS `support` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_User` int(11) DEFAULT NULL,
  `Title` varchar(100) NOT NULL,
  `mo_ta` text NOT NULL,
  `date_Create` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('open','closed') DEFAULT 'open',
  PRIMARY KEY (`ID`),
  KEY `ID_User` (`ID_User`),
  CONSTRAINT `support_ibfk_1` FOREIGN KEY (`ID_User`) REFERENCES `user` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.transaction
CREATE TABLE IF NOT EXISTS `transaction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_DonHang` int(11) DEFAULT NULL,
  `SoTien` decimal(10,2) NOT NULL,
  `PhuongThucThanhToan` varchar(50) NOT NULL,
  `NgayGiaoDich` timestamp NOT NULL DEFAULT current_timestamp(),
  `TrangThai` enum('success','pending','failed') DEFAULT 'pending',
  PRIMARY KEY (`ID`),
  KEY `ID_DonHang` (`ID_DonHang`),
  CONSTRAINT `transaction_ibfk_1` FOREIGN KEY (`ID_DonHang`) REFERENCES `orders` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

-- Dumping structure for table hosting_web.user
CREATE TABLE IF NOT EXISTS `user` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(50) NOT NULL,
  `Email` varchar(100) NOT NULL,
  `Password` varchar(100) NOT NULL,
  `bill_info` varchar(255) DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Data exporting was unselected.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
