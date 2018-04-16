-- phpMyAdmin SQL Dump
-- version 4.7.7
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 07, 2018 at 10:05 AM
-- Server version: 10.1.30-MariaDB
-- PHP Version: 7.2.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cloud_mgmt`
--

-- --------------------------------------------------------

--
-- Table structure for table `cloud_ip`
--

CREATE TABLE `cloud_ip` (
  `ip1` varchar(20) NOT NULL,
  `ip2` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `cloud_ip`
--

INSERT INTO `cloud_ip` (`ip1`, `ip2`) VALUES
('192.168.43.57', '192.168.43.94');

-- --------------------------------------------------------

--
-- Table structure for table `members`
--

CREATE TABLE `members` (
  `firstname` varchar(50) NOT NULL,
  `lastname` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `uname` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `regdate` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `members`
--

INSERT INTO `members` (`firstname`, `lastname`, `email`, `uname`, `pass`, `regdate`) VALUES
('kiran', 'wadeyar', 'vaibhav@mail.com', 'kiran', '12345', '2016-04-12'),
('bhushan', 'd', 'bhushan.dcs@gmail.com', 'bhuhan', '12345', '2016-04-12'),
('si', 'iyengatr', 'sowrab.riyengar@gmail.com', 'sg', '45678', '2018-03-13 11:59:49');

-- --------------------------------------------------------

--
-- Table structure for table `tblservices`
--

CREATE TABLE `tblservices` (
  `SID` int(11) NOT NULL,
  `CID` int(11) NOT NULL,
  `CloudIP` varchar(50) NOT NULL,
  `Application` varchar(50) NOT NULL,
  `status` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblservices`
--

INSERT INTO `tblservices` (`SID`, `CID`, `CloudIP`, `Application`, `status`) VALUES
(1, 2, '192.168.43.57', 'app1', 'Yes'),
(2, 2, '192.168.43.57', 'app2', 'Yes'),
(3, 2, '192.168.43.57', 'app3', 'Yes'),
(4, 2, '192.168.43.57', 'app4', 'Yes'),
(5, 2, '192.168.43.57', 'app5', 'Yes'),
(6, 2, '192.168.43.57', 'app6', 'Yes');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tblservices`
--
ALTER TABLE `tblservices`
  ADD PRIMARY KEY (`SID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tblservices`
--
ALTER TABLE `tblservices`
  MODIFY `SID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
