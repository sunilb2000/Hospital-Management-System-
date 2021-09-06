-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2021 at 09:48 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hms1`
--

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `did` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `doctorname` varchar(50) NOT NULL,
  `dept` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`did`, `email`, `doctorname`, `dept`) VALUES
(9, 'sunil@gmail.com', 'Raghav Rao', 'Gynacolgyst'),
(10, 'sunil@gmail.com', 'Jagadesh Patel', 'General'),
(11, 'sunil@gmail.com', 'Ganeapathi Kumar', 'Practitioner'),
(12, 'sunil@gmail.com', 'Karthik Ram', 'Dental'),
(13, 'sunil@gmail.com', 'Preethi Shetty', ' Endocrinologists'),
(14, 'sunil@gmail.com', 'KannaBabu', ' Anesthesiologists'),
(15, 'sunil@gmail.com', 'Akshay Kumar', 'Dermatologists'),
(16, 'sunil@gmail.com', 'Vijay Prakash', 'Pharma'),
(17, 'kushal@gmail.com', 'KHUSHAL ANAND', 'General '),
(18, 'hari@gmail.com', 'hari', 'general'),
(19, 'hari@gmail.com', 'hari', 'general'),
(21, 'John@gmail.com', 'John', 'Practitioner'),
(23, 'guru@gmail.com', 'Guru', 'Practioner'),
(24, 'Shivani@gmail.com', 'Shivani guptha', 'PRactitioner'),
(25, 'girish@gmail.com', 'Girish', 'General'),
(26, 'anil@gmail.com', 'anil', 'Practioner');

-- --------------------------------------------------------

--
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `gender` varchar(50) NOT NULL,
  `slot` varchar(50) NOT NULL,
  `disease` varchar(50) NOT NULL,
  `time` time NOT NULL,
  `date` date NOT NULL,
  `dept` varchar(50) NOT NULL,
  `number` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`pid`, `email`, `name`, `gender`, `slot`, `disease`, `time`, `date`, `dept`, `number`) VALUES
(1, 'sunil@gmail.com', 'sunil', 'Male', 'morning', 'Teeth Pain ', '10:00:00', '2020-12-01', 'Dental', '9800101011'),
(2, 'sunil@gmail.com', 'sunil', 'Male', 'night', 'Corona + Fever', '18:00:00', '2020-12-02', 'General', '9800101011'),
(18, 'babu@gmail.com', 'Babu shetty', 'Male', 'evening', 'Corona', '16:30:00', '2020-12-05', ' Anesthesiologists', '9120102102'),
(19, 'Shiva@gmail.com', 'Shivaram', 'male', 'evening', 'corona', '10:00:00', '2020-12-01', 'General', '78789900'),
(20, 'hari@gmail.com', 'Hari', 'male', 'Morning', 'corona', '10:00:00', '2020-12-01', 'general', '909090909'),
(21, 'hari@gmail.com', 'Hari', 'male', 'Morning', 'corona', '10:00:00', '2020-12-01', 'general', '909090909'),
(22, 'sunil@gmail.com', 'Anil Agarwal', 'Male', 'evening', 'Maleriya , Corona', '18:00:00', '2021-01-18', 'General', '82299219192');

--
-- Triggers `patients`
--
DELIMITER $$
CREATE TRIGGER `PatientDelete` BEFORE DELETE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,OLD.pid,OLD.email,OLD.name,'PATIENT DELETED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `PatientUpdate` AFTER UPDATE ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT UPDATED',NOW())
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `patientinsertion` AFTER INSERT ON `patients` FOR EACH ROW INSERT INTO trigr VALUES(null,NEW.pid,NEW.email,NEW.name,'PATIENT INSERTED',NOW())
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `test`
--

CREATE TABLE `test` (
  `id` int(11) NOT NULL,
  `name` varchar(20) NOT NULL,
  `email` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `test`
--

INSERT INTO `test` (`id`, `name`, `email`) VALUES
(2, 'test', 'test@gmail.com'),
(12, 'Test2', 'test2@gmail.com'),
(13, 'Babu shetty', 'babu@gmail.com'),
(14, 'Janvi', 'Janvi@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `trigr`
--

CREATE TABLE `trigr` (
  `tid` int(11) NOT NULL,
  `pid` int(11) NOT NULL,
  `email` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `action` varchar(50) NOT NULL,
  `timestamp` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `trigr`
--

INSERT INTO `trigr` (`tid`, `pid`, `email`, `name`, `action`, `timestamp`) VALUES
(1, 1, 'sunil@gmail.com', 'sunil', 'PATIENT UPDATED', '2020-12-03 10:27:20'),
(2, 2, 'sunil@gmail.com', 'sunil', 'PATIENT INSERTED', '2020-12-03 10:28:45'),
(3, 3, 'sunil@gmail.com', 'suni B', 'PATIENT INSERTED', '2020-12-03 10:30:35'),
(4, 4, 'sunil@gmail.com', 'suni B', 'PATIENT UPDATED', '2020-12-03 10:30:50'),
(5, 3, 'sunil@gmail.com', 'suni B', 'PATIENT DELETED', '2020-12-03 10:32:11'),
(25, 18, 'babu@gmail.com', 'Babu shetty', 'PATIENT INSERTED', '2020-12-25 15:09:33'),
(26, 19, 'Shiva@gmail.com', 'Shivaram', 'PATIENT INSERTED', '2020-12-25 16:10:51'),
(27, 20, 'hari@gmail.com', 'Hari', 'PATIENT INSERTED', '2020-12-25 17:14:33'),
(28, 21, 'hari@gmail.com', 'Hari', 'PATIENT INSERTED', '2020-12-25 17:14:42'),
(29, 22, 'sunil@gmail.com', 'Anil Kumar', 'PATIENT INSERTED', '2021-01-18 16:53:14'),
(30, 22, 'sunil@gmail.com', 'Anil Agarwal', 'PATIENT UPDATED', '2021-01-18 16:54:13');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `password` varchar(1000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `email`, `password`) VALUES
(12, 'Sunil', 'sunil@gmail.com', 'pbkdf2:sha256:150000$cKCRVjU8$d0440e81ad25e66e8c9254f46715244a2d6e30e186b43eabf3c6914fe18cda1b'),
(13, 'admin', 'admin@gmail.com', 'pbkdf2:sha256:150000$mf7CAaVV$6790581e6164c77ef4982cf975cfecad7599ddb6f4c84dc5c4cb023b16960927'),
(14, 'babu', 'babu@gmail.com', 'pbkdf2:sha256:150000$RDhDGZXs$67a3914599dec6fe55a2a84b5695bffac00e4dec6e06c4cf8ee35564cb50487d');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`did`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`pid`);

--
-- Indexes for table `test`
--
ALTER TABLE `test`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `trigr`
--
ALTER TABLE `trigr`
  ADD PRIMARY KEY (`tid`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `did` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `pid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `test`
--
ALTER TABLE `test`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `trigr`
--
ALTER TABLE `trigr`
  MODIFY `tid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
