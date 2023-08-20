-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Dec 09, 2022 at 11:47 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `project`
--

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `clientID` int(11) NOT NULL,
  `name` varchar(60) COLLATE utf8_bin NOT NULL,
  `email` varchar(60) COLLATE utf8_bin NOT NULL,
  `phone` varchar(60) COLLATE utf8_bin NOT NULL,
  `address` varchar(60) COLLATE utf8_bin NOT NULL,
  `arrivals` date NOT NULL,
  `leaving` date NOT NULL,
  `teamID` int(11) NOT NULL,
  `playerID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`clientID`, `name`, `email`, `phone`, `address`, `arrivals`, `leaving`, `teamID`, `playerID`) VALUES
(1, 'Cohen Yosi', 'Cohenyosi@gmail.com', '12345678', 'Reh.Herzl,89 TA', '2022-12-08', '2022-12-24', 10, 15),
(2, 'Levi David', 'Levidavid@gmail.com', '23456789', 'Hervor, 67/5 BS', '2022-12-15', '2022-12-31', 14, 18),
(3, 'Israel Roni', 'Israelroni@gmail.com', '12347890', 'redill street 56Y Colony', '2022-12-13', '2022-12-23', 16, 8),
(4, 'John Mill', 'Johnmill@gmail.com', '34561234', '710, street N0.4', '2022-12-21', '2022-12-31', 5, 6),
(5, 'Lina Srchn', 'Linasrchn@gmail.com', '56787890', 'Terra street, Miami', '2022-12-01', '2022-12-22', 15, 2);

-- --------------------------------------------------------

--
-- Table structure for table `coach`
--

CREATE TABLE `coach` (
  `coachID` int(11) NOT NULL,
  `coachName` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `coach`
--

INSERT INTO `coach` (`coachID`, `coachName`) VALUES
(1, 'Louis van Gaal'),
(2, 'Aliou Cissé'),
(3, 'Gareth Southgate'),
(4, 'Gregg Berhalter'),
(5, 'Lionel Scaloni'),
(6, 'Czeslaw Michniewicz'),
(7, 'Didier Deschamps'),
(8, 'Graham Arnold'),
(9, 'Hajime Moriyasu'),
(10, 'Luis Enrique'),
(11, 'Walid Regragui'),
(12, 'Zlatko Dalic'),
(13, 'Tite'),
(14, 'Murat Yakin'),
(15, 'Fernando Santos'),
(16, 'Paulo Bento');

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `playerID` int(11) NOT NULL,
  `playerName` varchar(60) COLLATE utf8_bin NOT NULL,
  `teamID` int(11) NOT NULL,
  `coachID` int(11) NOT NULL,
  `positionID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`playerID`, `playerName`, `teamID`, `coachID`, `positionID`) VALUES
(1, 'Virgil van Dijk', 1, 1, 2),
(2, 'Kalidou Koulibaly', 2, 2, 2),
(3, 'Harry Kane', 3, 3, 4),
(4, 'Christian Pulisic', 4, 4, 4),
(5, 'Lionel Messi', 5, 5, 4),
(6, 'Robert Lewandowski', 6, 6, 4),
(7, 'Kylian Mbappé', 7, 7, 4),
(8, 'Hugo Lloris', 7, 7, 1),
(9, 'Ajdin Hrustic', 8, 8, 3),
(10, 'Junya Ito', 9, 9, 3),
(11, 'Pedri', 10, 10, 3),
(12, 'Unai Simón', 10, 10, 1),
(13, 'Álvaro Morata', 10, 10, 4),
(14, 'Achraf Hakimi', 11, 11, 2),
(15, 'Luka Modric', 12, 12, 3),
(16, 'Neymar', 13, 13, 4),
(17, 'Gabriel Martinelli', 13, 13, 4),
(18, 'Granit Xhaka', 14, 14, 3),
(19, 'Cristiano Ronaldo', 15, 15, 4),
(20, 'Son Heung-min', 16, 16, 4);

-- --------------------------------------------------------

--
-- Table structure for table `position`
--

CREATE TABLE `position` (
  `positionID` int(11) NOT NULL,
  `positionName` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `position`
--

INSERT INTO `position` (`positionID`, `positionName`) VALUES
(1, 'Goalkeepers'),
(2, 'Defenders'),
(3, 'Midfielders'),
(4, 'Forwards');

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `teamID` int(11) NOT NULL,
  `teamName` varchar(60) COLLATE utf8_bin NOT NULL,
  `group` varchar(10) COLLATE utf8_bin NOT NULL,
  `ranking` varchar(60) COLLATE utf8_bin NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`teamID`, `teamName`, `group`, `ranking`) VALUES
(1, 'Netherlands', 'A', 'Group Winner'),
(2, 'Senegal', 'A', 'Runner-up'),
(3, 'England', 'B', 'Group Winner'),
(4, 'USA', 'B', 'Runner-up'),
(5, 'Argentina', 'C', 'Group Winner'),
(6, 'Poland', 'C', 'Runner-up'),
(7, 'France', 'D', 'Group Winner'),
(8, 'Australia', 'D', 'Runner-up'),
(9, 'Japan', 'E', 'Group Winner'),
(10, 'Spain', 'E', 'Runner-up'),
(11, 'Morocco', 'F', 'Group Winner'),
(12, 'Croatia', 'F', 'Runner-up'),
(13, 'Brazil', 'G', 'Group Winner'),
(14, 'Switzerland', 'G', 'Runner-up'),
(15, 'Portugal', 'H', 'Group Winner'),
(16, 'South Korea', 'H', 'Runner-up');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`clientID`),
  ADD KEY `teamID` (`teamID`,`playerID`),
  ADD KEY `playerID` (`playerID`);

--
-- Indexes for table `coach`
--
ALTER TABLE `coach`
  ADD PRIMARY KEY (`coachID`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`playerID`),
  ADD KEY `teamID` (`teamID`,`coachID`),
  ADD KEY `positionID` (`positionID`),
  ADD KEY `coachID` (`coachID`);

--
-- Indexes for table `position`
--
ALTER TABLE `position`
  ADD PRIMARY KEY (`positionID`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`teamID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `clientID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `coach`
--
ALTER TABLE `coach`
  MODIFY `coachID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `player`
--
ALTER TABLE `player`
  MODIFY `playerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `position`
--
ALTER TABLE `position`
  MODIFY `positionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `client_ibfk_1` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`),
  ADD CONSTRAINT `client_ibfk_2` FOREIGN KEY (`playerID`) REFERENCES `player` (`playerID`);

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`teamID`) REFERENCES `team` (`teamID`),
  ADD CONSTRAINT `player_ibfk_2` FOREIGN KEY (`positionID`) REFERENCES `position` (`positionID`),
  ADD CONSTRAINT `player_ibfk_3` FOREIGN KEY (`coachID`) REFERENCES `coach` (`coachID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
