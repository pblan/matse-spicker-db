-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 20, 2022 at 02:59 PM
-- Server version: 8.0.26
-- PHP Version: 7.4.20
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";
/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */
;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */
;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */
;
/*!40101 SET NAMES utf8mb4 */
;
--
-- Database: `db_kemper`
--
CREATE DATABASE IF NOT EXISTS `db_kemper` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_kemper`;
-- --------------------------------------------------------
--
-- Table structure for table `Assistenten`
--
DROP TABLE IF EXISTS `Assistenten`;
CREATE TABLE IF NOT EXISTS `Assistenten` (
  `PersNr` int NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Fachgebiet` varchar(30) DEFAULT NULL,
  `Boss` int NOT NULL,
  PRIMARY KEY (`PersNr`),
  KEY `Boss` (`Boss`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `Assistenten`
--
TRUNCATE TABLE `Assistenten`;
--
-- Dumping data for table `Assistenten`
--
INSERT INTO `Assistenten` (`PersNr`, `Name`, `Fachgebiet`, `Boss`)
VALUES (3002, 'Platon', 'Ideenlehre', 2125),
  (3003, 'Aristoteles', 'Syllogistik', 2125),
  (3004, 'Wittgenstein', 'Sprachtheorie', 2126),
  (3005, 'Rhetikus', 'Planetenbewegung', 2127),
  (3006, 'Newton', 'Keplersche Gesetze', 2127),
  (3007, 'Spinoza', 'Gott und Natur', 2134);
-- --------------------------------------------------------
--
-- Table structure for table `hoeren`
--
DROP TABLE IF EXISTS `hoeren`;
CREATE TABLE IF NOT EXISTS `hoeren` (
  `MatrNr` int NOT NULL DEFAULT '0',
  `VorlNr` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`MatrNr`, `VorlNr`),
  KEY `fk_hoeren_Vorlesungen1_idx` (`VorlNr`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `hoeren`
--
TRUNCATE TABLE `hoeren`;
--
-- Dumping data for table `hoeren`
--
INSERT INTO `hoeren` (`MatrNr`, `VorlNr`)
VALUES (27550, 4052),
  (29120, 4052),
  (29120, 4630),
  (26120, 5001),
  (27550, 5001),
  (29120, 5001),
  (29555, 5001),
  (25403, 5022),
  (29555, 5022),
  (28106, 5041),
  (29120, 5041),
  (29120, 5049),
  (28106, 5052),
  (28106, 5216),
  (28106, 5259);
-- --------------------------------------------------------
--
-- Table structure for table `Professoren`
--
DROP TABLE IF EXISTS `Professoren`;
CREATE TABLE IF NOT EXISTS `Professoren` (
  `PersNr` int NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Rang` varchar(10) DEFAULT NULL,
  `Standort` varchar(20) DEFAULT NULL,
  `Raum` int DEFAULT NULL,
  PRIMARY KEY (`PersNr`),
  UNIQUE KEY `Raum` (`Raum`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `Professoren`
--
TRUNCATE TABLE `Professoren`;
--
-- Dumping data for table `Professoren`
--
INSERT INTO `Professoren` (`PersNr`, `Name`, `Rang`, `Standort`, `Raum`)
VALUES (2125, 'Sokrates', 'C4', 'Jülich', 226),
  (2126, 'Russel', 'C4', 'Jülich', 232),
  (2127, 'Kopernikus', 'C3', 'Aachen', 310),
  (2133, 'Popper', 'C3', 'Aachen', 52),
  (2134, 'Augustinus', 'C3', 'Aachen', 309),
  (2136, 'Curie', 'C4', 'Jülich', 36),
  (2137, 'Kant', 'C4', 'Jülich', 7);
-- --------------------------------------------------------
--
-- Table structure for table `pruefen`
--
DROP TABLE IF EXISTS `pruefen`;
CREATE TABLE IF NOT EXISTS `pruefen` (
  `MatrNr` int NOT NULL,
  `VorlNr` int NOT NULL,
  `PersNr` int NOT NULL,
  `Note` decimal(2, 1) DEFAULT NULL,
  PRIMARY KEY (`MatrNr`, `VorlNr`, `PersNr`),
  KEY `fk_pruefen_Vorlesungen1_idx` (`VorlNr`),
  KEY `fk_pruefen_Professoren1_idx` (`PersNr`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `pruefen`
--
TRUNCATE TABLE `pruefen`;
--
-- Dumping data for table `pruefen`
--
INSERT INTO `pruefen` (`MatrNr`, `VorlNr`, `PersNr`, `Note`)
VALUES (24002, 5041, 2125, '3.0'),
  (25403, 5041, 2125, '2.0'),
  (27550, 4630, 2137, '2.0'),
  (28106, 5001, 2126, '1.0'),
  (29555, 5041, 2125, '4.0');
-- --------------------------------------------------------
--
-- Table structure for table `studenten`
--
DROP TABLE IF EXISTS `studenten`;
CREATE TABLE IF NOT EXISTS `studenten` (
  `MatrNr` int NOT NULL,
  `Name` varchar(30) NOT NULL,
  `Semester` int DEFAULT NULL,
  PRIMARY KEY (`MatrNr`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `studenten`
--
TRUNCATE TABLE `studenten`;
--
-- Dumping data for table `studenten`
--
INSERT INTO `studenten` (`MatrNr`, `Name`, `Semester`)
VALUES (24002, 'Xenokrates', 18),
  (25403, 'Jonas', 12),
  (26120, 'Fichte', 10),
  (26830, 'Aristoxenos', 8),
  (27550, 'Schopenhauer', 6),
  (28106, 'Carnap', 3),
  (29120, 'Theophrastos', 2),
  (29555, 'Feuerbach', 2);
-- --------------------------------------------------------
--
-- Table structure for table `voraussetzen`
--
DROP TABLE IF EXISTS `voraussetzen`;
CREATE TABLE IF NOT EXISTS `voraussetzen` (
  `Vorgaenger` int NOT NULL DEFAULT '0',
  `Nachfolger` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`Vorgaenger`, `Nachfolger`),
  KEY `fk_voraussetzen_Vorlesungen2_idx` (`Nachfolger`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `voraussetzen`
--
TRUNCATE TABLE `voraussetzen`;
--
-- Dumping data for table `voraussetzen`
--
INSERT INTO `voraussetzen` (`Vorgaenger`, `Nachfolger`)
VALUES (5001, 5041),
  (5001, 5043),
  (5001, 5049),
  (5041, 5052),
  (5043, 5052),
  (5041, 5216),
  (5052, 5259);
-- --------------------------------------------------------
--
-- Table structure for table `Vorlesungen`
--
DROP TABLE IF EXISTS `Vorlesungen`;
CREATE TABLE IF NOT EXISTS `Vorlesungen` (
  `VorlNr` int NOT NULL,
  `Titel` varchar(30) DEFAULT NULL,
  `SWS` int DEFAULT NULL,
  `gelesenVon` int NOT NULL,
  PRIMARY KEY (`VorlNr`),
  KEY `fk_Vorlesungen_Professoren1_idx` (`gelesenVon`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `Vorlesungen`
--
TRUNCATE TABLE `Vorlesungen`;
--
-- Dumping data for table `Vorlesungen`
--
INSERT INTO `Vorlesungen` (`VorlNr`, `Titel`, `SWS`, `gelesenVon`)
VALUES (4052, 'Logik', 4, 2125),
  (4630, 'Die 3 Kritiken', 4, 2137),
  (5001, 'Grundzuege', 4, 2125),
  (5022, 'Glaube und Wissen', 2, 2134),
  (5041, 'Ethik', 4, 2125),
  (5043, 'Erkenntnistheorie', 3, 2126),
  (5049, 'Maeeutik', 2, 2125),
  (5052, 'Wissenschaftstheorie', 3, 2126),
  (5216, 'Bioethik', 2, 2126),
  (5259, 'Der Wiener Kreis', 2, 2133);
--
-- Constraints for dumped tables
--
--
-- Constraints for table `Assistenten`
--
ALTER TABLE `Assistenten`
ADD CONSTRAINT `assistenten_ibfk_1` FOREIGN KEY (`Boss`) REFERENCES `Professoren` (`PersNr`);
--
-- Constraints for table `hoeren`
--
ALTER TABLE `hoeren`
ADD CONSTRAINT `fk_hoeren_Studenten1` FOREIGN KEY (`MatrNr`) REFERENCES `Studenten` (`MatrNr`),
  ADD CONSTRAINT `fk_hoeren_Vorlesungen1` FOREIGN KEY (`VorlNr`) REFERENCES `Vorlesungen` (`VorlNr`);
--
-- Constraints for table `pruefen`
--
ALTER TABLE `pruefen`
ADD CONSTRAINT `fk_pruefen_Professoren1` FOREIGN KEY (`PersNr`) REFERENCES `Professoren` (`PersNr`),
  ADD CONSTRAINT `fk_pruefen_Studenten1` FOREIGN KEY (`MatrNr`) REFERENCES `Studenten` (`MatrNr`),
  ADD CONSTRAINT `fk_pruefen_Vorlesungen1` FOREIGN KEY (`VorlNr`) REFERENCES `Vorlesungen` (`VorlNr`);
--
-- Constraints for table `voraussetzen`
--
ALTER TABLE `voraussetzen`
ADD CONSTRAINT `fk_voraussetzen_Vorlesungen1` FOREIGN KEY (`Vorgaenger`) REFERENCES `Vorlesungen` (`VorlNr`),
  ADD CONSTRAINT `fk_voraussetzen_Vorlesungen2` FOREIGN KEY (`Nachfolger`) REFERENCES `Vorlesungen` (`VorlNr`);
--
-- Constraints for table `Vorlesungen`
--
ALTER TABLE `Vorlesungen`
ADD CONSTRAINT `fk_Vorlesungen_Professoren1` FOREIGN KEY (`gelesenVon`) REFERENCES `Professoren` (`PersNr`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;