-- phpMyAdmin SQL Dump
-- version 5.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 19, 2020 at 04:37 PM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `carlota`
--

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `nid` varchar(10) NOT NULL,
  `nama` varchar(25) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `id_spesialis` int(11) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`nid`, `nama`, `alamat`, `id_spesialis`, `foto`) VALUES
('1401180025', 'Dr. I Kadek Andre', 'Bali', 4, 'kadek.jpg'),
('1401180026', 'Dr. M Naufal Rizky', 'Pekanbaru', 2, 'kiki.png'),
('1401180027', 'Dr. Helmi R', 'Bandung', 1, 'helmi.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `reservasi`
--

CREATE TABLE `reservasi` (
  `noreservasi` int(255) NOT NULL,
  `nid` varchar(255) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `subjek` varchar(255) NOT NULL,
  `pengirim` varchar(255) NOT NULL,
  `pesan` varchar(255) NOT NULL,
  `tanggal` varchar(255) NOT NULL,
  `jam` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `reservasi`
--

INSERT INTO `reservasi` (`noreservasi`, `nid`, `nama`, `subjek`, `pengirim`, `pesan`, `tanggal`, `jam`) VALUES
(1, '1401180025', 'Dr. I Kadek Andre', 'Appointment', 'Hasbi Dawami', 'Mas ayuk main', '04/20/2020', '09.00'),
(2, '1401180025', 'Dr. I Kadek Andre', 'Reservation', 'I Kadek Andre', 'Test', '04/20/2020', '09.00');

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id_spesialis` int(11) NOT NULL,
  `nama_spesialis` varchar(25) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id_spesialis`, `nama_spesialis`) VALUES
(1, 'Dokter Gigi'),
(2, 'Dokter THT'),
(3, 'Dokter Syaraf'),
(4, 'Dokter Kelamin');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `username` varchar(20) NOT NULL,
  `password` varchar(50) NOT NULL,
  `nama` varchar(200) NOT NULL,
  `alamat` varchar(255) NOT NULL,
  `nohp` varchar(255) NOT NULL,
  `role` enum('Pelanggan','Admin','Dokter') NOT NULL,
  `nid` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `username`, `password`, `nama`, `alamat`, `nohp`, `role`, `nid`) VALUES
(1, 'hasbi', 'hasbi123', 'Hasbi Dawami', 'Bekasi', '081368597024', 'Admin', ''),
(2, 'kadek', 'kadek123', 'I Kadek Andre', 'Bali', '081368597025', 'Dokter', '1401180025'),
(3, 'aul', 'aul123', 'Aulia Rayhan', 'Bandung', '081368597026', 'Pelanggan', ''),
(6, 'kiki', 'kiki123', 'M Naufal Rizky', 'Pekanbaru', '081368597027', 'Dokter', '1401180026'),
(9, 'helmi', 'helmi123', 'Helmi R', 'Bandung', '081368597028', 'Dokter', '1401180027');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`nid`),
  ADD KEY `id_spesialis_fk` (`id_spesialis`) USING BTREE;

--
-- Indexes for table `reservasi`
--
ALTER TABLE `reservasi`
  ADD PRIMARY KEY (`noreservasi`);

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id_spesialis`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `reservasi`
--
ALTER TABLE `reservasi`
  MODIFY `noreservasi` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id_spesialis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
