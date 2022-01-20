-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: db
-- Generation Time: Jan 20, 2022 at 03:02 PM
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
-- Database: `db_oracle_hr`
--
CREATE DATABASE IF NOT EXISTS `db_oracle_hr` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `db_oracle_hr`;
-- --------------------------------------------------------
--
-- Table structure for table `departments`
--
DROP TABLE IF EXISTS `departments`;
CREATE TABLE IF NOT EXISTS `departments` (
  `department_id` int NOT NULL,
  `department_name` varchar(30) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  PRIMARY KEY (`department_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `departments`
--
TRUNCATE TABLE `departments`;
--
-- Dumping data for table `departments`
--
INSERT INTO `departments` (
    `department_id`,
    `department_name`,
    `manager_id`,
    `location_id`
  )
VALUES (10, 'Administration', 200, 1700),
  (20, 'Marketing', 201, 1800),
  (50, 'Shipping', 124, 1500),
  (60, 'IT', 103, 1400),
  (80, 'Sales', 149, 2500),
  (90, 'Executive', 100, 1700),
  (110, 'Accounting', 205, 1700),
  (190, 'Contracting', NULL, 1700);
-- --------------------------------------------------------
--
-- Table structure for table `employees`
--
DROP TABLE IF EXISTS `employees`;
CREATE TABLE IF NOT EXISTS `employees` (
  `employee_id` int NOT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `last_name` varchar(25) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `job_id` varchar(10) DEFAULT NULL,
  `salary` decimal(8, 2) DEFAULT NULL,
  `commission_pct` decimal(2, 2) DEFAULT NULL,
  `manager_id` int DEFAULT NULL,
  `department_id` int DEFAULT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `fk_employees_departments_idx` (`department_id`),
  KEY `fk_employees_employees_idx` (`manager_id`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `employees`
--
TRUNCATE TABLE `employees`;
--
-- Dumping data for table `employees`
--
INSERT INTO `employees` (
    `employee_id`,
    `first_name`,
    `last_name`,
    `email`,
    `phone_number`,
    `hire_date`,
    `job_id`,
    `salary`,
    `commission_pct`,
    `manager_id`,
    `department_id`
  )
VALUES (
    100,
    'Steven',
    'King',
    'SKING',
    '515.123.4567',
    '1987-06-17',
    'AD_PRES',
    '24000.00',
    NULL,
    NULL,
    90
  ),
  (
    101,
    'Neena',
    'Kochhar',
    'NKOCHHAR',
    '515.123.4568',
    '1989-09-21',
    'AD_VP',
    '17000.00',
    NULL,
    100,
    90
  ),
  (
    102,
    'Lex',
    'De Haan',
    'LDEHAAN',
    '515.123.4569',
    '1993-01-13',
    'AD_VP',
    '17000.00',
    NULL,
    100,
    90
  ),
  (
    103,
    'Alexander',
    'Hunold',
    'AHUNOLD',
    '590.423.4567',
    '1990-01-03',
    'IT_PROG',
    '9000.00',
    NULL,
    102,
    60
  ),
  (
    104,
    'Bruce',
    'Ernst',
    'BERNST',
    '590.423.4568',
    '1991-05-21',
    'IT_PROG',
    '6000.00',
    NULL,
    103,
    60
  ),
  (
    107,
    'Diana',
    'Lorentz',
    'DLORENTZ',
    '590.423.5567',
    '1999-02-07',
    'IT_PROG',
    '4200.00',
    NULL,
    103,
    60
  ),
  (
    124,
    'Kevin',
    'Mourgos',
    'KMOURGOS',
    '650.123.5234',
    '1999-11-16',
    'ST_MAN',
    '5800.00',
    NULL,
    100,
    50
  ),
  (
    141,
    'Trenna',
    'Rajs',
    'TRAJS',
    '650.121.8009',
    '1995-10-17',
    'ST_CLERK',
    '3500.00',
    NULL,
    124,
    50
  ),
  (
    142,
    'Curtis',
    'Davies',
    'CDAVIES',
    '650.121.2994',
    '1997-01-29',
    'ST_CLERK',
    '3100.00',
    NULL,
    124,
    50
  ),
  (
    143,
    'Randall',
    'Matos',
    'RMATOS',
    '650.121.2874',
    '1998-03-15',
    'ST_CLERK',
    '2600.00',
    NULL,
    124,
    50
  ),
  (
    144,
    'Peter',
    'Vargas',
    'PVARGAS',
    '650.121.2004',
    '1998-07-09',
    'ST_CLERK',
    '2500.00',
    NULL,
    124,
    50
  ),
  (
    149,
    'Eleni',
    'Zlotkey',
    'EZLOTKEY',
    '011.44.1344.429018',
    '2000-01-29',
    'SA_MAN',
    '10500.00',
    '0.20',
    100,
    80
  ),
  (
    174,
    'Ellen',
    'Abel',
    'EABEL',
    '011.44.1644.429267',
    '1996-05-11',
    'SA_REP',
    '11000.00',
    '0.30',
    149,
    80
  ),
  (
    176,
    'Jonathon',
    'Taylor',
    'JTAYLOR',
    '011.44.1644.429265',
    '1998-03-24',
    'SA_REP',
    '8600.00',
    '0.20',
    149,
    80
  ),
  (
    178,
    'Kimberely',
    'Grant',
    'KGRANT',
    '011.44.1644.429263',
    '1999-05-24',
    'SA_REP',
    '7000.00',
    '0.15',
    149,
    NULL
  ),
  (
    200,
    'Jennifer',
    'Whalen',
    'JWHALEN',
    '515.123.4444',
    '1987-09-17',
    'AD_ASST',
    '4400.00',
    NULL,
    101,
    10
  ),
  (
    201,
    'Michael',
    'Hartstein',
    'MHARTSTE',
    '515.123.5555',
    '1996-02-17',
    'MK_MAN',
    '13000.00',
    NULL,
    100,
    20
  ),
  (
    202,
    'Pat',
    'Fay',
    'PFAY',
    '603.123.6666',
    '1997-08-17',
    'MK_REP',
    '6000.00',
    NULL,
    201,
    20
  ),
  (
    205,
    'Shelley',
    'Higgins',
    'SHIGGINS',
    '515.123.8080',
    '1994-06-07',
    'AC_MGR',
    '12000.00',
    NULL,
    101,
    110
  ),
  (
    206,
    'William',
    'Gietz',
    'WGIETZ',
    '515.123.8181',
    '1994-06-07',
    'AC_ACCOUNT',
    '8300.00',
    NULL,
    205,
    110
  );
-- --------------------------------------------------------
--
-- Table structure for table `job_grades`
--
DROP TABLE IF EXISTS `job_grades`;
CREATE TABLE IF NOT EXISTS `job_grades` (
  `grade_level` varchar(3) NOT NULL,
  `lowest_sal` int DEFAULT NULL,
  `highest_sal` int DEFAULT NULL,
  PRIMARY KEY (`grade_level`)
) ENGINE = InnoDB DEFAULT CHARSET = latin1;
--
-- Truncate table before insert `job_grades`
--
TRUNCATE TABLE `job_grades`;
--
-- Dumping data for table `job_grades`
--
INSERT INTO `job_grades` (`grade_level`, `lowest_sal`, `highest_sal`)
VALUES ('A', 1000, 2999),
  ('B', 3000, 5999),
  ('C', 6000, 9999),
  ('D', 10000, 14999),
  ('E', 15000, 24999),
  ('F', 25000, 40000);
--
-- Constraints for dumped tables
--
--
-- Constraints for table `employees`
--
ALTER TABLE `employees`
ADD CONSTRAINT `fk_employees_departments` FOREIGN KEY (`department_id`) REFERENCES `departments` (`department_id`),
  ADD CONSTRAINT `fk_employees_employees` FOREIGN KEY (`manager_id`) REFERENCES `employees` (`employee_id`);
COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */
;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */
;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */
;