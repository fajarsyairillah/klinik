-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 28, 2019 at 01:13 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rumahsakit`
--

-- --------------------------------------------------------

--
-- Table structure for table `apoteker`
--

CREATE TABLE `apoteker` (
  `kd_transaksi` varchar(5) NOT NULL,
  `kd_obat` varchar(20) NOT NULL,
  `nama_obat` varchar(50) NOT NULL,
  `harga_obat` varchar(10) NOT NULL,
  `jumlah_obat` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Triggers `apoteker`
--
DELIMITER $$
CREATE TRIGGER `jual_obat` AFTER INSERT ON `apoteker` FOR EACH ROW BEGIN
update resep set jumlah_obat=jumlah_obat - NEW.jumlah_obat where resep_obat=NEW.nama_obat;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `bagian` varchar(20) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL,
  `kota` varchar(20) NOT NULL,
  `telepon` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`kd_dokter`, `nama_dokter`, `bagian`, `jenis_kelamin`, `alamat`, `kota`, `telepon`) VALUES
('D001', 'Bambang', 'UMUM', 'LAKI-LAKI', 'Lenteng Agung', 'Depok', '021');

-- --------------------------------------------------------

--
-- Table structure for table `pasien`
--

CREATE TABLE `pasien` (
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `umur` varchar(10) NOT NULL,
  `jenis_kelamin` varchar(10) NOT NULL,
  `alamat` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pasien`
--

INSERT INTO `pasien` (`kd_pasien`, `nama_pasien`, `umur`, `jenis_kelamin`, `alamat`) VALUES
('P001', 'Fajar Syairillah', '22', 'Laki-Laki', 'Depok');

-- --------------------------------------------------------

--
-- Table structure for table `pemeriksaan`
--

CREATE TABLE `pemeriksaan` (
  `kd_pemeriksaan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `diagnosa` varchar(100) NOT NULL,
  `tgl_pemeriksaan` text NOT NULL,
  `hasil` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rawat_jalan`
--

CREATE TABLE `rawat_jalan` (
  `kd_jalan` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `tgl_periksa` text NOT NULL,
  `biaya` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `resep`
--

CREATE TABLE `resep` (
  `kd_resep` varchar(10) NOT NULL,
  `resep_obat` varchar(50) NOT NULL,
  `harga_obat` varchar(10) NOT NULL,
  `jumlah_obat` varchar(10) NOT NULL,
  `kategori_obat` varchar(20) NOT NULL,
  `tgl_kadaluarsa` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `resep`
--

INSERT INTO `resep` (`kd_resep`, `resep_obat`, `harga_obat`, `jumlah_obat`, `kategori_obat`, `tgl_kadaluarsa`) VALUES
('OB001', 'Amoxcilin', '2000', '23', 'Tablet', '2020-10-22');

-- --------------------------------------------------------

--
-- Table structure for table `rujukan`
--

CREATE TABLE `rujukan` (
  `kd_inap` varchar(10) NOT NULL,
  `kd_dokter` varchar(10) NOT NULL,
  `nama_dokter` varchar(20) NOT NULL,
  `kd_pasien` varchar(10) NOT NULL,
  `nama_pasien` varchar(20) NOT NULL,
  `umur` varchar(3) NOT NULL,
  `tgl_periksa` text NOT NULL,
  `rumah_sakit` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `no_trans` varchar(8) NOT NULL,
  `biaya_klinik` varchar(20) NOT NULL,
  `bayar_klinik` varchar(20) NOT NULL,
  `kembalian_klinik` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `user_id` varchar(10) NOT NULL,
  `nama` varchar(20) NOT NULL,
  `namauser` varchar(20) NOT NULL,
  `password` varchar(10) NOT NULL,
  `hakakses` varchar(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`user_id`, `nama`, `namauser`, `password`, `hakakses`) VALUES
('1', 'admin', 'admin', 'admin', 'admin'),
('2', 'fajar', 'fajar', 'fajar', 'user');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `apoteker`
--
ALTER TABLE `apoteker`
  ADD PRIMARY KEY (`kd_transaksi`) USING BTREE;

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`kd_dokter`);

--
-- Indexes for table `pasien`
--
ALTER TABLE `pasien`
  ADD PRIMARY KEY (`kd_pasien`);

--
-- Indexes for table `pemeriksaan`
--
ALTER TABLE `pemeriksaan`
  ADD PRIMARY KEY (`kd_pemeriksaan`);

--
-- Indexes for table `rawat_jalan`
--
ALTER TABLE `rawat_jalan`
  ADD PRIMARY KEY (`kd_jalan`);

--
-- Indexes for table `resep`
--
ALTER TABLE `resep`
  ADD PRIMARY KEY (`kd_resep`);

--
-- Indexes for table `rujukan`
--
ALTER TABLE `rujukan`
  ADD PRIMARY KEY (`kd_inap`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`no_trans`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`user_id`) USING BTREE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
