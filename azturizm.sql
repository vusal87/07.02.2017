-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 08, 2017 at 06:05 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `azturizm`
--

-- --------------------------------------------------------

--
-- Table structure for table `connection`
--

CREATE TABLE `connection` (
  `id` int(50) NOT NULL,
  `ishci_adi` varchar(100) NOT NULL,
  `mush.xid.ed.ish` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ishciler`
--

CREATE TABLE `ishciler` (
  `id` int(25) NOT NULL,
  `ishci_adi` varchar(50) DEFAULT NULL,
  `ishci_soyad` varchar(50) DEFAULT NULL,
  `ishci_vezifesi` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ishciler`
--

INSERT INTO `ishciler` (`id`, `ishci_adi`, `ishci_soyad`, `ishci_vezifesi`) VALUES
(1, 'samir', 'binnetov', 'menecer'),
(2, 'fariz', 'ehmedov', 'satish temsilcisi'),
(3, 'samire', 'xasiyeva', 'marketolog');

-- --------------------------------------------------------

--
-- Table structure for table `mushteriler`
--

CREATE TABLE `mushteriler` (
  `id` int(25) NOT NULL COMMENT '1',
  `mushteriye_xidmet_eden_ishci` varchar(50) DEFAULT NULL,
  `mushterinin_aldigi_turpaket` varchar(50) DEFAULT NULL,
  `mushterinin_odediyi_pul` varchar(50) DEFAULT NULL,
  `mushterinin_melumatlari` varchar(150) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mushteriler`
--

INSERT INTO `mushteriler` (`id`, `mushteriye_xidmet_eden_ishci`, `mushterinin_aldigi_turpaket`, `mushterinin_odediyi_pul`, `mushterinin_melumatlari`) VALUES
(1, 'fariz', 'turkiye', '500', 'seyid ehmedov mob:0503333333');

-- --------------------------------------------------------

--
-- Table structure for table `turlar`
--

CREATE TABLE `turlar` (
  `id` int(25) NOT NULL,
  `tur_haqqinda_melumat` varchar(150) DEFAULT NULL,
  `turu_sifariw_edenlerin_sayi` int(25) DEFAULT NULL,
  `turu_sifariw_eden_mushteriler` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `connection`
--
ALTER TABLE `connection`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `ishci_adi` (`ishci_adi`),
  ADD UNIQUE KEY `mush.xid.ed.ish` (`mush.xid.ed.ish`);

--
-- Indexes for table `ishciler`
--
ALTER TABLE `ishciler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `ishci_adi` (`ishci_adi`),
  ADD KEY `id_2` (`id`),
  ADD KEY `ishci_adi_2` (`ishci_adi`);

--
-- Indexes for table `mushteriler`
--
ALTER TABLE `mushteriler`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `mushteriye_xidmet_eden_ishci` (`mushteriye_xidmet_eden_ishci`),
  ADD KEY `mushterinin_aldigi_turpaket` (`mushterinin_aldigi_turpaket`);

--
-- Indexes for table `turlar`
--
ALTER TABLE `turlar`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `tur_haqqinda_melumat` (`tur_haqqinda_melumat`),
  ADD KEY `turu_sifariw_eden_mushteriler` (`turu_sifariw_eden_mushteriler`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `connection`
--
ALTER TABLE `connection`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `ishciler`
--
ALTER TABLE `ishciler`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `mushteriler`
--
ALTER TABLE `mushteriler`
  MODIFY `id` int(25) NOT NULL AUTO_INCREMENT COMMENT '1', AUTO_INCREMENT=2;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `connection`
--
ALTER TABLE `connection`
  ADD CONSTRAINT `connection_ibfk_1` FOREIGN KEY (`mush.xid.ed.ish`) REFERENCES `mushteriler` (`mushteriye_xidmet_eden_ishci`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `connection_ibfk_2` FOREIGN KEY (`ishci_adi`) REFERENCES `ishciler` (`ishci_adi`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `turlar`
--
ALTER TABLE `turlar`
  ADD CONSTRAINT `turlar_ibfk_1` FOREIGN KEY (`tur_haqqinda_melumat`) REFERENCES `mushteriler` (`mushterinin_aldigi_turpaket`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
