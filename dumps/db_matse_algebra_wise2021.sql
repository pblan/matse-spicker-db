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
-- Database: `db_matse_algebra`
--
CREATE DATABASE IF NOT EXISTS `db_matse_algebra` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_matse_algebra`;
-- --------------------------------------------------------
--
-- Table structure for table `R`
--
DROP TABLE IF EXISTS `R`;
CREATE TABLE IF NOT EXISTS `R` (
  `Rid` int NOT NULL,
  `A` varchar(10) DEFAULT NULL,
  `B` varchar(10) DEFAULT NULL,
  `C` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Rid`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Truncate table before insert `R`
--
TRUNCATE TABLE `R`;
--
-- Dumping data for table `R`
--
INSERT INTO `R` (`Rid`, `A`, `B`, `C`)
VALUES (1, 'a1', 'b1', 'c1'),
  (2, 'a2', 'b2', 'c2'),
  (3, 'a3', 'b3', 'c3'),
  (4, 'a4', 'b4', NULL);
-- --------------------------------------------------------
--
-- Table structure for table `S`
--
DROP TABLE IF EXISTS `S`;
CREATE TABLE IF NOT EXISTS `S` (
  `Sid` int DEFAULT NULL,
  `C` varchar(10) DEFAULT NULL,
  `D` varchar(10) DEFAULT NULL,
  `E` varchar(10) DEFAULT NULL,
  `FB` varchar(10) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;
--
-- Truncate table before insert `S`
--
TRUNCATE TABLE `S`;
--
-- Dumping data for table `S`
--
INSERT INTO `S` (`Sid`, `C`, `D`, `E`, `FB`)
VALUES (11, 'c1', 'd1', 'e1', 'b1'),
  (13, 'c3', 'd3', 'e3', 'b3'),
  (14, 'c4', 'd4', 'e4', 'b4');
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;