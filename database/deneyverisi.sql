-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 20 Haz 2022, 18:33:15
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
-- Tablo için tablo yapısı `deneytalebi`
--

DROP TABLE IF EXISTS `deneytalebi`;
CREATE TABLE IF NOT EXISTS `deneytalebi` (
  `talepID` int(11) NOT NULL AUTO_INCREMENT,
  `tarih` date NOT NULL,
  `deneyKafilesi` varchar(50) NOT NULL,
  `deneyTuru` varchar(10) NOT NULL,
  `durum` varchar(10) NOT NULL,
  PRIMARY KEY (`talepID`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `deneytalebi`
--

INSERT INTO `deneytalebi` (`talepID`, `tarih`, `deneyKafilesi`, `deneyTuru`, `durum`) VALUES
(101, '2022-06-01', 'Y13-1-small', 'A', 'open'),
(103, '2022-06-01', 'Y13-1-small', 'A', 'closed'),
(106, '2022-06-04', 'Y13-2-small', 'B', 'open'),
(107, '2022-06-04', 'Y13-2-small', 'B', 'open'),
(108, '2022-06-06', 'Y13-3-small', 'A', 'open'),
(109, '2022-06-08', 'Y13-4-small', 'B', 'open'),
(110, '2022-06-09', 'Y13-4-small', 'B', 'open'),
(111, '2022-06-09', 'Y13-5-small', 'B', 'open'),
(112, '2022-06-09', 'Y13-5-small', 'B', 'open'),
(113, '2022-06-09', 'Y13-5-small', 'B', 'open'),
(114, '2022-06-09', 'Y13-5-small', 'B', 'open'),
(115, '2022-06-09', 'Y13-5-small', 'B', 'open');

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

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `girisyapar`
--

DROP TABLE IF EXISTS `girisyapar`;
CREATE TABLE IF NOT EXISTS `girisyapar` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `deneyID` int(11) NOT NULL,
  PRIMARY KEY (`kullaniciAdi`,`deneyID`),
  KEY `girisyapar_fkkey_deneyID` (`deneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `girisyapar`
--

INSERT INTO `girisyapar` (`kullaniciAdi`, `deneyID`) VALUES
('technician', 20),
('technician', 21),
('technician', 22),
('technician', 23);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kullanici`
--

DROP TABLE IF EXISTS `kullanici`;
CREATE TABLE IF NOT EXISTS `kullanici` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `sifre` varchar(50) NOT NULL,
  `yetki` enum('admin','customer','technician') NOT NULL,
  PRIMARY KEY (`kullaniciAdi`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `kullanici`
--

INSERT INTO `kullanici` (`kullaniciAdi`, `sifre`, `yetki`) VALUES
('customer', 'user', 'customer'),
('murat', 'muratuyanik', 'admin'),
('technician', 'user', 'technician'),
('tunahan', 'tunahankanbak', 'admin');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `sahiptir`
--

DROP TABLE IF EXISTS `sahiptir`;
CREATE TABLE IF NOT EXISTS `sahiptir` (
  `talepID` int(11) NOT NULL,
  `deneyID` int(11) NOT NULL,
  PRIMARY KEY (`talepID`,`deneyID`),
  KEY `sahiptir_fkkey_deneyID` (`deneyID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `sahiptir`
--

INSERT INTO `sahiptir` (`talepID`, `deneyID`) VALUES
(103, 18),
(103, 19),
(103, 20),
(103, 21),
(103, 22),
(103, 23);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `talepeder`
--

DROP TABLE IF EXISTS `talepeder`;
CREATE TABLE IF NOT EXISTS `talepeder` (
  `kullaniciAdi` varchar(50) NOT NULL,
  `talepID` int(11) NOT NULL,
  PRIMARY KEY (`kullaniciAdi`,`talepID`),
  KEY `talepeder_fkkey_talepID` (`talepID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `talepeder`
--

INSERT INTO `talepeder` (`kullaniciAdi`, `talepID`) VALUES
('customer', 112),
('customer', 113),
('customer', 114),
('customer', 115);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `girisyapar`
--
ALTER TABLE `girisyapar`
  ADD CONSTRAINT `girisyapar_fkkey_deneyID` FOREIGN KEY (`deneyID`) REFERENCES `deneyverisi` (`deneyID`),
  ADD CONSTRAINT `girisyapar_fkkey_kullaniciAdi` FOREIGN KEY (`kullaniciAdi`) REFERENCES `kullanici` (`kullaniciAdi`);

--
-- Tablo kısıtlamaları `sahiptir`
--
ALTER TABLE `sahiptir`
  ADD CONSTRAINT `sahiptir_fkkey_deneyID` FOREIGN KEY (`deneyID`) REFERENCES `deneyverisi` (`deneyID`),
  ADD CONSTRAINT `sahiptir_fkkey_talepID` FOREIGN KEY (`talepID`) REFERENCES `deneytalebi` (`talepID`);

--
-- Tablo kısıtlamaları `talepeder`
--
ALTER TABLE `talepeder`
  ADD CONSTRAINT `talepeder_fkkey_kullaniciAdi` FOREIGN KEY (`kullaniciAdi`) REFERENCES `kullanici` (`kullaniciAdi`),
  ADD CONSTRAINT `talepeder_fkkey_talepID` FOREIGN KEY (`talepID`) REFERENCES `deneytalebi` (`talepID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;