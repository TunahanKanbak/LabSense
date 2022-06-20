-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 19 Haz 2022, 12:58:43
-- Sunucu sürümü: 5.7.36
-- PHP Sürümü: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `labsense`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `deneyverisi`
--

DROP TABLE IF EXISTS `deneyverisi`;
CREATE TABLE IF NOT EXISTS `deneyverisi` (
  `deneyID` int(11) NOT NULL AUTO_INCREMENT,
  `zaman` datetime NOT NULL,
  `sicaklik` float NOT NULL,
  `sonuc` float NOT NULL,
  `aciklama` longtext NOT NULL,
  PRIMARY KEY (`deneyID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `deneyverisi`
--

INSERT INTO `deneyverisi` (`deneyID`, `zaman`, `sicaklik`, `sonuc`, `aciklama`) VALUES
(3, '2022-06-17 10:40:15', 12, 5, 'yogun'),
(4, '2022-06-17 10:50:25', 12, 4, 'yogun'),
(5, '2022-06-17 10:40:15', 12, 5, 'yogun'),
(6, '2022-06-17 10:50:25', 12, 4, 'yogun'),
(7, '2022-06-17 10:40:15', 12, 5, 'yogun'),
(8, '2022-06-17 10:40:15', 12, 5, 'yogun'),
(9, '2022-06-17 10:50:25', 12, 4, 'yogun'),
(10, '2022-06-17 10:40:15', 12, 5, 'yogun'),
(11, '2022-06-17 10:50:25', 12, 4, 'yogun'),
(12, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(13, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun'),
(14, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(15, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun'),
(16, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(17, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun'),
(18, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(19, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun'),
(20, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(21, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun'),
(22, '2022-06-17 10:40:15', 12.2, 4.5, 'yogun'),
(23, '2022-06-17 10:50:25', 12.4, 4.3, 'yogun');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
