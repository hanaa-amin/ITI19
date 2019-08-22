-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2019 at 10:06 AM
-- Server version: 5.7.27-0ubuntu0.19.04.1
-- PHP Version: 7.2.19-0ubuntu0.19.04.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `Company`
--

-- --------------------------------------------------------

--
-- Table structure for table `Departments`
--

CREATE TABLE `Departments` (
  `Dname` text,
  `Dnum` int(11) DEFAULT NULL,
  `MGRSSN` int(11) DEFAULT NULL,
  `MGRStart date` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Departments`
--

INSERT INTO `Departments` (`Dname`, `Dnum`, `MGRSSN`, `MGRStart date`) VALUES
('DP1', 10, 223344, '01/01/05'),
('DP2', 20, 968574, '01/03/06'),
('DP3', 30, 512463, '01/06/06'),
('DEPT IT', 100, 968574, '1-11-2006');

-- --------------------------------------------------------

--
-- Table structure for table `Dependent`
--

CREATE TABLE `Dependent` (
  `ESSN` int(11) DEFAULT NULL,
  `Dependent_name` text,
  `Sex` text,
  `Bdate` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Dependent`
--

INSERT INTO `Dependent` (`ESSN`, `Dependent_name`, `Sex`, `Bdate`) VALUES
(112233, 'Hala Saied Ali', 'F', '18/10/1970'),
(223344, 'Ahmed Kamel Shawki', 'M', '27/3/1998'),
(223344, 'Mona Adel Mohamed', 'F', '25/4/1975'),
(321654, 'Ramy Amr Omran', 'M', '26/1/1990'),
(321654, 'Omar Amr Omran', 'M', '30/3/1993'),
(321654, 'Sanaa Gawish', 'F', '16/5/1973'),
(512463, 'Sara Edward ', 'F', '15/9/2001'),
(512463, 'Nora Ghaly', 'F', '22/6/1976');

-- --------------------------------------------------------

--
-- Table structure for table `Employee`
--

CREATE TABLE `Employee` (
  `Fname` text,
  `Lname` text,
  `SSN` int(11) DEFAULT NULL,
  `BDATE` text,
  `Address` text,
  `sex` text,
  `Salary` int(11) DEFAULT NULL,
  `Superssn` text,
  `Dno` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Employee`
--

INSERT INTO `Employee` (`Fname`, `Lname`, `SSN`, `BDATE`, `Address`, `sex`, `Salary`, `Superssn`, `Dno`) VALUES
('Ahmed ', 'Ali', 112233, '01/01/65', '15 Ali fahmy St.Giza', 'M', 1300, '223344', '10'),
('Kamel ', 'Mohamed', 223344, '15/10/1970', '38 Mohy el dien abo el Ezz  St.Cairo', 'M', 1800, '321654', '10'),
('Hanaa ', 'Sobhy', 123456, '18/3/1973', '38 Abdel Khalik Tharwat St. Downtown.Cairo', 'F', 800, '223344', '10'),
('Amr ', 'Omran', 321654, '14/9/1963', '44 Hilopolis.Cairo', 'M', 2500, NULL, NULL),
('Noha ', 'Mohamed', 968574, '01/02/75', '55 Orabi St. El Mohandiseen .Cairo', 'F', 1600, '321654', '20'),
('Edward', 'Hanna', 512463, '19/8/1972', '18 Abaas El 3akaad St. Nasr City.Cairo', 'M', 1500, '321654', '30'),
('Mariam ', 'Adel', 669955, '12/06/82', '269 El-Haram st. Giza', 'F', 750, '512463', '20'),
('Maged ', 'Raoof', 521634, '06/04/80', '18 Kholosi st.Shobra.Cairo', 'M', 1000, '968574', '30'),
('Mohammed', 'Saber', 102672, '29-29-1995', 'Mansoura', 'M', 4000, '112233', '20'),
('Mohammed', 'Saber', 102672, '29-29-1995', 'Mansoura', 'M', 4000, '112233', '20'),
('Mahmoud', 'Ahmed', 102660, '10-7-1995', 'Mahala', 'M', NULL, NULL, '30');

-- --------------------------------------------------------

--
-- Table structure for table `Project`
--

CREATE TABLE `Project` (
  `Pname` text,
  `Pnumber` int(11) DEFAULT NULL,
  `Plocation` text,
  `City` text,
  `Dnum` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `Project`
--

INSERT INTO `Project` (`Pname`, `Pnumber`, `Plocation`, `City`, `Dnum`) VALUES
('AL Solimaniah', 100, 'Cairo_Alex Road', 'Alex', 10),
('Al Rabwah', 200, '6th of October City', 'Giza', 10),
('Al Rawdah', 300, 'Zaied City', 'Giza', 10),
('Al Rowad', 400, 'Cairo_Faiyom Road', 'Giza', 20),
('Al Rehab', 500, 'Nasr City', 'Cairo', 30),
('Pitcho american', 600, 'Maady', 'Cairo', 30),
('Ebad El Rahman', 700, 'Ring Road', 'Cairo', 20);

-- --------------------------------------------------------

--
-- Table structure for table `WorksFor`
--

CREATE TABLE `WorksFor` (
  `ESSN` int(11) DEFAULT NULL,
  `Pno` int(11) DEFAULT NULL,
  `Hours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `WorksFor`
--

INSERT INTO `WorksFor` (`ESSN`, `Pno`, `Hours`) VALUES
(223344, 100, 10),
(223344, 200, 10),
(223344, 300, 10),
(112233, 100, 40),
(968574, 400, 15),
(968574, 700, 15),
(968574, 300, 10),
(669955, 400, 20),
(223344, 500, 10),
(669955, 700, 7),
(669955, 300, 10),
(512463, 500, 10),
(512463, 600, 25),
(521634, 500, 10),
(521634, 600, 20),
(521634, 300, 6),
(521634, 400, 4);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
