-- phpMyAdmin SQL Dump
-- version 4.8.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 11, 2018 at 01:18 AM
-- Server version: 10.1.32-MariaDB
-- PHP Version: 7.2.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `wm2018`
--

-- --------------------------------------------------------

--
-- Table structure for table `benutzer`
--

CREATE TABLE `benutzer` (
  `benutzerid` int(11) NOT NULL,
  `benutzerName` varchar(20) DEFAULT NULL,
  `autologin` varchar(32) DEFAULT NULL,
  `IP` varchar(15) NOT NULL,
  `sessionID` varchar(32) NOT NULL,
  `nickname` varchar(30) NOT NULL,
  `passwort` varchar(32) NOT NULL,
  `gruppenname` varchar(32) DEFAULT NULL,
  `email` varchar(70) NOT NULL,
  `show_Email` bit(1) DEFAULT NULL,
  `registrierungsdatum` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `benutzer`
--

INSERT INTO `benutzer` (`benutzerid`, `benutzerName`, `autologin`, `IP`, `sessionID`, `nickname`, `passwort`, `gruppenname`, `email`, `show_Email`, `registrierungsdatum`) VALUES
(1, NULL, NULL, '192.168.178.1', '', 'KlausK', '1234', '11Freunde', 'a@a.de', b'1', NULL),
(2, NULL, NULL, '192.168.178.1', '1234', 'PeterP', '1234', 'Kicker09', 'a@b.de', b'1', NULL),
(3, NULL, NULL, '192.168.178.1', '1234', 'MariaM', '1234', 'Tipper04', 'a@c.de', b'1', NULL),
(4, NULL, NULL, '192.168.178.1', '1234', 'FritzF', '1234', 'Balla05', 'a@d.de', b'1', NULL),
(5, NULL, NULL, '192.168.178.1', '1234', 'PetraP', '1234', 'Humba11', 'a@e.de', b'1', NULL),
(6, NULL, NULL, '192.168.178.1', '1234', 'SofiaS', '1234', '11Freunde', 'a@f.de', b'1', NULL),
(7, NULL, NULL, '192.168.178.1', '1234', 'LeonieL', '1234', 'Kicker09', 'a@g.de', b'1', NULL),
(8, NULL, NULL, '192.168.178.1', '1234', 'NiklasN', '1234', 'Tipper04', 'a@h.de', b'1', NULL),
(9, NULL, NULL, '192.168.178.1', '1234', 'AndreA', '1234', 'Balla05', 'a@i.de', b'1', NULL),
(10, NULL, NULL, '192.168.178.1', '1234', 'MarieM', '1234', '11Freunde', 'a@j.de', b'1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `gruppe`
--

CREATE TABLE `gruppe` (
  `Index` char(50) NOT NULL,
  `Mitglied 1` varchar(50) DEFAULT NULL,
  `Mitglied 2` varchar(50) DEFAULT NULL,
  `Mitglied 3` varchar(50) DEFAULT NULL,
  `Mitglied 4` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `gruppe`
--

INSERT INTO `gruppe` (`Index`, `Mitglied 1`, `Mitglied 2`, `Mitglied 3`, `Mitglied 4`) VALUES
('A', 'Russland', 'Saudi-Arabien', 'Ägypten', 'Uruguay'),
('B', 'Portugal', 'Spanien', 'Marokko', 'Iran'),
('C', 'Frankreich', 'Australien', 'Peru', 'Dänemark'),
('D', 'Argentinien', 'Island', 'Kroatien', 'Nigeria'),
('E', 'Brasilien', 'Schweiz', 'Coasta Rica', 'Serbien'),
('F', 'Deutschland', 'Mexiko', 'Schweden', 'Südkorea'),
('G', 'Belgien', 'Panama', 'Tunesien', 'England'),
('H', 'Polen', 'Senegal', 'Kolumbien', 'Japan');

-- --------------------------------------------------------

--
-- Table structure for table `ranking`
--

CREATE TABLE `ranking` (
  `datum` datetime DEFAULT NULL,
  `benutzerid` int(11) DEFAULT NULL,
  `punkte` int(10) DEFAULT NULL,
  `platz` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ranking`
--

INSERT INTO `ranking` (`datum`, `benutzerid`, `punkte`, `platz`) VALUES
('2018-06-10 23:26:37', 1, 12, 0),
('2018-06-10 23:31:46', 2, 9, 0),
('2018-06-11 00:15:48', 3, 21, 0);

-- --------------------------------------------------------

--
-- Table structure for table `spiele`
--

CREATE TABLE `spiele` (
  `spieleid` int(10) NOT NULL,
  `spielbezeichnung` varchar(20) DEFAULT NULL,
  `spielort` varchar(20) DEFAULT NULL,
  `datumuhrzeit` datetime DEFAULT NULL,
  `heimmannschaft` varchar(20) DEFAULT NULL,
  `gastmannschaft` varchar(20) DEFAULT NULL,
  `heimmannschafthz` int(2) DEFAULT NULL,
  `gastmannschafthz` int(2) DEFAULT NULL,
  `heimmannschaftende` int(2) DEFAULT NULL,
  `gastmannschaftende` int(2) DEFAULT NULL,
  `verlaengerung` bit(1) DEFAULT NULL,
  `heimmannschaftverl` int(2) DEFAULT NULL,
  `gastmannschaftverl` int(2) DEFAULT NULL,
  `elfmeter` bit(1) DEFAULT NULL,
  `heimmannschaftelf` int(2) DEFAULT NULL,
  `gastmannschaftelf` int(2) DEFAULT NULL,
  `gelbekartenheim` int(2) DEFAULT NULL,
  `gelbekartengast` int(2) DEFAULT NULL,
  `rotekartenheim` int(2) DEFAULT NULL,
  `rotekartengast` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spiele`
--

INSERT INTO `spiele` (`spieleid`, `spielbezeichnung`, `spielort`, `datumuhrzeit`, `heimmannschaft`, `gastmannschaft`, `heimmannschafthz`, `gastmannschafthz`, `heimmannschaftende`, `gastmannschaftende`, `verlaengerung`, `heimmannschaftverl`, `gastmannschaftverl`, `elfmeter`, `heimmannschaftelf`, `gastmannschaftelf`, `gelbekartenheim`, `gelbekartengast`, `rotekartenheim`, `rotekartengast`) VALUES
(1, 'Gruppe A', 'Saint-Denis', '2017-04-10 21:00:00', 'Frankreich', 'Rumnien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(2, 'Gruppe A', 'Lens', '2017-04-11 15:00:00', 'Albanien', 'Schweiz', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(3, 'Gruppe A', 'Paris', '2017-11-09 11:00:00', 'Rumnien', 'Schweiz', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(4, 'Gruppe A', 'Marseille', '2018-04-15 21:00:00', 'Frankreich', 'Albanien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(5, 'Gruppe A', 'Lille', '2018-04-19 21:00:00', 'Schweiz', 'Frankreich', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(6, 'Gruppe A', 'Lyon', '2018-04-19 21:00:00', 'Rumnien', 'Albanien', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(7, 'Gruppe B', 'Bordeaux', '2018-04-11 18:00:00', 'Wales', 'Slowakei', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(8, 'Gruppe B', 'Marseille', '2018-04-11 21:00:00', 'England', 'Russland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(9, 'Gruppe B', 'Lille', '2018-04-15 15:00:00', 'Russland', 'Slowakei', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(10, 'Gruppe B', 'Lens', '2018-04-16 15:00:00', 'England', 'Wales', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(11, 'Gruppe B', 'Saint-tienne', '2018-04-20 21:00:00', 'Slowakei', 'England', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(12, 'Gruppe B', 'Toulouse', '2018-04-20 21:00:00', 'Russland', 'Wales', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(13, 'Gruppe C', 'Nizza', '2018-04-12 18:00:00', 'Polen', 'Nordirland', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(14, 'Gruppe C', 'Lille', '2018-04-12 21:00:00', 'Deutschland', 'Ukraine', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(15, 'Gruppe C', 'Lyon', '2018-04-16 18:00:00', 'Ukraine', 'Nordirland', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(16, 'Gruppe C', 'Saint-Denis', '2018-04-16 21:00:00', 'Deutschland', 'Polen', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(17, 'Gruppe C', 'Marseille', '2018-04-21 18:00:00', 'Ukraine', 'Polen', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(18, 'Gruppe C', 'Paris', '2018-04-21 18:00:00', 'Nordirland', 'Deutschland', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(19, 'Gruppe D', 'Paris', '2018-04-12 15:00:00', 'Trkei', 'Kroatien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(20, 'Gruppe D', 'Toulouse', '2018-04-13 15:00:00', 'Spanien', 'Tschechien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(21, 'Gruppe D', 'Saint-tienne', '2018-04-17 18:00:00', 'Tschechien', 'Kroatien', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(22, 'Gruppe D', 'Nizza', '2018-04-17 21:00:00', 'Spanien', 'Trkei', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(23, 'Gruppe D', 'Bordeaux', '2018-04-21 21:00:00', 'Kroatien', 'Spanien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(24, 'Gruppe D', 'Lens', '2018-04-21 21:00:00', 'Tschechien', 'Trkei', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(25, 'Gruppe E', 'Saint-Denis', '2018-04-13 18:00:00', 'Irland', 'Schweden', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(26, 'Gruppe E', 'Lyon', '2018-04-13 21:00:00', 'Belgien', 'Italien', 1, 1, 1, 2, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(27, 'Gruppe E', 'Toulouse', '2018-04-17 15:00:00', 'Italien', 'Schweden', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(28, 'Gruppe E', 'Bordeaux', '2018-04-18 15:00:00', 'Belgien', 'Irland', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(29, 'Gruppe E', 'Lille', '2018-04-22 21:00:00', 'Italien', 'Irland', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(30, 'Gruppe E', 'Nizza', '2018-04-22 21:00:00', 'Schweden', 'Belgien', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(31, 'Gruppe F', 'Bordeaux', '2018-04-14 18:00:00', 'sterreich', 'Ungarn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(32, 'Gruppe F', 'Saint-tienne', '2018-04-14 21:00:00', 'Portugal', 'Island', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(33, 'Gruppe F', 'Marseille', '2018-04-18 18:00:00', 'Island', 'Ungarn', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(34, 'Gruppe F', 'Paris', '2018-04-18 21:00:00', 'Portugal', 'sterreich', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(35, 'Gruppe F', 'Lyon', '2018-04-22 18:00:00', 'Ungarn', 'Portugal', 1, 1, 2, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, 1, 0, 0),
(36, 'Gruppe F', 'Saint-Denis', '2018-04-22 18:00:00', 'Island', 'sterreich', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(37, 'Achtelfinale', 'Saint-tienne', '2018-04-25 15:00:00', 'Zweiter Gruppe A', 'Zweiter Gruppe C', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(38, 'Achtelfinale', 'Paris', '2018-04-25 18:00:00', 'Sieger Gruppe B', 'Dritter Gruppe A/C/D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(39, 'Achtelfinale', 'Lens', '2018-04-25 21:00:00', 'Sieger Gruppe D', 'Dritter Gruppe B/E/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(40, 'Achtelfinale', 'Lyon', '2018-04-26 15:00:00', 'Sieger Gruppe A', 'Dritter Gruppe C/D/E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(41, 'Achtelfinale', 'Lille', '2018-04-26 18:00:00', 'Sieger Gruppe C', 'Dritter Gruppe A/B/F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(42, 'Achtelfinale', 'Toulouse', '2018-04-26 21:00:00', 'Sieger Gruppe F', 'Zweiter Gruppe E', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(43, 'Achtelfinale', 'Saint-Denis', '2018-04-27 18:00:00', 'Sieger Gruppe E', 'Zweiter Gruppe D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(44, 'Achtelfinale', 'Nizza', '2018-04-27 21:00:00', 'Zweiter Gruppe B', 'Zweiter Gruppe F', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(45, 'Viertelfinale', 'Marseille', '2018-04-30 21:00:00', 'Sieger AF 1', 'Sieger AF 3', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(46, 'Viertelfinale', 'Lille', '2018-05-01 21:00:00', 'Sieger AF 2', 'Sieger AF 6', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(47, 'Viertelfinale', 'Bordeaux', '2018-05-02 21:00:00', 'Sieger AF 5', 'Sieger AF 7', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(48, 'Viertelfinale', 'Saint-Denis', '2018-05-03 21:00:00', 'Sieger AF 4', 'Sieger AF 8', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(49, 'Halbfinale', 'Lyon', '2018-05-06 21:00:00', 'Sieger VF 1', 'Sieger VF 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 'Halbfinale', 'Marseille', '2018-05-07 21:00:00', 'Sieger VF 3', 'Sieger VF 4', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 'Finale   ', 'Saint-Denis', '2018-05-10 21:00:00', 'Sieger HF 1', 'Sieger HF 2', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `spielorte`
--

CREATE TABLE `spielorte` (
  `Ort` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `spielorte`
--

INSERT INTO `spielorte` (`Ort`) VALUES
('Jekaterinburg'),
('Kaliningrad'),
('Kasan'),
('Moskau'),
('Nischni Nowgorod'),
('Rostow am Dom'),
('Samara'),
('Sankt Petersburg'),
('Saransk'),
('Sotschi'),
('Wolgograd');

-- --------------------------------------------------------

--
-- Table structure for table `spielplan`
--

CREATE TABLE `spielplan` (
  `ID` int(11) NOT NULL,
  `Gruppe` char(50) DEFAULT NULL,
  `Spielort` varchar(50) DEFAULT NULL,
  `Datum` datetime DEFAULT NULL,
  `Heimmannschaft` varchar(50) DEFAULT NULL,
  `Gastmannschaft` varchar(50) DEFAULT NULL,
  `Tore 1` int(11) DEFAULT NULL,
  `Tore 2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `spielplan`
--

INSERT INTO `spielplan` (`ID`, `Gruppe`, `Spielort`, `Datum`, `Heimmannschaft`, `Gastmannschaft`, `Tore 1`, `Tore 2`) VALUES
(1, 'A', 'Moskau', '2018-06-14 17:00:00', 'Russland', 'Saudi-Arabien', 2, 0),
(2, 'A', 'Jekaterinburg', '2018-06-15 14:00:00', 'Ägypten', 'Uruguay', 3, 0),
(3, 'A', 'Sankt Petersburg', '2018-06-19 20:00:00', 'Russland', 'Ägypten', 1, 1),
(4, 'A', 'Rostow am Dom', '2018-06-20 17:00:00', 'Uruguay', 'Saudi-Arabien', 6, 3),
(5, 'A', 'Samara', '2018-06-25 16:00:00', 'Uruguay', 'Russland', 0, 1),
(6, 'A', 'Wolgograd', '2018-06-25 16:00:00', 'Saudi-Arabien', 'Ägypten', 0, 0),
(7, 'B', 'Sotschi', '2018-06-15 17:00:00', 'Marokko', 'Iran', 1, 1),
(8, 'B', 'Sankt Petersrburg', '2018-06-15 20:00:00', 'Portugal', 'Spanien', NULL, NULL),
(9, 'B', 'Moskau', '2018-06-20 14:00:00', 'Portugal', 'Marokko', NULL, NULL),
(10, 'B', 'Kasan', '2018-06-20 20:00:00', 'Iran', 'Spanien', NULL, NULL),
(11, 'B', 'Saransk', '2018-06-25 20:00:00', 'Spanien', 'Marokko', NULL, NULL),
(12, 'B', 'Kaliningrad', '2018-06-25 20:00:00', 'Iran', 'Portugal', NULL, NULL),
(13, 'C', 'Kasan', '2018-06-16 12:00:00', 'Frankreich', 'Australien', NULL, NULL),
(14, 'C', 'Saransk', '2018-06-16 18:00:00', 'Peru', 'Dänemark', NULL, NULL),
(15, 'C', 'Jekaterinburg', '2018-06-21 14:00:00', 'Frankreich', 'Peru', NULL, NULL),
(16, 'C', 'Samara', '2018-06-21 17:00:00', 'Dänemark', 'Australien', NULL, NULL),
(17, 'C', 'Moskau', '2018-06-26 16:00:00', 'Dänemark', 'Frankreich', NULL, NULL),
(18, 'C', 'Sotschi', '2018-06-26 16:00:00', 'Australien', 'Peru', NULL, NULL),
(19, 'D', 'Moskau', '2018-06-16 15:00:00', 'Argentinien', 'Island', NULL, NULL),
(20, 'D', 'Kaliningrad', '2018-06-16 21:00:00', 'Kroatien', 'Nigeria', NULL, NULL),
(21, 'D', 'Nischni Nowgorod', '2018-06-21 20:00:00', 'Argentinien', 'Kroatien', NULL, NULL),
(22, 'D', 'Wolgograd', '2018-06-22 17:00:00', 'Nigeria', 'Island', NULL, NULL),
(23, 'D', 'Rostow am Dom', '2018-06-26 20:00:00', 'Island', 'Kroatien', NULL, NULL),
(24, 'D', 'Sankt Petersburg', '2018-06-26 20:00:00', 'Nigeria', 'Argentinien', NULL, NULL),
(25, 'E', 'Samara', '2018-06-17 14:00:00', 'Costa Rica', 'Serbien', NULL, NULL),
(26, 'E', 'Rostow am Dom', '2018-06-17 20:00:00', 'Brasilien', 'Schweiz', NULL, NULL),
(27, 'E', 'Sankt Petersburg', '2018-06-22 14:00:00', 'Brasilien', 'Costa Rica', NULL, NULL),
(28, 'E', 'Kaliningrad', '2018-06-22 20:00:00', 'Serbien', 'Schweiz', NULL, NULL),
(29, 'E', 'Moskau', '2018-06-27 20:00:00', 'Serbien', 'Brasilien', NULL, NULL),
(30, 'E', 'Nischni Nowgorod', '2018-06-27 20:00:00', 'Schweiz', 'Costa Rica', NULL, NULL),
(31, 'F', 'Moskau', '2018-06-17 17:00:00', 'Deutschland', 'Mexiko', NULL, NULL),
(32, 'F', 'Nischni Nowgorod', '2018-06-18 14:00:00', 'Schweden', 'Südkorea', NULL, NULL),
(33, 'F', 'Rostow am Dom', '2018-06-23 17:00:00', 'Südkorea', 'Mexiko', NULL, NULL),
(34, 'F', 'Sotschi', '2018-06-23 20:00:00', 'Deutschland', 'Schweden', NULL, NULL),
(35, 'F', 'Jekaterinburg', '2018-06-27 16:00:00', 'Mexiko', 'Schweden', NULL, NULL),
(36, 'F', 'Kaliningrad', '2018-06-27 16:00:00', 'Südkorea', 'Deutschland', NULL, NULL),
(37, 'G', 'Sotschi', '2018-06-18 17:00:00', 'Belgien', 'Panama', NULL, NULL),
(38, 'G', 'Wolgograd', '2018-06-18 20:00:00', 'Tunesien', 'England', NULL, NULL),
(39, 'G', 'Moskau', '2018-06-23 14:00:00', 'Belgien', 'Tunesien', NULL, NULL),
(40, 'G', 'Nischni Nowgorod', '2018-06-24 14:00:00', 'England', 'Panama', NULL, NULL),
(41, 'G', 'Kaliningrad', '2018-06-28 20:00:00', 'England', 'Belgien', NULL, NULL),
(42, 'G', 'Samara', '2018-06-28 20:00:00', 'Panama', 'Tunesien', NULL, NULL),
(43, 'H', 'Moskau', '2018-06-19 14:00:00', 'Polen', 'Senegal', NULL, NULL),
(44, 'H', 'Saransk', '2018-06-19 17:00:00', 'Kolumbien', 'Japan', NULL, NULL),
(45, 'H', 'Jekaterinburg', '2018-06-24 17:00:00', 'Japan', 'Senegal', NULL, NULL),
(46, 'H', 'Kasan', '2018-06-24 20:00:00', 'Polen', 'Kolumbien', NULL, NULL),
(47, 'H', 'Samara', '2018-06-28 16:00:00', 'Senegal', 'Kolumbien', NULL, NULL),
(48, 'H', 'Wolgograd', '2018-06-28 16:00:00', 'Japan', 'Polen', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `teams`
--

CREATE TABLE `teams` (
  `ID` int(11) NOT NULL,
  `Name` varchar(50) DEFAULT NULL,
  `Gruppe` char(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `teams`
--

INSERT INTO `teams` (`ID`, `Name`, `Gruppe`) VALUES
(1, 'Russland', 'A'),
(2, 'Saudi-Arabien', 'A'),
(3, 'Ägypten', 'A'),
(4, 'Uruguay', 'A'),
(5, 'Portugal', 'B'),
(6, 'Spanien', 'B'),
(7, 'Marokko', 'B'),
(8, 'Iran', 'B'),
(9, 'Frankreich', 'C'),
(10, 'Australien', 'C'),
(11, 'Peru', 'C'),
(12, 'Dänemark', 'C'),
(13, 'Argentinien', 'D'),
(14, 'Island', 'D'),
(15, 'Kroatien', 'D'),
(16, 'Nigeria', 'D'),
(17, 'Brasilien', 'E'),
(18, 'Schweiz', 'E'),
(19, 'Costa Rica', 'E'),
(20, 'Serbien', 'E'),
(21, 'Deutschland', 'F'),
(22, 'Mexiko', 'F'),
(23, 'Schweden', 'F'),
(24, 'Südkorea', 'F'),
(25, 'Belgien', 'G'),
(26, 'Panama', 'G'),
(27, 'Tunesien', 'G'),
(28, 'England', 'G'),
(29, 'Polen', 'H'),
(30, 'Senegal', 'H'),
(31, 'Kolumbien', 'H'),
(32, 'Japan', 'H');

-- --------------------------------------------------------

--
-- Table structure for table `tipps`
--

CREATE TABLE `tipps` (
  `tippid` int(10) NOT NULL,
  `benutzerid` int(10) DEFAULT NULL,
  `spieleid` int(10) DEFAULT NULL,
  `tippdatum` datetime DEFAULT NULL,
  `tippheimhz` int(4) DEFAULT NULL,
  `tippgasthz` int(4) DEFAULT NULL,
  `tippheimende` int(4) DEFAULT NULL,
  `tippgastende` int(4) DEFAULT NULL,
  `tippheimverl` int(4) DEFAULT NULL,
  `tippgastverl` int(4) DEFAULT NULL,
  `tippheimelf` int(4) DEFAULT NULL,
  `tippgastelf` int(4) DEFAULT NULL,
  `tippgelbeheim` int(4) DEFAULT NULL,
  `tippgelbegast` int(4) DEFAULT NULL,
  `tipproteheim` int(4) DEFAULT NULL,
  `tipprotegast` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tipps`
--

INSERT INTO `tipps` (`tippid`, `benutzerid`, `spieleid`, `tippdatum`, `tippheimhz`, `tippgasthz`, `tippheimende`, `tippgastende`, `tippheimverl`, `tippgastverl`, `tippheimelf`, `tippgastelf`, `tippgelbeheim`, `tippgelbegast`, `tipproteheim`, `tipprotegast`) VALUES
(1, 1, 37, '2018-06-10 20:57:46', 0, 0, 1, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(2, 1, 1, '2018-06-10 23:31:46', 0, 0, 2, 2, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(3, 1, 2, '2018-06-10 23:31:46', 0, 0, 3, 3, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(4, 1, 7, '2018-06-10 23:16:25', 0, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(5, 1, 8, '2018-06-10 23:16:25', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(6, 1, 13, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(7, 1, 19, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(8, 1, 14, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(9, 1, 20, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(10, 1, 25, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(11, 1, 31, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(12, 1, 26, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(13, 1, 32, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(14, 1, 38, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(15, 1, 43, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(16, 1, 44, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(17, 1, 3, '2018-06-10 23:31:46', 0, 0, 0, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(18, 1, 9, '2018-06-10 23:16:25', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(19, 1, 4, '2018-06-10 23:31:46', 0, 0, 6, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(20, 1, 10, '2018-06-10 23:16:25', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(21, 1, 15, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(22, 1, 16, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(23, 1, 21, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(24, 1, 27, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(25, 1, 22, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(26, 1, 28, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(27, 1, 39, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(28, 1, 33, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(29, 1, 34, '2018-06-10 20:57:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(30, 1, 40, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(31, 1, 45, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(32, 1, 46, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(33, 1, 5, '2018-06-10 23:31:46', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(34, 1, 6, '2018-06-10 23:31:46', 0, 0, 1, 1, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(35, 1, 12, '2018-06-10 23:16:25', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(36, 1, 11, '2018-06-10 23:16:25', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(37, 1, 18, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(38, 1, 17, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(39, 1, 23, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(40, 1, 24, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(41, 1, 36, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(42, 1, 35, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(43, 1, 30, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(44, 1, 29, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(45, 1, 48, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(46, 1, 47, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(47, 1, 41, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(48, 1, 42, '2018-06-10 20:57:47', 0, 0, 0, 0, NULL, NULL, NULL, NULL, 0, 0, 0, 0),
(49, 2, 1, '2018-06-10 23:28:24', NULL, NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(50, 2, 2, '2018-06-10 23:28:24', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(51, 2, 3, '2018-06-10 23:28:24', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(52, 2, 4, '2018-06-10 23:28:24', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(53, 2, 5, '2018-06-10 23:28:24', NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(54, 2, 6, '2018-06-10 23:28:24', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(55, 3, 1, '2018-06-11 00:15:48', NULL, NULL, 2, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(56, 3, 2, '2018-06-11 00:15:48', NULL, NULL, 3, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(57, 3, 3, '2018-06-11 00:15:48', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(58, 3, 4, '2018-06-11 00:15:48', NULL, NULL, 6, 3, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(59, 3, 5, '2018-06-11 00:15:48', NULL, NULL, 0, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(60, 3, 6, '2018-06-11 00:15:48', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(61, 3, 7, '2018-06-11 00:11:15', NULL, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(62, 3, 8, '2018-06-11 00:11:15', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(63, 3, 9, '2018-06-11 00:11:15', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(64, 3, 10, '2018-06-11 00:11:15', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(65, 3, 11, '2018-06-11 00:11:15', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
(66, 3, 12, '2018-06-11 00:11:15', NULL, NULL, 0, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `anmeldename` varchar(50) DEFAULT NULL,
  `vorname` varchar(50) DEFAULT NULL,
  `nachname` varchar(50) DEFAULT NULL,
  `passwort` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `anmeldename`, `vorname`, `nachname`, `passwort`) VALUES
(1, 'kazi.riaz.ullah', 'kazi riaz', 'ullah', '827ccb0eea8a706c4c34a16891f84e7b'),
(2, 'thofa.tazkia', 'thofa', 'tazkia', '827ccb0eea8a706c4c34a16891f84e7b'),
(3, 'raz11218@yahoo.com', 'riaz', 'ullah', '827ccb0eea8a706c4c34a16891f84e7b');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `benutzer`
--
ALTER TABLE `benutzer`
  ADD PRIMARY KEY (`benutzerid`);

--
-- Indexes for table `gruppe`
--
ALTER TABLE `gruppe`
  ADD PRIMARY KEY (`Index`);

--
-- Indexes for table `spiele`
--
ALTER TABLE `spiele`
  ADD PRIMARY KEY (`spieleid`);

--
-- Indexes for table `spielorte`
--
ALTER TABLE `spielorte`
  ADD PRIMARY KEY (`Ort`);

--
-- Indexes for table `spielplan`
--
ALTER TABLE `spielplan`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `Gruppe` (`Gruppe`),
  ADD KEY `Heimmannschaft` (`Heimmannschaft`),
  ADD KEY `Gastmannschaft` (`Gastmannschaft`),
  ADD KEY `Spielort` (`Spielort`);

--
-- Indexes for table `teams`
--
ALTER TABLE `teams`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_teams_gruppe` (`Gruppe`),
  ADD KEY `Name` (`Name`);

--
-- Indexes for table `tipps`
--
ALTER TABLE `tipps`
  ADD PRIMARY KEY (`tippid`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `benutzer`
--
ALTER TABLE `benutzer`
  MODIFY `benutzerid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `spiele`
--
ALTER TABLE `spiele`
  MODIFY `spieleid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;

--
-- AUTO_INCREMENT for table `spielplan`
--
ALTER TABLE `spielplan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `teams`
--
ALTER TABLE `teams`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- AUTO_INCREMENT for table `tipps`
--
ALTER TABLE `tipps`
  MODIFY `tippid` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `spielplan`
--
ALTER TABLE `spielplan`
  ADD CONSTRAINT `FK_spielplan_gruppe` FOREIGN KEY (`Gruppe`) REFERENCES `gruppe` (`Index`),
  ADD CONSTRAINT `FK_spielplan_spielorte` FOREIGN KEY (`Spielort`) REFERENCES `spielorte` (`Ort`),
  ADD CONSTRAINT `FK_spielplan_teams` FOREIGN KEY (`Heimmannschaft`) REFERENCES `teams` (`Name`),
  ADD CONSTRAINT `FK_spielplan_teams_2` FOREIGN KEY (`Gastmannschaft`) REFERENCES `teams` (`Name`);

--
-- Constraints for table `teams`
--
ALTER TABLE `teams`
  ADD CONSTRAINT `FK_teams_gruppe` FOREIGN KEY (`Gruppe`) REFERENCES `gruppe` (`Index`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
