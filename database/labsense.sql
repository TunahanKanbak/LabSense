-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 13, 2022 at 09:39 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `labsense`
--

-- --------------------------------------------------------

--
-- Table structure for table `deneytalebi`
--

DROP TABLE IF EXISTS `deneytalebi`;
CREATE TABLE IF NOT EXISTS `deneytalebi` (
  `talepID` int(11) NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `deneyKafilesi` varchar(50) NOT NULL,
  `deneyTuru` enum('A','B') NOT NULL,
  `durum` varchar(10) NOT NULL,
  PRIMARY KEY (`talepID`)
) ENGINE=InnoDB AUTO_INCREMENT=177 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deneytalebi`
--

INSERT INTO `deneytalebi` (`talepID`, `tarih`, `deneyKafilesi`, `deneyTuru`, `durum`) VALUES
(166, '2022-07-05', 'birinci deney', 'A', 'closed'),
(167, '2022-07-05', 'birinci deney', 'B', 'closed'),
(168, '2022-07-05', 'ikinci deney', 'A', 'closed'),
(169, '2022-07-05', 'ikinci deney', 'B', 'closed'),
(171, '2022-07-05', 'deney-kafilesi-adi', 'A', 'closed'),
(172, '2022-07-11', 'deneme-kafilesi', 'A', 'closed'),
(173, '2022-07-11', 'deneme-kafilesi', 'A', 'closed'),
(174, '2022-07-11', 'deneme-kafilesi', 'A', 'closed'),
(175, '2022-07-12', 'alperen', 'B', 'closed'),
(176, '2022-07-12', 'deneme-kafilesi', 'A', 'closed');

-- --------------------------------------------------------

--
-- Table structure for table `deneyverisi`
--

DROP TABLE IF EXISTS `deneyverisi`;
CREATE TABLE IF NOT EXISTS `deneyverisi` (
  `deneyID` int(11) NOT NULL AUTO_INCREMENT,
  `zaman` datetime NOT NULL,
  `sicaklik` float NOT NULL,
  `sonuc` float NOT NULL,
  `aciklama` longtext NOT NULL,
  PRIMARY KEY (`deneyID`)
) ENGINE=InnoDB AUTO_INCREMENT=1012 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `deneyverisi`
--

INSERT INTO `deneyverisi` (`deneyID`, `zaman`, `sicaklik`, `sonuc`, `aciklama`) VALUES
(950, '2022-07-01 10:33:00', 50, 32, 'Run 1'),
(951, '2022-07-01 11:15:00', 50, 15, 'Run 2'),
(952, '2022-07-01 11:35:00', 50, 12, 'Run 3'),
(953, '2022-07-01 12:05:00', 50, 9, 'Run 4'),
(954, '2022-07-01 12:30:00', 50, 7.88, 'Run 5'),
(955, '2022-07-01 13:15:00', 50, 4.76, 'KS'),
(956, '2022-07-01 14:15:00', 50, 5.1, 'KS+1'),
(957, '2022-07-01 15:15:00', 50, 5.78, 'KS+2'),
(958, '2022-07-01 16:15:00', 50, 6.45, 'KS+3'),
(959, '2022-07-30 09:35:00', 40, 22, 'Run 1'),
(960, '2022-07-30 10:03:00', 40, 15, 'Run 2'),
(961, '2022-07-30 10:33:00', 40, 16, 'Run 4'),
(962, '2022-07-30 10:54:00', 40, 12, 'Run 5'),
(963, '2022-07-30 11:45:00', 40, 9, 'Run 7'),
(964, '2022-07-30 12:15:00', 40, 7.5, 'KS'),
(965, '2022-07-30 13:15:00', 40, 7, 'KS+1'),
(966, '2022-07-30 14:15:00', 40, 8, 'KS+2'),
(967, '2022-07-30 15:15:00', 40, 8.78, 'KS+3'),
(968, '2022-07-30 16:15:00', 40, 9.45, 'KS+4'),
(969, '2022-07-15 11:03:00', 60, 4, 'Run 2'),
(970, '2022-07-15 11:30:00', 60, 7, 'Run 5'),
(971, '2022-07-15 11:55:00', 60, 10, 'Run 7'),
(972, '2022-07-15 12:45:00', 60, 14, 'Run 10'),
(973, '2022-07-15 14:00:00', 60, 11, 'Run 11'),
(974, '2022-07-15 17:30:00', 60, 7, 'Run 13'),
(975, '2022-08-01 12:30:00', 40, 11, 'Run 11'),
(976, '2022-08-01 13:15:00', 40, 8.56, 'Run 12'),
(977, '2022-08-01 13:45:00', 40, 5.31, 'KS'),
(978, '2022-08-01 14:45:00', 50, 5, 'KS+1'),
(979, '2022-08-01 15:45:00', 50, 5.98, 'KS+2'),
(980, '2022-08-01 16:45:00', 50, 6.72, 'KS+3'),
(981, '2022-08-01 17:45:00', 50, 7.36, 'KS+4'),
(982, '2022-08-01 18:45:00', 50, 8.44, 'KS+5'),
(986, '2022-07-24 13:00:00', 50, 5.55, 'KS+1'),
(987, '2022-07-24 14:00:00', 50, 6.43, 'KS+2'),
(988, '2022-07-24 15:00:00', 50, 7.54, 'KS+3'),
(989, '2022-07-24 16:00:00', 50, 8.13, 'KS+4'),
(990, '2022-07-24 17:00:00', 50, 9.23, 'KS+5'),
(991, '2022-02-01 13:22:00', 50, 9, 'Run 11'),
(992, '2022-02-01 14:12:00', 50, 6.5, 'KS'),
(993, '2022-02-01 15:12:00', 40, 5.5, 'KS+1'),
(994, '2022-02-01 16:12:00', 40, 5.9, 'KS+2'),
(995, '2022-02-01 17:12:00', 40, 6.5, 'KS+3'),
(996, '2022-07-01 10:35:00', 50, 6, 'Run 9'),
(997, '2022-07-01 11:00:00', 50, 7.5, 'Run 11'),
(998, '2022-07-01 13:00:00', 50, 10, 'KS'),
(999, '2022-07-01 14:00:00', 50, 6, 'KS+1'),
(1000, '2022-07-01 15:00:00', 50, 4.76, 'KS+2'),
(1001, '2022-07-13 13:13:00', 20, 20, 'Run 1'),
(1002, '2022-07-13 15:30:00', 30, 30, 'Run 9'),
(1003, '2022-07-13 16:00:00', 40, 40, 'KS'),
(1004, '2022-07-15 13:15:00', 45, 5, 'Run 1'),
(1005, '2022-07-15 14:00:00', 50, 7.34, 'Run 2'),
(1006, '2022-07-15 14:30:00', 50, 5.3, 'KS'),
(1007, '2022-07-15 15:30:00', 50, 3.2, 'KS+1'),
(1008, '2022-07-13 13:13:00', 50, 4.5, 'Run 1'),
(1009, '2022-07-13 13:30:00', 50, 3.3, 'KS'),
(1010, '2022-07-13 13:45:00', 50, 3, 'KS'),
(1011, '2022-07-13 14:45:00', 50, 5, 'KS+1');

-- --------------------------------------------------------

--
-- Table structure for table `girisyapar`
--

DROP TABLE IF EXISTS `girisyapar`;
CREATE TABLE IF NOT EXISTS `girisyapar` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `deneyID` int(11) NOT NULL,
  PRIMARY KEY (`kullaniciAdi`,`deneyID`),
  KEY `girisyapar_fkkey_deneyID` (`deneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `girisyapar`
--

INSERT INTO `girisyapar` (`kullaniciAdi`, `deneyID`) VALUES
('tunahan', 950),
('tunahan', 951),
('tunahan', 952),
('tunahan', 953),
('tunahan', 954),
('tunahan', 955),
('tunahan', 956),
('tunahan', 957),
('tunahan', 958),
('tunahan', 959),
('tunahan', 960),
('tunahan', 961),
('tunahan', 962),
('tunahan', 963),
('tunahan', 964),
('tunahan', 965),
('tunahan', 966),
('tunahan', 967),
('tunahan', 968),
('tunahan', 969),
('tunahan', 970),
('tunahan', 971),
('tunahan', 972),
('tunahan', 973),
('tunahan', 974),
('tunahan', 975),
('tunahan', 976),
('tunahan', 977),
('tunahan', 978),
('tunahan', 979),
('tunahan', 980),
('tunahan', 981),
('tunahan', 982),
('technician', 986),
('technician', 987),
('technician', 988),
('technician', 989),
('technician', 990),
('tunahan', 991),
('tunahan', 992),
('tunahan', 993),
('tunahan', 994),
('tunahan', 995),
('tunahan', 996),
('tunahan', 997),
('tunahan', 998),
('tunahan', 999),
('tunahan', 1000),
('tunahan', 1001),
('tunahan', 1002),
('tunahan', 1003),
('technician', 1004),
('technician', 1005),
('technician', 1006),
('technician', 1007),
('technician', 1008),
('technician', 1009),
('technician', 1010),
('technician', 1011);

-- --------------------------------------------------------

--
-- Table structure for table `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `sifre` varchar(50) NOT NULL,
  `yetki` enum('admin','customer','technician') NOT NULL,
  PRIMARY KEY (`kullaniciAdi`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kullanici`
--

INSERT INTO `kullanici` (`kullaniciAdi`, `sifre`, `yetki`) VALUES
('customer', 'user', 'customer'),
('murat', 'muratuyanik', 'admin'),
('technician', 'user', 'technician'),
('tunahan', 'tunahankanbak', 'admin');

-- --------------------------------------------------------

--
-- Table structure for table `sahiptir`
--

DROP TABLE IF EXISTS `sahiptir`;
CREATE TABLE IF NOT EXISTS `sahiptir` (
  `talepID` int(11) NOT NULL,
  `deneyID` int(11) NOT NULL,
  PRIMARY KEY (`talepID`,`deneyID`),
  KEY `sahiptir_fkkey_deneyID` (`deneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sahiptir`
--

INSERT INTO `sahiptir` (`talepID`, `deneyID`) VALUES
(166, 950),
(166, 951),
(166, 952),
(166, 953),
(166, 954),
(166, 955),
(166, 956),
(166, 957),
(166, 958),
(167, 959),
(167, 960),
(167, 961),
(167, 962),
(167, 963),
(167, 964),
(167, 965),
(167, 966),
(167, 967),
(167, 968),
(168, 969),
(168, 970),
(168, 971),
(168, 972),
(168, 973),
(168, 974),
(169, 975),
(169, 976),
(169, 977),
(169, 978),
(169, 979),
(169, 980),
(169, 981),
(169, 982),
(171, 986),
(171, 987),
(171, 988),
(171, 989),
(171, 990),
(172, 991),
(172, 992),
(172, 993),
(172, 994),
(172, 995),
(173, 996),
(173, 997),
(173, 998),
(173, 999),
(173, 1000),
(174, 1001),
(174, 1002),
(174, 1003),
(175, 1004),
(175, 1005),
(175, 1006),
(175, 1007),
(176, 1008),
(176, 1009),
(176, 1010),
(176, 1011);

-- --------------------------------------------------------

--
-- Table structure for table `talepeder`
--

DROP TABLE IF EXISTS `talepeder`;
CREATE TABLE IF NOT EXISTS `talepeder` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `talepID` int(11) NOT NULL,
  PRIMARY KEY (`kullaniciAdi`,`talepID`),
  KEY `talepeder_fkkey_talepID` (`talepID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `talepeder`
--

INSERT INTO `talepeder` (`kullaniciAdi`, `talepID`) VALUES
('tunahan', 166),
('tunahan', 167),
('tunahan', 168),
('tunahan', 169),
('customer', 171),
('tunahan', 172),
('tunahan', 173),
('tunahan', 174),
('customer', 175),
('customer', 176);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `girisyapar`
--
ALTER TABLE `girisyapar`
  ADD CONSTRAINT `girisyapar_fkkey_deneyID` FOREIGN KEY (`deneyID`) REFERENCES `deneyverisi` (`deneyID`),
  ADD CONSTRAINT `girisyapar_fkkey_kullaniciAdi` FOREIGN KEY (`kullaniciAdi`) REFERENCES `kullanici` (`kullaniciAdi`);

--
-- Constraints for table `sahiptir`
--
ALTER TABLE `sahiptir`
  ADD CONSTRAINT `sahiptir_fkkey_deneyID` FOREIGN KEY (`deneyID`) REFERENCES `deneyverisi` (`deneyID`),
  ADD CONSTRAINT `sahiptir_fkkey_talepID` FOREIGN KEY (`talepID`) REFERENCES `deneytalebi` (`talepID`);

--
-- Constraints for table `talepeder`
--
ALTER TABLE `talepeder`
  ADD CONSTRAINT `talepeder_fkkey_kullaniciAdi` FOREIGN KEY (`kullaniciAdi`) REFERENCES `kullanici` (`kullaniciAdi`),
  ADD CONSTRAINT `talepeder_fkkey_talepID` FOREIGN KEY (`talepID`) REFERENCES `deneytalebi` (`talepID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
