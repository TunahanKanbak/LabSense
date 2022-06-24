-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 24, 2022 at 05:15 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deneytalebi`
--

INSERT INTO `deneytalebi` (`talepID`, `tarih`, `deneyKafilesi`, `deneyTuru`, `durum`) VALUES
(138, '2022-06-22', 'son-deneme-1', 'A', 'closed'),
(139, '2022-06-22', 'son-deneme-2', 'B', 'closed'),
(140, '2022-06-22', 'test', 'A', 'closed'),
(141, '2022-06-22', 'deneme', 'A', 'closed'),
(142, '2022-06-22', 'asd', 'A', 'closed'),
(143, '2022-06-22', 'Ceren', 'A', 'closed'),
(144, '2022-06-24', 'Deneme-son', 'A', 'closed'),
(145, '2022-06-24', 'deneme', 'A', 'closed'),
(146, '2022-06-24', 'deneme', 'B', 'open');

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
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `deneyverisi`
--

INSERT INTO `deneyverisi` (`deneyID`, `zaman`, `sicaklik`, `sonuc`, `aciklama`) VALUES
(84, '2022-06-01 11:30:00', 50, 11, 'Run 1'),
(85, '2022-06-01 12:30:00', 50, 9, 'Run 2'),
(86, '2022-06-01 13:00:00', 50, 8.7, 'Run 3'),
(87, '2022-06-01 13:35:00', 50, 5, 'KS'),
(88, '2022-06-01 14:35:00', 50, 6, 'KS+1'),
(89, '2022-06-01 15:35:00', 50, 6.6, 'KS+2'),
(90, '2022-06-01 13:00:00', 20, 11, 'Run 9'),
(91, '2022-06-01 13:33:00', 20, 9, 'Run 11'),
(92, '2022-06-01 14:02:00', 20, 7.6, 'KS'),
(93, '2022-06-01 15:02:00', 20, 7.4, 'KS + 1'),
(94, '2022-06-01 16:02:00', 20, 8, 'KS + 2'),
(95, '2022-06-01 17:02:00', 20, 8.8, 'KS + 3'),
(96, '2022-06-30 13:13:00', 26, 5, 'Run 1'),
(97, '2022-06-30 15:00:00', 26, 6, 'KS'),
(98, '2022-06-30 16:00:00', 26, 7, 'KS+1'),
(99, '2022-06-01 13:01:00', 25, 5, 'Run 1'),
(100, '2022-06-01 14:02:00', 25, 5.5, 'KS'),
(101, '2022-06-09 13:13:00', 25, 5, 'Run 1'),
(102, '2022-06-09 14:14:00', 25, 5.5, 'ks'),
(103, '2022-06-09 15:15:00', 52, 7.7, 'KS + 1'),
(104, '2022-06-15 12:00:00', 25, 5, 'Run 1'),
(105, '2022-06-15 14:00:00', 27, 6, 'Run 2'),
(106, '2022-06-15 15:35:00', 30, 6.6, 'KS'),
(107, '2022-06-15 16:35:00', 31, 7, 'KS+1'),
(108, '2022-06-15 17:35:00', 32, 8, 'KS+2'),
(109, '2022-06-18 13:32:00', 50, 7.09, 'Run 9'),
(110, '2022-06-18 14:42:00', 50, 11.2, 'Run 11'),
(111, '2022-06-18 15:00:00', 50, 3.9, 'KS'),
(112, '2022-06-18 16:00:00', 50, 6, 'KS + 1'),
(113, '2022-06-24 13:13:00', 25, 5, 'Run 1'),
(114, '2022-06-24 14:14:00', 50, 6, 'KS'),
(115, '2022-06-24 15:14:00', 60, 7, 'KS+1');

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `girisyapar`
--

INSERT INTO `girisyapar` (`kullaniciAdi`, `deneyID`) VALUES
('tunahan', 84),
('tunahan', 85),
('tunahan', 86),
('tunahan', 87),
('tunahan', 88),
('tunahan', 89),
('tunahan', 90),
('tunahan', 91),
('tunahan', 92),
('tunahan', 93),
('tunahan', 94),
('tunahan', 95),
('tunahan', 96),
('tunahan', 97),
('tunahan', 98),
('tunahan', 99),
('tunahan', 100),
('tunahan', 101),
('tunahan', 102),
('tunahan', 103),
('technician', 104),
('technician', 105),
('technician', 106),
('technician', 107),
('technician', 108),
('tunahan', 109),
('tunahan', 110),
('tunahan', 111),
('tunahan', 112),
('murat', 113),
('murat', 114),
('murat', 115);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `sahiptir`
--

INSERT INTO `sahiptir` (`talepID`, `deneyID`) VALUES
(138, 84),
(138, 85),
(138, 86),
(138, 87),
(138, 88),
(138, 89),
(139, 90),
(139, 91),
(139, 92),
(139, 93),
(139, 94),
(139, 95),
(140, 96),
(140, 97),
(140, 98),
(141, 99),
(141, 100),
(142, 101),
(142, 102),
(142, 103),
(143, 104),
(143, 105),
(143, 106),
(143, 107),
(143, 108),
(144, 109),
(144, 110),
(144, 111),
(144, 112),
(145, 113),
(145, 114),
(145, 115);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `talepeder`
--

INSERT INTO `talepeder` (`kullaniciAdi`, `talepID`) VALUES
('tunahan', 138),
('tunahan', 139),
('tunahan', 140),
('tunahan', 141),
('tunahan', 142),
('customer', 143),
('tunahan', 144),
('tunahan', 145),
('murat', 146);

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
