-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 20, 2022 at 03:00 PM
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
-- Database: `db_matse_mhist`
--
CREATE DATABASE IF NOT EXISTS `db_matse_mhist` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_matse_mhist`;
-- --------------------------------------------------------
--
-- Table structure for table `abteilung`
--
DROP TABLE IF EXISTS `abteilung`;
CREATE TABLE IF NOT EXISTS `abteilung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `abteilung`
--
TRUNCATE TABLE `abteilung`;
--
-- Dumping data for table `abteilung`
--
INSERT INTO `abteilung` (`id`, `name`)
VALUES (1, 'Vorstand'),
  (2, 'HR/Buchhaltung'),
  (3, 'Vertrieb'),
  (4, 'Marketing'),
  (5, 'Einkauf'),
  (6, 'F&E'),
  (7, 'AR');
-- --------------------------------------------------------
--
-- Table structure for table `arbeitet_in_als`
--
DROP TABLE IF EXISTS `arbeitet_in_als`;
CREATE TABLE IF NOT EXISTS `arbeitet_in_als` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mitarbeiter_id` int NOT NULL,
  `abteilung_id` int NOT NULL,
  `rolle_id` int NOT NULL,
  `wochenstunden` decimal(6, 2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_arbeitet_in_als_mitarbeiter_idx` (`mitarbeiter_id`),
  KEY `fk_arbeitet_in_als_abteilung_idx` (`abteilung_id`),
  KEY `fk_arbeitet_in_als_rolle_idx` (`rolle_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 42 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `arbeitet_in_als`
--
TRUNCATE TABLE `arbeitet_in_als`;
--
-- Dumping data for table `arbeitet_in_als`
--
INSERT INTO `arbeitet_in_als` (
    `id`,
    `mitarbeiter_id`,
    `abteilung_id`,
    `rolle_id`,
    `wochenstunden`
  )
VALUES (1, 1, 1, 3, '10.00'),
  (2, 1, 1, 4, '5.00'),
  (3, 1, 2, 3, '10.00'),
  (4, 1, 2, 4, '15.00'),
  (5, 2, 1, 4, '5.00'),
  (6, 2, 3, 3, '10.00'),
  (7, 2, 3, 4, '25.00'),
  (12, 3, 1, 4, '5.00'),
  (13, 3, 4, 4, '35.00'),
  (14, 4, 7, 3, '10.00'),
  (15, 4, 7, 4, '5.00'),
  (16, 5, 7, 4, '5.00'),
  (17, 6, 7, 4, '5.00'),
  (18, 7, 2, 4, '20.00'),
  (19, 8, 2, 4, '40.00'),
  (20, 9, 3, 4, '40.00'),
  (21, 10, 3, 4, '30.00'),
  (22, 11, 3, 4, '40.00'),
  (23, 12, 4, 3, '10.00'),
  (24, 12, 4, 4, '30.00'),
  (25, 13, 4, 4, '30.00'),
  (26, 23, 4, 8, '20.00'),
  (27, 14, 5, 3, '10.00'),
  (28, 14, 5, 4, '30.00'),
  (29, 15, 5, 4, '40.00'),
  (30, 16, 6, 3, '10.00'),
  (31, 16, 6, 4, '30.00'),
  (32, 17, 6, 4, '40.00'),
  (33, 18, 6, 7, '0.00'),
  (34, 18, 6, 8, '20.00'),
  (35, 20, 6, 4, '40.00'),
  (36, 18, 6, 4, '20.00'),
  (37, 21, 6, 4, '20.00'),
  (38, 22, 6, 7, '0.00'),
  (39, 22, 6, 8, '20.00'),
  (40, 22, 6, 4, '20.00'),
  (41, 23, 4, 4, '20.00');
-- --------------------------------------------------------
--
-- Table structure for table `besteht_aus`
--
DROP TABLE IF EXISTS `besteht_aus`;
CREATE TABLE IF NOT EXISTS `besteht_aus` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bestellung_id` int NOT NULL,
  `produkt_id` int NOT NULL,
  `einheiten` decimal(12, 2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_besteht_aus_bestellung_idx` (`bestellung_id`),
  KEY `fk_besteht_aus_produkt_idx` (`produkt_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `besteht_aus`
--
TRUNCATE TABLE `besteht_aus`;
--
-- Dumping data for table `besteht_aus`
--
INSERT INTO `besteht_aus` (`id`, `bestellung_id`, `produkt_id`, `einheiten`)
VALUES (1, 1, 15, '12.00'),
  (2, 1, 16, '6.00'),
  (3, 1, 18, '24.00'),
  (4, 2, 22, '10.00'),
  (5, 2, 23, '5.00'),
  (6, 2, 24, '5.00'),
  (7, 2, 11, '20.00'),
  (8, 3, 15, '6.00'),
  (9, 3, 17, '12.00'),
  (10, 3, 18, '12.00');
-- --------------------------------------------------------
--
-- Table structure for table `bestellung`
--
DROP TABLE IF EXISTS `bestellung`;
CREATE TABLE IF NOT EXISTS `bestellung` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kunde_id` int NOT NULL,
  `vermittler_mitarbeiter_id` int NOT NULL,
  `vom` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_bestellung_kunde_idx` (`kunde_id`),
  KEY `fk_bestellung_mitarbeiter_idx` (`vermittler_mitarbeiter_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `bestellung`
--
TRUNCATE TABLE `bestellung`;
--
-- Dumping data for table `bestellung`
--
INSERT INTO `bestellung` (
    `id`,
    `kunde_id`,
    `vermittler_mitarbeiter_id`,
    `vom`
  )
VALUES (1, 30, 9, '2014-09-12 00:00:00'),
  (2, 30, 10, '2014-08-30 00:00:00'),
  (3, 32, 9, '2014-09-11 00:00:00');
-- --------------------------------------------------------
--
-- Table structure for table `kennt`
--
DROP TABLE IF EXISTS `kennt`;
CREATE TABLE IF NOT EXISTS `kennt` (
  `id` int NOT NULL,
  `kunde_a_id` int NOT NULL,
  `kunde_b_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_kennt_kunde_a_idx` (`kunde_a_id`),
  KEY `fk_kennt_kunde_b_idx` (`kunde_b_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `kennt`
--
TRUNCATE TABLE `kennt`;
--
-- Dumping data for table `kennt`
--
INSERT INTO `kennt` (`id`, `kunde_a_id`, `kunde_b_id`)
VALUES (1001, 2, 31),
  (1002, 34, 31),
  (1003, 30, 31),
  (1004, 29, 30),
  (1005, 27, 29),
  (1006, 27, 30),
  (1007, 28, 30),
  (1008, 26, 28),
  (1009, 32, 35),
  (1010, 35, 36),
  (1011, 32, 36),
  (1012, 36, 33);
-- --------------------------------------------------------
--
-- Table structure for table `kunde`
--
DROP TABLE IF EXISTS `kunde`;
CREATE TABLE IF NOT EXISTS `kunde` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `rabatt_prozent` decimal(6, 2) DEFAULT NULL,
  `ausfallrisiko_prozent` decimal(6, 2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 37 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `kunde`
--
TRUNCATE TABLE `kunde`;
--
-- Dumping data for table `kunde`
--
INSERT INTO `kunde` (
    `id`,
    `name`,
    `rabatt_prozent`,
    `ausfallrisiko_prozent`
  )
VALUES (2, 'Bayer', '1.00', NULL),
  (26, 'BMW', '1.00', NULL),
  (27, 'Commerzbank', '0.00', NULL),
  (28, 'Daimler', '1.00', NULL),
  (29, 'Deutsche Bank', '0.00', NULL),
  (30, 'Sparkasse', '10.00', NULL),
  (31, 'Börse', '0.00', NULL),
  (32, 'E.ON', '1.00', NULL),
  (33, 'Infinion', '2.00', NULL),
  (34, 'Lufthansa', '2.00', NULL),
  (35, 'RWE', '1.00', '2.00'),
  (36, 'SAP', '2.00', NULL);
-- --------------------------------------------------------
--
-- Table structure for table `mitarbeiter`
--
DROP TABLE IF EXISTS `mitarbeiter`;
CREATE TABLE IF NOT EXISTS `mitarbeiter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `jahresgehalt` decimal(12, 2) DEFAULT NULL,
  `vorgesetzter_mitarbeiter_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_mitarbeiter_mitarbeiter_idx` (`vorgesetzter_mitarbeiter_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 28 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `mitarbeiter`
--
TRUNCATE TABLE `mitarbeiter`;
--
-- Dumping data for table `mitarbeiter`
--
INSERT INTO `mitarbeiter` (
    `id`,
    `name`,
    `jahresgehalt`,
    `vorgesetzter_mitarbeiter_id`
  )
VALUES (1, 'Mia', '110000.00', 26),
  (2, 'Ben', '90000.00', 26),
  (3, 'Emma', '70000.00', 12),
  (4, 'Paul', '5000.00', 27),
  (5, 'Hannah', '5000.00', 27),
  (6, 'Luka', '5000.00', 27),
  (7, 'Sofia', '50000.00', 1),
  (8, 'Jonas', '50000.00', 1),
  (9, 'Anna', '50000.00', 2),
  (10, 'Finn', '50000.00', 2),
  (11, 'Lea', '50000.00', 2),
  (12, 'Leon', '70000.00', 1),
  (13, 'Emilia', '50000.00', 12),
  (14, 'Luis', '70000.00', 1),
  (15, 'Marie', '50000.00', 14),
  (16, 'Lukas', '70000.00', 1),
  (17, 'Lena', '50000.00', 16),
  (18, 'Max', '12000.00', 16),
  (20, 'Leonie', '70000.00', 1),
  (21, 'Felix', '14000.00', 20),
  (22, 'Lilly', '12000.00', 20),
  (23, 'Tim', '10000.00', 12),
  (26, 'GF', '0.00', 27),
  (27, 'AR', '0.00', 26);
-- --------------------------------------------------------
--
-- Table structure for table `produkt`
--
DROP TABLE IF EXISTS `produkt`;
CREATE TABLE IF NOT EXISTS `produkt` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(100) DEFAULT NULL,
  `warengruppe_id` int NOT NULL,
  `einheit` varchar(20) DEFAULT NULL,
  `stueckpreis` decimal(12, 2) DEFAULT NULL,
  `umsatzsteuer` decimal(6, 2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_produkt_warengruppe_idx` (`warengruppe_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 103 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `produkt`
--
TRUNCATE TABLE `produkt`;
--
-- Dumping data for table `produkt`
--
INSERT INTO `produkt` (
    `id`,
    `bezeichnung`,
    `warengruppe_id`,
    `einheit`,
    `stueckpreis`,
    `umsatzsteuer`
  )
VALUES (1, 'Spinat', 1, 'PK', '1.99', '0.07'),
  (2, 'Vier Käse Pizza', 1, 'ST', '2.39', '0.07'),
  (3, 'Spinatpizza', 1, 'ST', '2.29', '0.07'),
  (4, 'Fischstäbchen', 1, 'PK', '1.99', '0.07'),
  (5, 'Nudelpfanne', 1, 'PK', '3.29', '0.07'),
  (6, 'Möhren', 2, 'KG', '0.39', '0.07'),
  (7, 'Zwiebeln', 2, 'KG', '0.29', '0.07'),
  (8, 'Bananen', 2, 'KG', '1.29', '0.07'),
  (9, 'Knoblauch', 2, 'KG', '0.98', '0.07'),
  (10, 'Fleischwurst', 3, 'ST', '1.99', '0.07'),
  (11, 'Frikadellen', 3, 'PK', '2.35', '0.07'),
  (12, 'Milch', 4, 'ST', '0.79', '0.07'),
  (13, 'Quark', 4, 'ST', '0.99', '0.07'),
  (14, 'Joghurt', 4, 'ST', '0.98', '0.07'),
  (15, 'Cola light', 5, 'ST', '1.50', '0.19'),
  (16, 'Nerd Bull', 5, 'ST', '1.50', '0.19'),
  (17, 'Eistee', 5, 'ST', '1.80', '0.19'),
  (18, 'Wasser', 5, 'ST', '0.99', '0.19'),
  (19, 'Grillwürstchen', 6, 'PK', '3.55', '0.07'),
  (20, 'Leberkäse', 6, 'PK', '2.79', '0.07'),
  (21, 'Frikandeln', 6, 'PK', '3.49', '0.07'),
  (22, 'Chips', 7, 'PK', '1.99', '0.07'),
  (23, 'Salzstangen', 7, 'PK', '1.79', '0.07'),
  (24, 'Gummibärchen', 7, 'PK', '1.59', '0.07'),
  (25, 'Tee', 8, 'ST', '2.50', '0.19'),
  (26, 'Kaffee', 8, 'ST', '3.20', '0.19'),
  (27, 'Nudeln in Soße', 9, 'PK', '1.99', '0.07'),
  (28, 'Ravioli', 9, 'PK', '1.89', '0.07'),
  (29, 'Nudeln gebraten', 9, 'PK', '2.39', '0.07'),
  (30, 'Reis süß/sauer', 9, 'PK', '2.19', '0.07'),
  (31, 'Reisfladen', 10, 'ST', '2.00', '0.07'),
  (
    32,
    'Gedeckter Apflekuchen',
    10,
    'ST',
    '2.20',
    '0.07'
  ),
  (
    33,
    'Belegtes Brötchen',
    10,
    'ST',
    '2.80',
    '0.07'
  ),
  (34, 'Graubrot', 10, 'ST', '1.90', '0.07'),
  (35, 'Bild', 11, 'ST', '0.90', '0.07'),
  (36, 'Kicker', 11, 'ST', '2.00', '0.07'),
  (37, 'c\'t', 11, 'ST', '3.70', '0.07'),
  (38, 'Computerbild', 11, 'ST', '2.20', '0.07'),
  (39, 'Zeit', 11, 'ST', '4.20', '0.07'),
  (43, 'GameStar', 11, 'ST', '6.50', '0.07'),
  (101, 'Hochzeit', 12, '1x', '128.00', '0.19'),
  (102, 'Scheidung', 12, 'nx', '512.00', '0.19');
-- --------------------------------------------------------
--
-- Table structure for table `ressource`
--
DROP TABLE IF EXISTS `ressource`;
CREATE TABLE IF NOT EXISTS `ressource` (
  `id` int NOT NULL AUTO_INCREMENT,
  `inventar_code` varchar(100) DEFAULT NULL,
  `preis` decimal(12, 2) DEFAULT NULL,
  `katalog_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `ressource_inventar_code_uindex` (`inventar_code`),
  KEY `ressource_ressource_katalog_id_fk` (`katalog_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 8 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `ressource`
--
TRUNCATE TABLE `ressource`;
--
-- Dumping data for table `ressource`
--
INSERT INTO `ressource` (`id`, `inventar_code`, `preis`, `katalog_id`)
VALUES (1, 'S-001', '193.00', 1),
  (2, 'S-002', '39.00', 3),
  (3, 'T-001', '262.00', 6),
  (4, 'T-002', '263.44', 5),
  (5, 'M-001', '1120.00', 7),
  (6, 'M-002', '1120.00', 7),
  (7, 'M-003', '551.00', 9);
-- --------------------------------------------------------
--
-- Table structure for table `ressource_katalog`
--
DROP TABLE IF EXISTS `ressource_katalog`;
CREATE TABLE IF NOT EXISTS `ressource_katalog` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beschreibung` varchar(100) DEFAULT NULL,
  `artikelnr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Truncate table before insert `ressource_katalog`
--
TRUNCATE TABLE `ressource_katalog`;
--
-- Dumping data for table `ressource_katalog`
--
INSERT INTO `ressource_katalog` (`id`, `beschreibung`, `artikelnr`)
VALUES (1, 'Stuhl JÄRVFJÄLLET', '892.756.23'),
  (2, 'Stuhl HATTEFJÄLL', '892.521.36'),
  (3, 'Stuhl RENBERGET', '203.394.20'),
  (4, 'Tisch SKARSTA', '593.248.18'),
  (5, 'Tisch BEKANT', '490.064.06'),
  (6, 'Tisch IDÅSEN', '992.810.39'),
  (7, 'Mobile iPhone 11 Pro', 'MWC22ZD/A'),
  (8, 'Mobile iPhone 11 Max', 'MWHQ2ZD/A'),
  (9, 'Mobile Pixel 4', 'GA01188-DE');
-- --------------------------------------------------------
--
-- Table structure for table `ressource_mobile`
--
DROP TABLE IF EXISTS `ressource_mobile`;
CREATE TABLE IF NOT EXISTS `ressource_mobile` (
  `id` int NOT NULL,
  `beschreibung` varchar(100) DEFAULT NULL,
  `OS` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `ressource_mobile`
--
TRUNCATE TABLE `ressource_mobile`;
--
-- Dumping data for table `ressource_mobile`
--
INSERT INTO `ressource_mobile` (`id`, `beschreibung`, `OS`)
VALUES (
    5,
    'iPhone 11 Pro, 5.8\" Display, Space Grau',
    'iOS 14'
  ),
  (
    6,
    'iPhone 11 Pro, 5.8\" Display, Nachtgrün',
    'iOS 13'
  ),
  (
    7,
    'Google Pixel 4 64GB Handy, weiß, Clearly White',
    'Android 10'
  );
-- --------------------------------------------------------
--
-- Table structure for table `ressource_moebel`
--
DROP TABLE IF EXISTS `ressource_moebel`;
CREATE TABLE IF NOT EXISTS `ressource_moebel` (
  `id` int NOT NULL,
  `beschreibung` varchar(100) DEFAULT NULL,
  `raum` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `ressource_moebel`
--
TRUNCATE TABLE `ressource_moebel`;
--
-- Dumping data for table `ressource_moebel`
--
INSERT INTO `ressource_moebel` (`id`, `beschreibung`, `raum`)
VALUES (
    1,
    'Drehstuhl mit Armlehnen, Gunnared dunkelgrau/schwarz',
    '102.1'
  ),
  (2, 'Drehstuhl, Bomstad schwarz', '103.1'),
  (
    3,
    'Schreibtisch, braun/dunkelgrau160x80 cm',
    '103.1'
  ),
  (
    4,
    'Schreibtisch sitz/steh, weiß160x80 cm',
    '102.1'
  );
-- --------------------------------------------------------
--
-- Table structure for table `rolle`
--
DROP TABLE IF EXISTS `rolle`;
CREATE TABLE IF NOT EXISTS `rolle` (
  `id` int NOT NULL AUTO_INCREMENT,
  `beschreibung` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 10 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `rolle`
--
TRUNCATE TABLE `rolle`;
--
-- Dumping data for table `rolle`
--
INSERT INTO `rolle` (`id`, `beschreibung`)
VALUES (3, 'Leitung'),
  (4, 'Mitarbeiter'),
  (7, 'Student'),
  (8, 'Auszubildender'),
  (9, 'Schüler');
-- --------------------------------------------------------
--
-- Table structure for table `sitzt_am`
--
DROP TABLE IF EXISTS `sitzt_am`;
CREATE TABLE IF NOT EXISTS `sitzt_am` (
  `id` int NOT NULL AUTO_INCREMENT,
  `abteilung_id` int NOT NULL,
  `standort_id` int NOT NULL,
  `ist_hauptsitz` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_sitzt_am_standort_idx` (`standort_id`),
  KEY `fk_sitzt_am_abteilung_idx` (`abteilung_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 11 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `sitzt_am`
--
TRUNCATE TABLE `sitzt_am`;
--
-- Dumping data for table `sitzt_am`
--
INSERT INTO `sitzt_am` (
    `id`,
    `abteilung_id`,
    `standort_id`,
    `ist_hauptsitz`
  )
VALUES (1, 1, 1, 1),
  (2, 2, 1, 1),
  (3, 3, 2, 1),
  (4, 3, 1, 0),
  (5, 3, 3, 0),
  (6, 3, 4, 0),
  (7, 5, 3, 1),
  (8, 4, 3, 1),
  (9, 6, 1, 1),
  (10, 6, 2, 0);
-- --------------------------------------------------------
--
-- Table structure for table `standort`
--
DROP TABLE IF EXISTS `standort`;
CREATE TABLE IF NOT EXISTS `standort` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ort` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `standort`
--
TRUNCATE TABLE `standort`;
--
-- Dumping data for table `standort`
--
INSERT INTO `standort` (`id`, `ort`)
VALUES (1, 'Aachen'),
  (2, 'Jülich'),
  (3, 'Köln'),
  (4, 'Berlin');
-- --------------------------------------------------------
--
-- Table structure for table `tier`
--
DROP TABLE IF EXISTS `tier`;
CREATE TABLE IF NOT EXISTS `tier` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `mitarbeiter_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `tier_mitarbeiter_id_fk` (`mitarbeiter_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 4 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Truncate table before insert `tier`
--
TRUNCATE TABLE `tier`;
--
-- Dumping data for table `tier`
--
INSERT INTO `tier` (`id`, `name`, `mitarbeiter_id`)
VALUES (1, 'Petra', 4),
  (2, 'Mini', 18),
  (3, 'Rosa', NULL);
-- --------------------------------------------------------
--
-- Table structure for table `verantwortlich_fuer`
--
DROP TABLE IF EXISTS `verantwortlich_fuer`;
CREATE TABLE IF NOT EXISTS `verantwortlich_fuer` (
  `id` int NOT NULL AUTO_INCREMENT,
  `mitarbeiter_id` int NOT NULL,
  `ressource_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_verantwortlich_fuer_mitarbeiter_idx` (`mitarbeiter_id`),
  KEY `fk_verantwortlich_fuer_ressource_idx` (`ressource_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 9 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `verantwortlich_fuer`
--
TRUNCATE TABLE `verantwortlich_fuer`;
--
-- Dumping data for table `verantwortlich_fuer`
--
INSERT INTO `verantwortlich_fuer` (`id`, `mitarbeiter_id`, `ressource_id`)
VALUES (1, 1, 1),
  (2, 1, 3),
  (3, 1, 5),
  (4, 1, 7),
  (5, 2, 2),
  (6, 2, 4),
  (7, 2, 6),
  (8, 2, 7);
-- --------------------------------------------------------
--
-- Table structure for table `warengruppe`
--
DROP TABLE IF EXISTS `warengruppe`;
CREATE TABLE IF NOT EXISTS `warengruppe` (
  `id` int NOT NULL AUTO_INCREMENT,
  `bezeichnung` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE = InnoDB AUTO_INCREMENT = 13 DEFAULT CHARSET = utf8mb3;
--
-- Truncate table before insert `warengruppe`
--
TRUNCATE TABLE `warengruppe`;
--
-- Dumping data for table `warengruppe`
--
INSERT INTO `warengruppe` (`id`, `bezeichnung`)
VALUES (1, 'TK'),
  (2, 'Obst, Gemüse'),
  (3, 'Wurst, Aufschnitt'),
  (4, 'Milchprodukte'),
  (5, 'Kaltgetränke'),
  (6, 'Grillgut'),
  (7, 'Snacks, Süsswaren'),
  (8, 'Heissgetränke'),
  (9, 'Fertiggerichte'),
  (10, 'Brot, Backwaren'),
  (11, 'Zeitschriften'),
  (12, 'Dienstleistung');
--
-- Constraints for dumped tables
--
--
-- Constraints for table `arbeitet_in_als`
--
ALTER TABLE `arbeitet_in_als`
ADD CONSTRAINT `fk_arbeitet_in_als_abteilung` FOREIGN KEY (`abteilung_id`) REFERENCES `abteilung` (`id`),
  ADD CONSTRAINT `fk_arbeitet_in_als_mitarbeiter` FOREIGN KEY (`mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`),
  ADD CONSTRAINT `fk_arbeitet_in_als_rolle` FOREIGN KEY (`rolle_id`) REFERENCES `rolle` (`id`);
--
-- Constraints for table `besteht_aus`
--
ALTER TABLE `besteht_aus`
ADD CONSTRAINT `fk_besteht_aus_bestellung` FOREIGN KEY (`bestellung_id`) REFERENCES `bestellung` (`id`),
  ADD CONSTRAINT `fk_besteht_aus_produkt` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`);
--
-- Constraints for table `bestellung`
--
ALTER TABLE `bestellung`
ADD CONSTRAINT `fk_bestellung_kunde` FOREIGN KEY (`kunde_id`) REFERENCES `kunde` (`id`),
  ADD CONSTRAINT `fk_bestellung_mitarbeiter` FOREIGN KEY (`vermittler_mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`);
--
-- Constraints for table `kennt`
--
ALTER TABLE `kennt`
ADD CONSTRAINT `fk_kennt_kunde_a` FOREIGN KEY (`kunde_a_id`) REFERENCES `kunde` (`id`),
  ADD CONSTRAINT `fk_kennt_kunde_b` FOREIGN KEY (`kunde_b_id`) REFERENCES `kunde` (`id`);
--
-- Constraints for table `mitarbeiter`
--
ALTER TABLE `mitarbeiter`
ADD CONSTRAINT `fk_mitarbeiter_mitarbeiter` FOREIGN KEY (`vorgesetzter_mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`);
--
-- Constraints for table `produkt`
--
ALTER TABLE `produkt`
ADD CONSTRAINT `fk_produkt_warengruppe` FOREIGN KEY (`warengruppe_id`) REFERENCES `warengruppe` (`id`);
--
-- Constraints for table `ressource`
--
ALTER TABLE `ressource`
ADD CONSTRAINT `ressource_ressource_katalog_id_fk` FOREIGN KEY (`katalog_id`) REFERENCES `ressource_katalog` (`id`);
--
-- Constraints for table `ressource_mobile`
--
ALTER TABLE `ressource_mobile`
ADD CONSTRAINT `ressource_mobile_ressource_id_fk` FOREIGN KEY (`id`) REFERENCES `ressource` (`id`);
--
-- Constraints for table `ressource_moebel`
--
ALTER TABLE `ressource_moebel`
ADD CONSTRAINT `ressource_moebel_ressource_id_fk` FOREIGN KEY (`id`) REFERENCES `ressource` (`id`);
--
-- Constraints for table `sitzt_am`
--
ALTER TABLE `sitzt_am`
ADD CONSTRAINT `fk_sitzt_am_abteilung` FOREIGN KEY (`abteilung_id`) REFERENCES `abteilung` (`id`),
  ADD CONSTRAINT `fk_sitzt_am_standort` FOREIGN KEY (`standort_id`) REFERENCES `standort` (`id`);
--
-- Constraints for table `tier`
--
ALTER TABLE `tier`
ADD CONSTRAINT `tier_mitarbeiter_id_fk` FOREIGN KEY (`mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`);
--
-- Constraints for table `verantwortlich_fuer`
--
ALTER TABLE `verantwortlich_fuer`
ADD CONSTRAINT `fk_verantwortlich_fuer_mitarbeiter` FOREIGN KEY (`mitarbeiter_id`) REFERENCES `mitarbeiter` (`id`),
  ADD CONSTRAINT `verantwortlich_fuer_ressource_id_fk` FOREIGN KEY (`ressource_id`) REFERENCES `ressource` (`id`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;