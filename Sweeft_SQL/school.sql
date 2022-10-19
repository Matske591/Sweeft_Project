-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2022 at 12:47 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `school`
--

-- --------------------------------------------------------

--
-- Stand-in structure for view `giorgi_view`
-- (See below for the actual view)
--
CREATE TABLE `giorgi_view` (
`name` varchar(250)
,`lastName` varchar(250)
);

-- --------------------------------------------------------

--
-- Table structure for table `pupil`
--

CREATE TABLE `pupil` (
  `ID` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `gender` enum('f','m','') NOT NULL,
  `grade` int(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `pupil`
--

INSERT INTO `pupil` (`ID`, `name`, `lastName`, `gender`, `grade`) VALUES
(1, 'nika', 'matskepladze', 'm', 12),
(2, 'giorgi', 'liparteliani', 'm', 6),
(3, 'tamuna', 'gurasashvili', 'f', 8),
(4, 'giorgi', 'zambakhidze', 'm', 8),
(5, 'mari', 'charkviani', 'f', 4),
(6, 'rezi', 'pataraia', 'm', 3),
(7, 'giorgi', 'saralidze', 'm', 6),
(8, 'ana', 'vashalomidze', 'f', 5),
(9, 'misho', 'kazbegi', 'm', 11),
(10, 'giorgi', 'mukhrani', 'm', 4),
(11, 'giorgi', 'bokuchava', 'm', 6),
(12, 'elene', 'ramishvili', 'f', 10),
(13, 'kaxa', 'tevdoradze', 'm', 3),
(14, 'giorgi', 'kochlamazishvili', 'm', 12),
(15, 'anastasia', 'ratiani', 'f', 11),
(16, 'natia', 'kiknadze', 'f', 10),
(17, 'temuri', 'dadiani', 'm', 10),
(18, 'giorgi', 'svanidze', 'm', 1),
(19, 'giorgi ', 'svanadze', 'm', 7),
(20, 'lika', 'mdivani', 'f', 10);

-- --------------------------------------------------------

--
-- Table structure for table `teacher`
--

CREATE TABLE `teacher` (
  `ID` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `lastName` varchar(250) NOT NULL,
  `gender` enum('f','m','') NOT NULL,
  `subject` enum('Math','English','Science','History','Geography','Physics') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher`
--

INSERT INTO `teacher` (`ID`, `name`, `lastName`, `gender`, `subject`) VALUES
(1, 'sandro', 'dadiani', 'm', 'Math'),
(2, 'mari', 'gvasalia', 'f', 'English'),
(3, 'mariam', 'tskitishvili', 'f', 'Science'),
(4, 'merab', 'javakhishvili', 'm', 'History'),
(5, 'goga', 'baratashvili', 'm', 'Geography'),
(6, 'ana', 'avaliani', 'f', 'Physics'),
(7, 'salome', 'asatiani', 'f', 'English'),
(8, 'misho', 'rokva', 'm', 'Math'),
(9, 'keti', 'tusishvili', 'f', 'English'),
(10, 'vakhtang', 'abramidze', 'm', 'Math');

-- --------------------------------------------------------

--
-- Table structure for table `teacher_pupil`
--

CREATE TABLE `teacher_pupil` (
  `teacher_id` int(11) NOT NULL,
  `pupil_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `teacher_pupil`
--

INSERT INTO `teacher_pupil` (`teacher_id`, `pupil_id`) VALUES
(3, 7),
(4, 15),
(5, 6),
(6, 7),
(8, 10),
(9, 7),
(1, 10),
(6, 18),
(3, 3),
(4, 4),
(5, 19),
(1, 14),
(5, 14),
(4, 19),
(5, 10),
(8, 6),
(7, 3),
(9, 4),
(5, 3),
(4, 8);

-- --------------------------------------------------------

--
-- Structure for view `giorgi_view`
--
DROP TABLE IF EXISTS `giorgi_view`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `giorgi_view`  AS SELECT DISTINCT `t`.`name` AS `name`, `t`.`lastName` AS `lastName` FROM ((`teacher` `t` join `teacher_pupil` `t_p` on(`t`.`ID` = `t_p`.`teacher_id`)) join `pupil` `p` on(`t_p`.`pupil_id` = `p`.`ID`)) WHERE `p`.`name` = 'giorgi' ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `pupil`
--
ALTER TABLE `pupil`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `teacher_pupil`
--
ALTER TABLE `teacher_pupil`
  ADD KEY `teacher_id` (`teacher_id`),
  ADD KEY `pupil_id` (`pupil_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `pupil`
--
ALTER TABLE `pupil`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `teacher`
--
ALTER TABLE `teacher`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `teacher_pupil`
--
ALTER TABLE `teacher_pupil`
  ADD CONSTRAINT `teacher_pupil_ibfk_1` FOREIGN KEY (`pupil_id`) REFERENCES `pupil` (`ID`),
  ADD CONSTRAINT `teacher_pupil_ibfk_2` FOREIGN KEY (`teacher_id`) REFERENCES `teacher` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
