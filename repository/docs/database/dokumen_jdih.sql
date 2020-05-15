-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 10, 2018 at 09:41 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dokumen_jdih`
--

-- --------------------------------------------------------

--
-- Table structure for table `audit_trail`
--

CREATE TABLE `audit_trail` (
  `id` int(11) NOT NULL,
  `user` varchar(50) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `method` varchar(50) DEFAULT NULL,
  `data` text,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `response` varchar(255) DEFAULT NULL,
  `activity` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bidang_hukum`
--

CREATE TABLE `bidang_hukum` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bidang_hukum`
--

INSERT INTO `bidang_hukum` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Hukum Umum', NULL, '1', '1', '2018-08-21 08:14:31', '2018-09-20 17:26:42'),
(2, 'Hukum Adat', NULL, '1', '1', '2018-09-20 17:26:52', '2018-09-20 17:26:52'),
(3, 'Hukum Administrasi Negara', NULL, '1', '1', '2018-09-20 17:27:01', '2018-09-20 17:27:01'),
(4, 'Hukum Agraria', NULL, '1', '1', '2018-09-26 08:09:28', '2018-09-26 08:09:28'),
(5, 'Hukum Dagang', NULL, '1', '1', '2018-09-26 08:09:34', '2018-09-26 08:09:34'),
(6, 'Hukum Islam', NULL, '1', '1', '2018-09-26 08:09:38', '2018-09-26 08:09:38'),
(7, 'Hukum Internasional', NULL, '1', '1', '2018-09-26 08:09:44', '2018-09-26 08:09:44'),
(8, 'Hukum Lingkungan', NULL, '1', '1', '2018-09-26 08:09:51', '2018-09-26 08:09:51'),
(9, 'Hukum Perburuhan', NULL, '1', '1', '2018-09-26 08:10:01', '2018-09-26 08:10:01'),
(10, 'Hukum Perdata', NULL, '1', '1', '2018-09-26 08:10:05', '2018-09-26 08:10:05'),
(11, 'Hukum Pidana', NULL, '1', '1', '2018-09-26 08:10:11', '2018-09-26 08:10:11'),
(12, 'Hukum Tata Negara', NULL, '1', '1', '2018-09-26 08:10:16', '2018-09-26 08:10:16'),
(13, 'Himpunan Peraturan', NULL, '1', '1', '2018-09-26 08:10:30', '2018-09-26 08:10:30'),
(14, 'Putusan Pengadilan', NULL, '1', '1', '2018-09-26 08:10:42', '2018-09-26 08:10:42'),
(15, 'Referensi', NULL, '1', '1', '2018-09-26 08:10:46', '2018-09-26 08:10:46');

-- --------------------------------------------------------

--
-- Table structure for table `circulation`
--

CREATE TABLE `circulation` (
  `id` int(11) NOT NULL,
  `member_id` int(11) NOT NULL,
  `book_id` int(11) NOT NULL,
  `tanggal_pinjam` datetime NOT NULL,
  `tanggal_kembali` varchar(255) NOT NULL,
  `status` varchar(255) NOT NULL,
  `denda` varchar(255) NOT NULL,
  `_created_by` int(11) DEFAULT NULL,
  `_updated_by` int(11) DEFAULT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `circulation`
--

INSERT INTO `circulation` (`id`, `member_id`, `book_id`, `tanggal_pinjam`, `tanggal_kembali`, `status`, `denda`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(14, 1, 1, '2018-08-10 00:00:00', '17/08/2018', 'Pinjam', '0', NULL, NULL, '2018-08-10 13:48:14', '2018-08-10 13:48:14'),
(15, 1, 1, '2018-09-07 00:00:00', '2018-09-14', '1', '0', 1, 1, '2018-09-07 16:05:41', '2018-09-07 16:05:41');

-- --------------------------------------------------------

--
-- Table structure for table `data_lampiran`
--

CREATE TABLE `data_lampiran` (
  `id` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `judul_lampiran` varchar(255) NOT NULL,
  `url_lampiran` varchar(255) NOT NULL,
  `deskripsi_lampiran` varchar(255) NOT NULL,
  `akses_lampiran` varchar(255) NOT NULL,
  `dokumen_lampiran` varchar(255) NOT NULL,
  `pembatasan_lampiran` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `data_pengarang`
--

CREATE TABLE `data_pengarang` (
  `id` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `nama_pengarang` varchar(255) NOT NULL,
  `tipe_pengarang` varchar(255) NOT NULL,
  `jenis_pengarang` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_pengarang`
--

INSERT INTO `data_pengarang` (`id`, `id_dokumen`, `nama_pengarang`, `tipe_pengarang`, `jenis_pengarang`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(2, 2, '1', '2', '1', NULL, '1', '1', '2018-10-09 14:33:01', '2018-10-09 14:33:01'),
(6, 3, '1', '2', '1', NULL, '1', '1', '2018-10-09 14:38:13', '2018-10-09 14:38:13'),
(7, 1, '1', '2', '1', NULL, '1', '1', '2018-10-09 14:49:23', '2018-10-09 14:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `data_status`
--

CREATE TABLE `data_status` (
  `id` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `status_peraturan` varchar(255) NOT NULL,
  `id_dokumen_target` varchar(255) NOT NULL,
  `catatan_status_peraturan` varchar(255) NOT NULL,
  `tanggal_perubahan` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `data_status`
--

INSERT INTO `data_status` (`id`, `id_dokumen`, `status_peraturan`, `id_dokumen_target`, `catatan_status_peraturan`, `tanggal_perubahan`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 2, 'dicabut', '1', 'Testing status', '2018-10-09 02:33:43', NULL, '1', '1', '2018-10-09 14:33:43', '2018-10-09 14:33:43'),
(5, 3, 'mengubah', '1', 'Testing status', '2018-10-09 02:38:13', NULL, '1', '1', '2018-10-09 14:38:13', '2018-10-09 14:38:13'),
(6, 1, 'mencabut', '2', 'Testing status', '2018-10-09 02:33:43', NULL, '1', '1', '2018-10-09 14:49:23', '2018-10-09 14:49:23'),
(7, 1, 'diubah', '3', 'Testing status', '2018-10-09 02:38:13', NULL, '1', '1', '2018-10-09 14:49:23', '2018-10-09 14:49:23');

-- --------------------------------------------------------

--
-- Table structure for table `data_subyek`
--

CREATE TABLE `data_subyek` (
  `id` int(11) NOT NULL,
  `id_dokumen` int(11) NOT NULL,
  `subyek` varchar(255) NOT NULL,
  `tipe_subyek` varchar(255) NOT NULL,
  `jenis_subyek` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `document`
--

CREATE TABLE `document` (
  `id` int(11) NOT NULL,
  `tipe_dokumen` text,
  `judul` varchar(255) DEFAULT NULL,
  `teu` text,
  `nomor_peraturan` varchar(255) DEFAULT NULL,
  `nomor_panggil` varchar(255) NOT NULL,
  `bentuk_peraturan` text,
  `singkatan_jenis` text,
  `cetakan` varchar(255) DEFAULT NULL,
  `tempat_terbit` text,
  `penerbit` text,
  `tanggal_penetapan` date DEFAULT NULL,
  `deskripsi_fisik` varchar(255) DEFAULT NULL,
  `sumber` text,
  `isbn` varchar(255) DEFAULT NULL,
  `bahasa` text,
  `bidang_hukum` text,
  `nomor_induk_buku` varchar(255) DEFAULT NULL,
  `jenis_peraturan` varchar(255) DEFAULT NULL,
  `singkatan_bentuk` varchar(255) DEFAULT NULL,
  `tipe_koleksi_nomor_eksemplar` varchar(255) DEFAULT NULL,
  `pola_nomor_eksemplar` varchar(255) DEFAULT NULL,
  `jumlah_eksemplar` varchar(255) DEFAULT NULL,
  `kala_terbit` varchar(255) DEFAULT NULL,
  `tahun_terbit` varchar(255) DEFAULT NULL,
  `tanggal_dibacakan` date DEFAULT NULL,
  `pernyataan_tanggung_jawab` text,
  `edisi` varchar(255) DEFAULT NULL,
  `gmd` varchar(255) DEFAULT NULL,
  `judul_seri` varchar(255) DEFAULT NULL,
  `klasifikasi` varchar(255) DEFAULT NULL,
  `info_detil_spesifik` varchar(255) DEFAULT NULL,
  `abstrak` varchar(255) DEFAULT NULL,
  `gambar_sampul` varchar(255) DEFAULT NULL,
  `label` varchar(255) DEFAULT NULL,
  `sembunyikan_di_opac` varchar(255) DEFAULT NULL,
  `promosikan_ke_beranda` varchar(255) DEFAULT NULL,
  `status_terakhir` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document`
--

INSERT INTO `document` (`id`, `tipe_dokumen`, `judul`, `teu`, `nomor_peraturan`, `nomor_panggil`, `bentuk_peraturan`, `singkatan_jenis`, `cetakan`, `tempat_terbit`, `penerbit`, `tanggal_penetapan`, `deskripsi_fisik`, `sumber`, `isbn`, `bahasa`, `bidang_hukum`, `nomor_induk_buku`, `jenis_peraturan`, `singkatan_bentuk`, `tipe_koleksi_nomor_eksemplar`, `pola_nomor_eksemplar`, `jumlah_eksemplar`, `kala_terbit`, `tahun_terbit`, `tanggal_dibacakan`, `pernyataan_tanggung_jawab`, `edisi`, `gmd`, `judul_seri`, `klasifikasi`, `info_detil_spesifik`, `abstrak`, `gambar_sampul`, `label`, `sembunyikan_di_opac`, `promosikan_ke_beranda`, `status_terakhir`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'Hukum 1', NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-10-25', '', '', '', NULL, '1', '', '1', '', NULL, NULL, '0', NULL, '', NULL, '', '', NULL, '', '', '', '', '[]', '', NULL, NULL, 'diubah', NULL, '1', '1', '2018-10-09 14:32:09', '2018-10-09 14:49:23'),
(2, '1', 'Hukum 2', NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-10-25', '', '', '', NULL, '3', '', '2', '', NULL, NULL, '0', NULL, '', NULL, '', '', NULL, '', '', '', '', '[]', '', NULL, NULL, 'dicabut', NULL, '1', '1', '2018-10-09 14:33:01', '2018-10-09 14:33:01'),
(3, '1', 'Hukum 3', NULL, '', '', NULL, NULL, NULL, NULL, NULL, '2018-10-25', '', '', '', NULL, '5', '', '3', '', NULL, NULL, '0', NULL, '', NULL, '', '', NULL, '', '', '', '', '[]', '', NULL, NULL, 'mengubah', NULL, '1', '1', '2018-10-09 14:35:19', '2018-10-09 14:38:13');

-- --------------------------------------------------------

--
-- Table structure for table `document_configuration`
--

CREATE TABLE `document_configuration` (
  `id` int(11) NOT NULL,
  `ordering` int(11) NOT NULL,
  `field_name` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `data` varchar(255) DEFAULT NULL,
  `label` varchar(255) NOT NULL,
  `is_active` varchar(10) NOT NULL,
  `is_mandatory` varchar(10) NOT NULL,
  `document_type` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_configuration`
--

INSERT INTO `document_configuration` (`id`, `ordering`, `field_name`, `type`, `data`, `label`, `is_active`, `is_mandatory`, `document_type`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 1, 'tipe_dokumen', 'dropdown', 'Tipe Dokumen', 'Tipe Dokumen', '1', '2', '[\"0\"]', '1', '1', '1', '2018-07-31 11:43:14', '2018-08-10 13:34:06'),
(2, 2, 'judul', 'string', NULL, 'Judul', '1', '2', '[\"0\"]', NULL, '1', '1', '2018-07-31 12:17:16', '2018-08-10 12:29:19'),
(3, 3, 'teu', 'dropdown', 'Teu', 'T.E.U. 0rang/Pengarang', '1', '2', '[\"0\"]', NULL, '1', '1', '2018-07-31 12:24:40', '2018-08-10 13:34:02'),
(4, 4, 'nomor_peraturan', 'string', NULL, 'Nomor Peraturan/Putusan', '1', '2', '[\"1\",\"4\"]', NULL, '1', '1', '2018-08-02 08:39:37', '2018-08-10 13:33:57'),
(5, 5, 'nomor_panggil', 'string', NULL, 'Nomor Panggil', '1', '2', '[\"2\"]', NULL, '1', '1', '2018-08-02 08:42:07', '2018-08-10 13:33:52'),
(6, 6, 'bentuk_peraturan', 'dropdown', 'Jenis', 'Jenis / Bentuk Monografi Hukum, Peraturan/Putusan', '1', '2', '[\"1\",\"2\",\"4\"]', NULL, '1', '1', '2018-08-02 08:43:29', '2018-08-10 13:33:47'),
(7, 7, 'singkatan_jenis', 'dropdown', 'Singkatan Jenis', 'Singkatan Jenis/Bentuk Peraturan/Putusan', '1', '', '[\"1\",\"4\"]', NULL, '1', '1', '2018-08-02 08:44:29', '2018-08-10 12:31:44'),
(8, 8, 'cetakan', 'string', NULL, 'Cetakan/Edisi', '1', '', '[\"2\"]', NULL, '1', '1', '2018-08-02 08:45:09', '2018-08-10 12:31:59'),
(9, 9, 'tempat_terbit', 'dropdown', 'Tempat Terbit', 'Tempat Terbit', '1', '', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:45:22', '2018-08-10 12:32:21'),
(10, 10, 'penerbit', 'dropdown', 'Penerbit', 'Penerbit', '1', '', '[\"2\",\"4\"]', NULL, '1', '1', '2018-08-02 08:45:35', '2018-08-10 12:32:37'),
(11, 10, 'tanggal_penetapan', 'date', NULL, 'Tanggal-Bulan-Tahun Penetapan/Pengundangan, Terbit, dibacakan', '1', '', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:46:37', '2018-08-10 12:34:45'),
(12, 11, 'deskripsi_fisik', 'string', NULL, 'Deskripsi Fisik', '1', '', '[\"2\"]', NULL, '1', '1', '2018-08-02 08:46:58', '2018-08-10 12:35:17'),
(13, 12, 'sumber', 'dropdown', 'Sumber', 'Sumber', '1', '', '[\"1\",\"3\",\"4\"]', NULL, '1', '1', '2018-08-02 08:47:14', '2018-08-10 12:36:19'),
(14, 13, 'subjek', 'string', NULL, 'Subjek', '1', '2', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:47:30', '2018-08-10 13:33:22'),
(15, 14, 'isbn', 'string', NULL, 'ISBN', '1', '', '[\"2\"]', NULL, '1', '1', '2018-08-02 08:47:51', '2018-08-10 12:37:46'),
(16, 15, 'status_peraturan', 'dropdown', 'Status', 'Status', '1', '', '[\"1\",\"4\"]', NULL, '1', '1', '2018-08-02 08:48:28', '2018-08-10 12:38:54'),
(17, 16, 'bahasa', 'dropdown', 'Bahasa', 'Bahasa', '1', '', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:48:39', '2018-08-10 12:39:30'),
(18, 17, 'bidang_hukum', 'dropdown', 'Bidang Hukum', 'Bidang Hukum', '1', '', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:49:13', '2018-08-10 12:39:57'),
(19, 18, 'nomor_induk_buku', 'string', NULL, 'Nomor Induk Buku', '1', '', '[\"2\"]', NULL, '1', '1', '2018-08-02 08:49:39', '2018-08-10 12:40:15'),
(20, 19, 'lampiran', 'string', NULL, 'Lampiran', '1', '', '[\"0\"]', NULL, '1', '1', '2018-08-02 08:49:58', '2018-08-10 12:40:38');

-- --------------------------------------------------------

--
-- Table structure for table `document_type`
--

CREATE TABLE `document_type` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT '1',
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `document_type`
--

INSERT INTO `document_type` (`id`, `parent_id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 0, 'Peraturan Perundang - undangan', '1', '1', '1', '2018-08-21 08:05:39', '2018-08-21 08:05:39'),
(2, 0, 'Monografi Hukum', '1', '1', '1', '2018-08-21 08:06:02', '2018-08-21 08:06:02'),
(3, 0, 'Artikel Hukum (Majalah, Koran)', '1', '1', '1', '2018-08-21 08:06:12', '2018-08-21 08:06:12'),
(4, 0, 'Putusan Pengadilan/Yurisprudensi (Pts MA, PT, PN)', '1', '1', '1', '2018-08-21 08:06:32', '2018-08-21 08:06:32'),
(5, 1, 'Undang-undang Dasar (UUD) Tahun 1945 dan Amandemen', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(6, 1, 'Peraturan Perundang-undangan Pusat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(7, 6, 'UNDANG-UNDANG', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(8, 6, 'PERATURAN PEMERINTAH PENGGANTI UNDANG-UNDANG (PERPUU)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(9, 6, 'UNDANG-UNDANG DARURAT (UUDRT)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(10, 6, 'PERATURAN PEMERINTAH (PP)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(11, 6, 'PERATURAN PRESIDEN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(12, 11, 'PERATURAN PRESIDEN (PERPRES)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(13, 11, 'PENETAPAN PRESIDEN (PENPRES)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(14, 11, 'PERATURAN PENGUASA PERANG TERTINGGI (PEPERTI)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(15, 6, 'KEPUTUSAN PRESIDEN (KEPPRES)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(16, 6, 'INSTRUKSI PRESIDEN (INPRES)', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(17, 1, 'Peraturan Perundang-undangan Kementerian / Non Kementerian', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(18, 17, 'Kementerian Hukum dan Hak Asasi Manusia', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(19, 18, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(20, 18, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(21, 18, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(22, 18, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(23, 18, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(24, 17, 'Kementerian Dalam Negeri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(25, 24, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(26, 24, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(27, 24, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(28, 24, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(29, 24, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(30, 17, 'Kementerian Ketenagakerjaan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(31, 30, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(32, 30, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(33, 30, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(34, 30, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(35, 30, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(36, 17, 'Kementerian Pendidikan dan Kebudayaan ', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(37, 36, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(38, 36, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(39, 36, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(40, 36, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(41, 36, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(42, 17, 'Kementerian Perdagangan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(43, 42, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(44, 42, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(45, 42, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(46, 42, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(47, 42, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(48, 17, 'Kementerian Pertanian', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(49, 48, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(50, 48, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(51, 48, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(52, 48, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(53, 48, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(54, 17, 'Kementerian Perhubungan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(55, 54, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(56, 54, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(57, 54, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(58, 54, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(59, 54, 'Intruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(60, 17, 'Kementerian Badan Usaha Milik Negara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(61, 60, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(62, 60, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(63, 60, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(64, 60, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(65, 60, 'Instruksi Menteri ', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(66, 17, 'Kementerian Kelautan dan Perikanan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(67, 66, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(68, 66, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(69, 66, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(70, 66, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(71, 66, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(72, 17, 'Kementerian Pekerjaan Umum dan Perumahan Rakyat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(73, 72, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(74, 72, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(75, 72, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(76, 72, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(77, 72, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(78, 17, 'Kementerian Sosial', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(79, 78, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(80, 78, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(81, 78, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(82, 78, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(83, 78, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(84, 17, 'Kementerian Perindustrian', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(85, 84, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(86, 84, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(87, 84, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(88, 84, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(89, 84, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(90, 17, 'Kementerian Agraria dan Tata Ruang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(91, 90, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(92, 90, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(93, 90, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(94, 90, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(95, 90, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(96, 17, 'Kementerian Komunikasi dan Informatika', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(97, 96, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(98, 96, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(99, 96, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(100, 96, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(101, 96, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(102, 17, 'Kementerian Kesehatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(103, 102, 'Instruksi Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(104, 102, 'Keputusan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(105, 102, 'Peraturan Menteri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(106, 102, 'Keputusan Bersama', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(107, 102, 'Surat Edaran', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(108, 1, 'Peraturan Perundang-undangan Daerah Provinsi, Kabupaten/Kota', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(109, 108, 'JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(110, 109, 'slider bener', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(111, 109, 'KABUPATEN KERINCI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(112, 111, 'PERATURAN DAERAH KABUPATEN KERINCI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(113, 111, 'PERATURAN BUPATI KABUPATEN KERINCI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(114, 109, 'KABUPATEN MERANGIN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(115, 114, 'PERATURAN DAERAH KABUPATEN MERANGIN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(116, 114, 'PERATURAN BUPATI KABUPATEN MERANGIN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(117, 109, 'KABUPATEN SAROLANGUN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(118, 117, 'PERATURAN DAERAH KABUPATEN SAROLANGUN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(119, 117, 'PERATURAN BUPATI KABUPATEN SAROLANGUN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(120, 109, 'KABUPATEN BATANGHARI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(121, 120, 'PERATURAN DAERAH KABUPATEN BATANGHARI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(122, 120, 'PERATURAN BUPATI KABUPATEN BATANGHARI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(123, 109, 'KABUPATEN MUARO JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(124, 123, 'PERATURAN DAERAH KABUPATEN MUARO JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(125, 123, 'PERATURAN BUPATI KABUPATEN MUARO JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(126, 109, 'KABUPATEN TANJUNG JABUNG BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(127, 126, 'PERATURAN DAERAH KABUPATEN TANJUNG JABUNG BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(128, 126, 'PERATURAN BUPATI KABUPATEN TANJUNG JABUNG BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(129, 109, 'KABUPATEN TANJUNG JABUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(130, 129, 'PERATURAN DAERAH KABUPATEN TANJUNG JABUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(131, 129, 'PERATURAN BUPATI KABUPATEN TANJUNG JABUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(132, 109, 'KABUPATEN BUNGO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(133, 132, 'PERATURAN DAERAH KABUPATEN BUNGO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(134, 132, 'PERATURAN BUPATI KABUPATEN BUNGO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(135, 109, 'KABUPATEN TEBO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(136, 135, 'PERATURAN DAERAH KABUPATEN TEBO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(137, 135, 'PERATURAN BUPATI KABUPATEN TEBO', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(138, 109, 'KOTA JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(139, 138, 'PERATURAN DAERAH KOTA JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(140, 138, 'PERATURAN WALIKOTA JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(141, 109, 'KOTA SUNGAI PENUH', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(142, 141, 'PERATURAN DAERAH KOTA SUNGAI PENUH', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(143, 141, 'PERATURAN WALIKOTA SUNGAI PENUH', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(144, 109, 'PROVINSI JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(145, 144, 'PERATURAN DAERAH PROVINSI JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(146, 144, 'PERATURAN GUBERNUR PROVINSI JAMBI', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(147, 108, 'KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(148, 147, 'KOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(149, 148, 'PERATURAN DAERAH KOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(150, 148, 'PERATURAN WALIKOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(151, 147, 'PROVINSI KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(152, 151, 'Peraturan Daerah Provinsi Kalimantan Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(153, 151, 'Peraturan Gubernur Kalimantan Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(154, 147, 'Perda Kabupaten Bulungan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(155, 147, 'Perda Kabupaten Nunukan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(156, 147, 'Perda Kabupaten Malinau', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(157, 147, 'Perda Kabupaten Tana Tidung', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(158, 108, 'Provinsi Papua Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(159, 158, 'Perda Kota Sorong', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(160, 158, 'Perda Pemprov Papua Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(161, 108, 'Provinsi Papua', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(162, 161, 'Perda Kota Jayapura', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(163, 161, 'Perda Pemprov Papua', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(164, 108, 'Provinsi Maluku Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(165, 164, 'Perda Kota Tidore Kepulauan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(166, 164, 'Perda Kota Ternate', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(167, 164, 'Perda Pemprov Maluku Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(168, 108, 'Provinsi Maluku', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(169, 168, 'Perda Kota Tual', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(170, 168, 'Perda Kota Ambon', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(171, 168, 'Perda Pemprov Maluku', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(172, 108, 'Provinsi Sulawesi Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(173, 172, 'Perda Pemprov Sulawesi Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(174, 108, 'Provinsi Gorontalo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(175, 174, 'Perda Kota Gorontalo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(176, 174, 'Perda Pemprov Gorontalo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(177, 174, 'Perda Kabupaten Boalemo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(178, 174, 'Perda Kabupaten Bone Bolango', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(179, 174, 'Perda Kabupaten Pohuwato', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(180, 174, 'Perda Kabupaten Gorontalo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(181, 174, 'Perda Kabupaten Gorontalo Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(182, 108, 'Provinsi Sulawesi Tenggara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(183, 182, 'Perda Kota Bau-Bau', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(184, 182, 'Perda Kota Kendari', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(185, 182, 'Perda Pemprov Sulawesi Tenggara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(186, 108, 'Provinsi Sulawesi Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(187, 186, 'Perda Kota Palopo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(188, 186, 'Perda Kota Pare Pare', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(189, 186, 'Perda Kota Makassar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(190, 186, 'Perda Pemprov Sulawesi Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(191, 108, 'Provinsi Sulawesi Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(192, 191, 'Perda Kabupaten Sigi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(193, 191, 'Perda Kabupaten Tojo Una Una', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(194, 191, 'Perda Kabupaten Parigi Moutong', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(195, 191, 'Perda Kabupaten Banggai Kepulauan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(196, 191, 'Perda Kabupaten Morowali', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(197, 191, 'Perda Kabupaten Buol', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(198, 191, 'Perda Kabupaten Toli Toli', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(199, 191, 'Perda Kabupaten Donggala', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(200, 191, 'Perda Kabupaten Poso', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(201, 191, 'Perda Kabupaten Banggai', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(202, 191, 'Perda Kota Palu', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(203, 191, 'Perda Pemprov Sulawesi Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(204, 108, 'Provinsi Sulawesi Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(205, 204, 'Perda Kota Kotamobagu', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(206, 204, 'Perda Kota Tomohon', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(207, 204, 'Perda Kota Bitung', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(208, 204, 'Perda Kota Manado', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(209, 204, 'Perda Pemprov Sulawesi Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(210, 108, 'Provinsi Kalimantan Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(211, 210, 'Perda Kota Bontang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(212, 210, 'Perda Kota Samarinda', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(213, 210, 'Perda Kota Balikpapan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(214, 210, 'Perda Pemprov Kalimantan Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(215, 210, 'Perda Kabupaten Paser', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(216, 210, 'Perda Kabupaten Kutai Kertanegara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(217, 210, 'Perda Kabupaten Berau', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(218, 210, 'Perda Kabupaten Kutai Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(219, 210, 'Perda Kabupaten Kutai Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(220, 210, 'Perda Kabupaten Penajam Paser Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(221, 108, 'Provinsi Kalimantan Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(222, 221, 'Perda Kabupaten Balangan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(223, 221, 'Perda Kabupaten Tanah Bumbu', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(224, 221, 'Perda Kabupaten Tabalong', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(225, 221, 'Perda Kabupaten Hulu Sungai Utara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(226, 221, 'Perda Kabupaten Hulu Sungai Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(227, 221, 'Perda Kabupaten Hulu Sungai Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(228, 221, 'Perda Kabupaten Tapin', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(229, 221, 'Perda Kabupaten Tanah Laut', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(230, 221, 'Perda Kabupaten Kotabaru', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(231, 221, 'Perda Kabupaten Banjar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(232, 221, 'Perda Kabupaten Barito Kuala', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(233, 221, 'Perda Kota Banjarbaru', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(234, 221, 'Perda Kota Banjarmasin', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(235, 221, 'Perda Pemprov Kalimantan Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(236, 108, 'Provinsi Kalimantan Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(237, 236, 'Perda Kota PalangkaRaya', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(238, 236, 'Perda Pemprov Kalimantan Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(239, 108, 'Provinsi Kalimantan Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(240, 239, 'Perda Kota Singkawang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(241, 239, 'Perda Kota Pontianak', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(242, 239, 'Perda Pemprov Kalimantan Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(243, 108, 'Provinsi Nusa Tenggara Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(244, 243, 'Perda Kota Kupang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(245, 243, 'Perda Pemprov Nusa Tenggara Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(246, 108, 'NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(247, 246, 'KOTA BIMA', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(248, 247, 'PERATURAN DAERAH KOTA BIMA', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(249, 247, 'PERATURAN WALIKOTA BIMA', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(250, 246, 'KOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(251, 250, 'PERATURAN DAERAH KOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(252, 250, 'PERATURAN WALIKOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(253, 246, 'PROVINSI NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(254, 253, 'PERATURAN DAERAH PROVINSI NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(255, 253, 'PERATURAN GUBERNUR NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(256, 108, 'Provinsi Bali', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(257, 256, 'Perda Kota Denpasar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(258, 256, 'Perda Pemprov Bali', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(259, 108, 'Provinsi Banten', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(260, 259, 'Perda Kota Tangerang Selatan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(261, 259, 'Perda Kota Serang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(262, 259, 'Perda Kota Cilegon', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(263, 259, 'Perda Kota Tangerang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(264, 259, 'Perda Pemprov Banten', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(265, 108, 'Provinsi Jawa Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(266, 265, 'Perda Kota Batu', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(267, 265, 'Perda Kota Surabaya', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(268, 265, 'Perda Kota Madiun', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(269, 265, 'Perda Kota Mojokerto', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(270, 265, 'Perda Kota Pasuruan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(271, 265, 'Perda Kota Probolinggo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(272, 265, 'Perda Kota Malang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(273, 265, 'Perda Kota Blitar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(274, 265, 'Perda Kota Kediri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(275, 265, 'Perda Pemprov Jawa Timur', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(276, 265, 'Perda Kabupaten Tuban', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(277, 108, 'Provinsi DI Yogyakarta', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(278, 277, 'Perda Kota Yogyakarta', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(279, 277, 'Perda Kabupaten Gunung Kidul', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(280, 277, 'Perda Kabupaten Kulon Progo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(281, 277, 'Perda Kabupaten Bantul', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(282, 277, 'Perda Kabupaten Sleman', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(283, 277, 'Perda Pemprov DI Yogyakarta', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(284, 108, 'Provinsi Jawa Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(285, 284, 'Perda Kabupaten Sukoharjo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(286, 284, 'Perda Kota Pekalongan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(287, 284, 'Perda Kota Tegal', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(288, 284, 'Perda Kota Semarang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(289, 284, 'Perda Kota Salatiga', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(290, 284, 'Perda Kota Surakarta', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(291, 284, 'Perda Kota Magelang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(292, 284, 'Perda Pemprov Jawa Tengah', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(293, 284, 'Perda Kabupaten Cilacap', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(294, 284, 'Perda Kabupaten Banyumas', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(295, 284, 'Perda Kabupaten Purbalingga', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(296, 284, 'Perda Kabupaten Banjarnegara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(297, 284, 'Perda Kabupaten Kebumen', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(298, 284, 'Perda Kabupaten Purworejo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(299, 284, 'Perda Kabupaten Wonosobo', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(300, 284, 'Perda Kabupaten Magelang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(301, 284, 'Perda Kabupaten Boyolali', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(302, 284, 'Perda Kabupaten Klaten', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(303, 284, 'Perda Kabupaten Wonogiri', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(304, 284, 'Perda Kabupaten Karanganyar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(305, 284, 'Perda Kabupaten Sragen', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(306, 284, 'Perda Kabupaten Grobogan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(307, 284, 'Perda Kabupaten Blora', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(308, 284, 'Perda Kabupaten Rembang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(309, 284, 'Perda Kabupaten Pati', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(310, 284, 'Perda Kabupaten Kudus', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(311, 284, 'Perda Kabupaten Jepara', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(312, 284, 'Perda Kabupaten Demak', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(313, 284, 'Perda Kabupaten Semarang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(314, 284, 'Perda Kabupaten Temanggung', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(315, 284, 'Perda Kabupaten Kendal', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(316, 284, 'Perda Kabupaten Batang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(317, 284, 'Perda Kabupaten Pekalongan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(318, 284, 'Perda Kabupaten Pemalang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(319, 284, 'Perda Kabupaten Tegal', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(320, 284, 'Perda Kabupaten Brebes', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(321, 108, 'Provinsi Jawa Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(322, 321, 'Perda Kabupaten Subang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(323, 321, 'Perda Kabupaten Indramayu', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(324, 321, 'Perda Kabupaten Sumedang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(325, 321, 'Perda Kabupaten Cirebon', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(326, 321, 'Perda Kabupaten Kuningan', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(327, 321, 'Perda Kabupaten Ciamis', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(328, 321, 'Perda Kabupaten Tasikmalaya', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(329, 321, 'Perda Kabupaten Garut', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(330, 321, 'Perda Kabupaten Bandung', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(331, 321, 'Perda Kabupaten Sukabumi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(332, 321, 'Perda Kabupaten Bogor', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(333, 321, 'Perda Kabupaten Majalengka', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(334, 321, 'Perda Kota Banjar', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(335, 321, 'Perda Kota Tasikmalaya', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(336, 321, 'Perda Kota Cimahi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(337, 321, 'Perda Kota Depok', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(338, 321, 'Perda Kota Bekasi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(339, 321, 'Perda Kota Cirebon', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(340, 321, 'Perda Kota Bandung', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(341, 321, 'Perda Kota Sukabumi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(342, 321, 'Perda Kota Bogor', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(343, 321, 'Perda Kabupaten Purwakarta', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(344, 321, 'Perda Kabupaten Karawang', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(345, 321, 'Perda Kabupaten Bekasi', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(346, 321, 'Perda Kabupaten Bandung Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(347, 321, 'Perda Pemprov Jawa Barat', '1', '1', '1', '2018-10-10 12:46:45', '2018-10-10 12:46:45'),
(348, 321, 'Perda Kabupaten Bogor', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(349, 321, 'Perda Kabupaten Sukabumi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(350, 321, 'Perda Kabupaten Cianjur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(351, 321, 'Perda Kabupaten Bandung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(352, 321, 'Perda Kabupaten Garut', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(353, 321, 'Perda Kabupaten Tasikmalaya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(354, 321, 'Perda Kabupaten Ciamis', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(355, 321, 'Perda Kabupaten Kuningan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(356, 321, 'Perda Kabupaten Cirebon', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(357, 321, 'Perda Kabupaten Sumedang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(358, 321, 'Perda Kabupaten Indramayu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(359, 321, 'Perda Kabupaten Subang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(360, 321, 'Perda Kabupaten Purwakarta', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(361, 321, 'Perda Kabupaten Karawang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(362, 321, 'Perda Kabupaten Bekasi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(363, 321, 'Perda Kabupaten Bandung Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(364, 321, 'Perda Kota Bogor', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(365, 321, 'Perda Kota Sukabumi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(366, 321, 'Perda Kota Bandung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(367, 321, 'Perda Kota Cirebon', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(368, 321, 'Perda Kota Bekasi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(369, 321, 'Perda Kota Depok', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(370, 321, 'Perda Kota Cimahi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(371, 321, 'Perda Kota Tasikmalaya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(372, 321, 'Perda Kota Banjar', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(373, 108, 'Provinsi DKI Jakarta', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(374, 373, 'Perda Kota Administrasi Jakarta Timur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(375, 373, 'Perda Kota Administrasi Jakarta Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(376, 373, 'Perda Kota Administrasi Jakarta Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(377, 373, 'Perda Kota Administrasi Jakarta Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(378, 373, 'Perda Kota Administrasi Jakarta Pusat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(379, 373, 'Perda Pemprov DKI Jakarta', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(380, 373, 'Perda Kabupaten Administrasi Kepulauan Seribu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(381, 108, 'Provinsi Kepulauan Riau', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(382, 381, 'Perda Kota Tanjung Pinang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(383, 381, 'Perda Kota Batam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(384, 381, 'Perda Pemprov Kepulauan Riau', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(385, 381, 'Perda Kabupaten Bintan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(386, 381, 'PERATURAN DAERAH KABUPATEN KARIMUN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(387, 381, 'Perda Kabupaten Natuna', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(388, 381, 'Perda Kabupaten Lingga', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(389, 381, 'Perda Kabupaten Kepulauan Anambas', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(390, 108, 'Provinsi Kepulauan Bangka Belitung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(391, 390, 'Perda Kota Pangkal Pinang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(392, 390, 'Perda Pemprov Bangka Belitung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(393, 390, 'Perda Kabupaten Bangka', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(394, 390, 'Perda Kabupaten Belitung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(395, 390, 'Perda Kabupaten Bangka Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(396, 390, 'Perda Kabupaten Bangka Tengah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(397, 390, 'Perda Kabupaten Bangka Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(398, 390, 'Perda Kabupaten Bangka Belitung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(399, 108, 'Provinsi Lampung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(400, 399, 'Perda Kota Metro', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(401, 399, 'Perda Kota Bandar Lampung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(402, 399, 'Perda Pemprov Lampung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(403, 399, 'Perda Kabupaten Lampung Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(404, 399, 'Perda Kabupaten Lampung Tengah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(405, 399, 'Perda Kabupaten Lampung Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(406, 399, 'Perda Kabupaten Lampung Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(407, 399, 'Perda Kabupaten Tulang Bawang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(408, 399, 'Perda Kabupaten Tanggamus', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(409, 399, 'Perda Kabupaten Lampung Timur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(410, 399, 'Perda Kabupaten Way Kanan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(411, 399, 'Perda Kabupaten Pesawaran', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(412, 399, 'Perda Kabupaten Pringsewu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(413, 399, 'Perda Kabupaten Mesuji', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(414, 399, 'Perda Kabupaten Tulang Bawang Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(415, 108, 'Provinsi Bengkulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(416, 415, 'Perda Kabupaten Bengkulu Tengah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(417, 415, 'Perda Kabupaten Kepahiang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(418, 415, 'Perda Kabupaten Lebong', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(419, 415, 'Perda Kabupaten Muko Muko', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(420, 415, 'Perda Kabupaten Seluma', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(421, 415, 'Perda Kabupaten Kaur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(422, 415, 'Perda Kabupaten Bengkulu Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(423, 415, 'Perda Kabupaten Rejang Lebong', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(424, 415, 'Perda Kabupaten Bengkulu Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(425, 415, 'Perda Kota Bengkulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(426, 415, 'Perda Pemprov Bengkulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(427, 108, 'Provinsi Sumatera Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(428, 427, 'Perda Kabupaten Empat Lawang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(429, 427, 'Perda Kabupaten Lahat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(430, 427, 'Perda Kabupaten Muara Enim', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(431, 427, 'Perda Kabupaten Ogan Komering Ilir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(432, 427, 'Perda Kabupaten Ogan Komering Ulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(433, 427, 'Perda Kota Prabumulih', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(434, 427, 'Perda Kota Lubuk Linggau', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(435, 427, 'Perda Kota Pagar Alam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(436, 427, 'Perda Kota Palembang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(437, 427, 'Perda Pemprov Sumatera Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(438, 427, 'Perda Kabupaten Musi Rawas', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(439, 427, 'Perda Kabupaten Musi Banyuasin', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(440, 427, 'Perda Kabupaten Banyuasin', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(441, 427, 'Perda Kabupaten Oku Timur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(442, 427, 'Perda Kabupaten Oku Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(443, 427, 'Perda Kabupaten Ogan Ilir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(444, 108, 'Provinsi Jambi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(445, 444, 'Perda Kabupaten Tebo', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(446, 444, 'Perda Kabupaten Bungo', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(447, 444, 'Perda Kabupaten Tanjung Jabung Timur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(448, 444, 'Perda Kabupaten Tanjung Jabung Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(449, 444, 'Perda Kabupaten Muaro Jambi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(450, 444, 'Perda Kabupaten Batang Hari', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(451, 444, 'Perda Kabupaten Sorolangun', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(452, 444, 'Perda Kabupaten Merangin', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(453, 444, 'Perda Kabupaten Kerinci', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(454, 444, 'Perda Kota Sungai Penuh', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(455, 444, 'Perda Kota Jambi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(456, 444, 'Perda Pemprov Jambi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(457, 108, 'Provinsi Riau', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(458, 457, 'Perda Kabupaten Kepulauan Meranti', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(459, 457, 'Perda Kabupaten Kuantan Sangingi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(460, 457, 'Perda Kabupaten Siak', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(461, 457, 'Perda Kabupaten Rokan Hilir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(462, 457, 'Perda Kabupaten Rokan Hulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(463, 457, 'Perda Kabupaten Pelalawan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(464, 457, 'Perda Kabupaten Indragiri Hilir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(465, 457, 'Perda Kabupaten Bengkalis', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(466, 457, 'Perda Kabupaten Indragiri Hulu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(467, 457, 'Perda Kabupaten Kampar', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(468, 457, 'Perda Kota Dumai', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(469, 457, 'Perda Kota Pekanbaru', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(470, 457, 'Perda Pemprov Riau', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(471, 108, 'Provinsi Sumatera Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(472, 471, 'Perda Kabupaten Pasaman Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(473, 471, 'Perda Kabupaten Solok Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(474, 471, 'Perda Kabupaten Dharmasraya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(475, 471, 'Perda Kabupaten Kepulauan Mentawai', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(476, 471, 'Perda Kabupaten Pasaman', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(477, 471, 'Perda Kabupaten Lima Puluh Kota', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(478, 471, 'Perda Kabupaten Agam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(479, 471, 'Perda Kabupaten Padang Pariaman', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(480, 471, 'Perda Kabupaten Tanah Datar', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(481, 471, 'Perda Kabupaten Sawah Lunto/Sijunjung', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(482, 471, 'Perda Kabupaten Solok', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(483, 471, 'Perda Kabupaten Pesisir Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(484, 471, 'Perda Kota Pariaman', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(485, 471, 'Perda Kota Payakumbuh', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(486, 471, 'Perda Kota Bukit Tinggi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(487, 471, 'Perda Kota Padang Panjang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(488, 471, 'Perda Kota SawahLunto', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(489, 471, 'Perda Kota Solok', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(490, 471, 'Perda Kota Padang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(491, 471, 'Perda Pemprov Sumatera Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(492, 108, 'Provinsi Sumatera Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(493, 492, 'Perda Kabupaten Nias Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(494, 492, 'Perda Kabupaten Nias Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(495, 492, 'Perda Kabupaten Labuhan Batu Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(496, 492, 'Perda Kabupaten Labuhan Batu Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(497, 492, 'Perda Kabupaten Padang Lawas', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(498, 492, 'Perda Kabupaten Padang Lawas Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(499, 492, 'Perda Kabupaten Batubara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(500, 492, 'Perda Kabupaten Serdang Bedagai', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(501, 492, 'Perda Kabupaten Samosir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(502, 492, 'Perda Kabupaten Humbang Hasundutan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(503, 492, 'Perda Kabupaten Pakpak Bharat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(504, 492, 'Perda Kabupaten Nias Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(505, 492, 'Perda Kabupaten Mandailing Natal', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(506, 492, 'Perda Kabupaten Toba Samosir', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46');
INSERT INTO `document_type` (`id`, `parent_id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(507, 492, 'Perda Kabupaten Dairi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(508, 492, 'Perda Kabupaten Labuhan Batu', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(509, 492, 'Perda Kabupaten Asahan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(510, 492, 'Perda Kabupaten Simalungun', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(511, 492, 'Perda Kabupaten Deli Serdang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(512, 492, 'Perda Kabupaten Karo', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(513, 492, 'Perda Kabupaten Langkat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(514, 492, 'Perda Kabupaten Nias', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(515, 492, 'Perda Kabupaten Tapanuli Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(516, 492, 'Perda Kabupaten Tapanuli Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(517, 492, 'Perda Kabupaten Tapanuli Tengah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(518, 492, 'Perda Kota Gunung Sitoli', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(519, 492, 'Perda Kota Padang Sidempuan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(520, 492, 'Perda Kota Tebing Tinggi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(521, 492, 'Perda Kota Binjai', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(522, 492, 'Perda Kota Tanjung Balai', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(523, 492, 'Perda Kota Sibolga', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(524, 492, 'Perda Kota Pematang Siantar', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(525, 492, 'Perda Kota Medan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(526, 492, 'Perda Pemprov Sumatera Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(527, 108, 'Provinsi Nangroe Aceh Darussalam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(528, 527, 'Perda Kabupaten Pidie Jaya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(529, 527, 'Perda Kabupaten Bener Meriah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(530, 527, 'Perda Kabupaten Aceh Tamiang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(531, 527, 'Perda Kabupaten Nagan Raya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(532, 527, 'Perda Kabupaten Aceh Jaya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(533, 527, 'Perda Kabupaten Gayo Lues', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(534, 527, 'Perda Kabupaten Aceh Barat Daya', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(535, 527, 'Perda Kabupaten Bireuen', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(536, 527, 'Perda Kabupaten Aceh Singkil', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(537, 527, 'Perda Kabupaten Simeulue', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(538, 527, 'Perda Kabupaten Aceh Utara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(539, 527, 'Perda Kabupaten Pidie', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(540, 527, 'Perda Kabupaten Aceh Besar', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(541, 527, 'Perda Kabupaten Aceh Barat', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(542, 527, 'Perda Kabupaten Aceh Tengah', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(543, 527, 'Perda Kabupaten Aceh Timur', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(544, 527, 'Perda Kabupaten Aceh Tenggara', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(545, 527, 'Perda Kabupaten Aceh Selatan', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(546, 527, 'Perda Kota Subulussalam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(547, 527, 'Perda Kota Langsa', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(548, 527, 'Perda Kota Lhokseumawe', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(549, 527, 'Perda Kota Sabang', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(550, 527, 'Perda Kota Banda Aceh', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(551, 527, 'Perda Pemprov Nanggroe Aceh Darussalam', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(552, 108, 'Provinsi', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(553, 108, 'ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(554, 553, 'KABUPATEN ACEH SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(555, 554, 'PERATURAN DAERAH KABUPATEN ACEH SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(556, 554, 'PERATURAN BUPATI KABUPATEN ACEH SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(557, 553, 'KABUPATEN ACEH TENGGARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(558, 557, 'PERATURAN DAERAH KABUPATEN ACEH TENGGARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(559, 557, 'PERATURAN BUPATI KABUPATEN ACEH TENGGARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(560, 553, 'KABUPATEN ACEH TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(561, 560, 'PERATURAN DAERAH KABUPATEN ACEH TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(562, 560, 'PERATURAN BUPATI KABUPATEN ACEH TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(563, 553, 'KABUPATEN ACEH TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(564, 563, 'PERATURAN DAERAH KABUPATEN ACEH TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(565, 563, 'PERATURAN BUPATI KABUPATEN ACEH TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(566, 553, 'KABUPATEN ACEH BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(567, 566, 'PERATURAN DAERAH KABUPATEN ACEH BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(568, 566, 'PERATURAN BUPATI KABUPATEN ACEH BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(569, 553, 'KABUPATEN ACEH BESAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(570, 569, 'PERATURAN DAERAH KABUPATEN ACEH BESAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(571, 569, 'PERATURAN BUPATI KABUPATEN ACEH BESAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(572, 553, 'KABUPATEN PIDIE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(573, 572, 'PERATURAN DAERAH KABUPATEN PIDIE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(574, 572, 'PERATURAN BUPATI KABUPATEN PIDIE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(575, 553, 'KABUPATEN ACEH UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(576, 575, 'PERATURAN DAERAH KABUPATEN ACEH UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(577, 575, 'PERATURAN BUPATI KABUPATEN ACEH UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(578, 553, 'KABUPATEN SIMEULUE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(579, 578, 'PERATURAN DAERAH KABUPATEN SIMEULUE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(580, 578, 'PERATURAN BUPATI KABUPATEN SIMEULUE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(581, 553, 'KABUPATEN ACEH SINGKIL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(582, 581, 'PERATURAN DAERAH KABUPATEN ACEH SINGKIL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(583, 581, 'PERATURAN BUPATI KABUPATEN ACEH SINGKIL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(584, 553, 'KABUPATEN BIREUEN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(585, 584, 'PERATURAN DAERAH KABUPATEN BIREUEN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(586, 584, 'PERATURAN BUPATI KABUPATEN BIREUEN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(587, 553, 'KABUPATEN ACEH BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(588, 587, 'PERATURAN DAERAH KABUPATEN ACEH BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(589, 587, 'PERATURAN BUPATI KABUPATEN ACEH BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(590, 553, 'KABUPATEN GAYO LUES', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(591, 590, 'PERATURAN DAERAH KABUPATEN GAYO LUES', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(592, 590, 'PERATURAN BUPATI KABUPATEN GAYO LUES', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(593, 553, 'KABUPATEN ACEH JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(594, 593, 'PERATURAN DAERAH KABUPATEN ACEH JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(595, 593, 'PERATURAN BUPATI KABUPATEN ACEH JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(596, 553, 'KABUPATEN NAGAN RAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(597, 596, 'PERATURAN DAERAH KABUPATEN NAGAN RAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(598, 596, 'PERATURAN BUPATI KABUPATEN NAGAN RAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(599, 553, 'KABUPATEN ACEH TAMIANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(600, 599, 'PERATURAN DAERAH KABUPATEN ACEH TAMIANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(601, 599, 'PERATURAN BUPATI KABUPATEN ACEH TAMIANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(602, 553, 'KABUPATEN BENER MERIAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(603, 602, 'PERATURAN DAERAH KABUPATEN BENER MERIAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(604, 602, 'PERATURAN BUPATI KABUPATEN BENER MERIAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(605, 553, 'KABUPATEN PIDIE JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(606, 605, 'PERATURAN DAERAH KABUPATEN PIDIE JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(607, 605, 'PERATURAN BUPATI KABUPATEN PIDIE JAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(608, 553, 'KOTA BANDA ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(609, 608, 'PERATURAN DAERAH KOTA BANDA ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(610, 608, 'PERATURAN WALIKOTA BANDA ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(611, 553, 'KOTA SABANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(612, 611, 'PERATURAN DAERAH KOTA SABANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(613, 611, 'PERATURAN WALIKOTA SABANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(614, 553, 'KOTA LHOKSEUMAWE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(615, 614, 'PERATURAN DAERAH KOTA LHOKSEUMAWE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(616, 614, 'PERATURAN WALIKOTA LHOKSEUMAWE', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(617, 553, 'KOTA LANGSA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(618, 617, 'PERATURAN DAERAH KOTA LANGSA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(619, 617, 'PERATURAN WALIKOTA LANGSA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(620, 553, 'KOTA SUBULUSSALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(621, 620, 'PERATURAN DAERAH KOTA SUBULUSSALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(622, 620, 'PERATURAN WALIKOTA SUBULUSSALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(623, 553, 'PROVINSI ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(624, 623, 'PERATURAN DAERAH PROVINSI ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(625, 623, 'PERATURAN GUBERNUR PROVINSI ACEH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(626, 108, 'SUMATERA UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(627, 626, 'KABUPATEN TAPANULI TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(628, 627, 'PERATURAN DAERAH KABUPATEN TAPANULI TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(629, 627, 'PERATURAN BUPATI KABUPATEN TAPANULI TENGAH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(630, 626, 'KABUPATEN TAPANULI UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(631, 630, 'PERATURAN DAERAH KABUPATEN TAPANULI UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(632, 630, 'PERATURAN BUPATI KABUPATEN TAPANULI UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(633, 626, 'KABUPATEN TAPANULI SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(634, 633, 'PERATURAN DAERAH KABUPATEN TAPANULI SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(635, 633, 'PERATURAN BUPATI KABUPATEN TAPANULI SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(636, 626, 'KABUPATEN NIAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(637, 636, 'PERATURAN DAERAH KABUPATEN NIAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(638, 636, 'PERATURAN BUPATI KABUPATEN NIAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(639, 626, 'KABUPATEN LANGKAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(640, 639, 'PERATURAN DAERAH KABUPATEN LANGKAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(641, 639, 'PERATURAN BUPATI KABUPATEN LANGKAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(642, 626, 'KABUPATEN KARO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(643, 642, 'PERATURAN DAERAH KABUPATEN KARO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(644, 642, 'PERATURAN BUPATI KABUPATEN KARO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(645, 626, 'KABUPATEN DELI SERDANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(646, 645, 'PERATURAN DAERAH KABUPATEN DELI SERDANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(647, 645, 'PERATURAN BUPATI KABUPATEN DELI SERDANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(648, 626, 'KABUPATEN SIMALUNGUN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(649, 648, 'PERATURAN DAERAH KABUPATEN SIMALUNGUN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(650, 648, 'PERATURAN BUPATI KABUPATEN SIMALUNGUN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(651, 626, 'KABUPATEN ASAHAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(652, 651, 'PERATURAN DAERAH KABUPATEN ASAHAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(653, 651, 'PERATURAN BUPATI KABUPATEN ASAHAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(654, 626, 'KABUPATEN LABUHANBATU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(655, 654, 'PERATURAN DAERAH KABUPATEN LABUHANBATU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(656, 654, 'PERATURAN BUPATI KABUPATEN LABUHANBATU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(657, 626, 'KABUPATEN DAIRI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(658, 657, 'PERATURAN DAERAH KABUPATEN DAIRI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(659, 657, 'PERATURAN BUPATI KABUPATEN DAIRI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(660, 626, 'KABUPATEN TOBA SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(661, 660, 'PERATURAN DAERAH KABUPATEN TOBA SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(662, 660, 'PERATURAN BUPATI KABUPATEN TOBA SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(663, 626, 'KABUPATEN MANDAILING NATAL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(664, 663, 'PERATURAN DAERAH KABUPATEN MANDAILING NATAL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(665, 663, 'PERATURAN BUPATI KABUPATEN MANDAILING NATAL', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(666, 626, 'KABUPATEN NIAS SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(667, 666, 'PERATURAN DAERAH KABUPATEN NIAS SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(668, 666, 'PERATURAN BUPATI KABUPATEN NIAS SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(669, 626, 'KABUPATEN PAKPAK BHARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(670, 669, 'PERATURAN DAERAH KABUPATEN PAKPAK BHARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(671, 669, 'PERATURAN BUPATI KABUPATEN PAKPAK BHARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(672, 626, 'KABUPATEN HUMBANG HASUNDUTAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(673, 672, 'PERATURAN DAERAH KABUPATEN HUMBANG HASUNDUTAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(674, 672, 'PERATURAN BUPATI KABUPATEN HUMBANG HASUNDUTAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(675, 626, 'KABUPATEN SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(676, 675, 'PERATURAN DAERAH KABUPATEN SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(677, 675, 'PERATURAN BUPATI KABUPATEN SAMOSIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(678, 626, 'KABUPATEN SERDANG BEDAGAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(679, 678, 'PERATURAN DAERAH KABUPATEN SERDANG BEDAGAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(680, 678, 'PERATURAN BUPATI KABUPATEN SERDANG BEDAGAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(681, 626, 'KABUPATEN BATU BARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(682, 681, 'PERATURAN DAERAH KABUPATEN BATU BARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(683, 681, 'PERATURAN BUPATI KABUPATEN BATU BARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(684, 626, 'KABUPATEN PADANG LAWAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(685, 684, 'PERATURAN DAERAH KABUPATEN PADANG LAWAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(686, 684, 'PERATURAN BUPATI KABUPATEN PADANG LAWAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(687, 626, 'KABUPATEN PADANG LAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(688, 687, 'PERATURAN DAERAH KABUPATEN PADANG LAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(689, 687, 'PERATURAN BUPATI KABUPATEN PADANG LAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(690, 626, 'KABUPATEN LABUHANBATU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(691, 690, 'PERATURAN DAERAH KABUPATEN LABUHANBATU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(692, 690, 'PERATURAN BUPATI KABUPATEN LABUHANBATU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(693, 626, 'KABUPATEN LABUHANBATU UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(694, 693, 'PERATURAN DAERAH KABUPATEN LABUHANBATU UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(695, 693, 'PERATURAN BUPATI KABUPATEN LABUHANBATU UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(696, 626, 'KABUPATEN NIAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(697, 696, 'PERATURAN DAERAH KABUPATEN NIAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(698, 696, 'PERATURAN BUPATI KABUPATEN NIAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(699, 626, 'KABUPATEN NIAS BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(700, 699, 'PERATURAN DAERAH KABUPATEN NIAS BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(701, 699, 'PERATURAN BUPATI KABUPATEN NIAS BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(702, 626, 'KOTA MEDAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(703, 702, 'PERATURAN DAERAH KOTA MEDAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(704, 702, 'PERATURAN WALIKOTA MEDAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(705, 626, 'KOTA PEMATANG SIANTAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(706, 705, 'PERATURAN DAERAH KOTA PEMATANG SIANTAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(707, 705, 'PERATURAN WALIKOTA PEMATANG SIANTAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(708, 626, 'KOTA SIBOLGA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(709, 708, 'PERATURAN DAERAH KOTA SIBOLGA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(710, 708, 'PERATURAN WALIKOTA SIBOLGA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(711, 626, 'KOTA TANJUNG BALAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(712, 711, 'PERATURAN DAERAH KOTA TANJUNG BALAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(713, 711, 'PERATURAN WALIKOTA TANJUNG BALAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(714, 626, 'KOTA BINJAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(715, 714, 'PERATURAN DAERAH KOTA BINJAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(716, 714, 'PERATURAN WALIKOTA BINJAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(717, 626, 'KOTA TEBING TINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(718, 717, 'PERATURAN DAERAH KOTA TEBING TINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(719, 717, 'PERATURAN WALIKOTA TEBING TINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(720, 626, 'KOTA PADANG SIDEMPUAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(721, 720, 'PERATURAN DAERAH KOTA PADANG SIDEMPUAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(722, 720, 'PERATURAN WALIKOTA PADANG SIDEMPUAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(723, 626, 'KOTA GUNUNGSITOLI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(724, 723, 'PERATURAN DAERAH KOTA GUNUNGSITOLI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(725, 723, 'PERATURAN WALIKOTA GUNUNGSITOLI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(726, 626, 'PROVINSI SUMATERA UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(727, 726, 'PERATURAN DAERAH PROVINSI SUMATERA UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(728, 726, 'PERATURAN GUBERNUR PROVINSI SUMATERA UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(729, 108, 'SUMATERA BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(730, 729, 'KABUPATEN PESISIR SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(731, 730, 'PERATURAN DAERAH KABUPATEN PESISIR SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(732, 730, 'PERATURAN BUPATI KABUPATEN PESISIR SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(733, 729, 'KABUPATEN SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(734, 733, 'PERATURAN DAERAH KABUPATEN SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(735, 733, 'PERATURAN BUPATI KABUPATEN SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(736, 729, 'KABUPATEN SIJUNJUNG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(737, 736, 'PERATURAN DAERAH KABUPATEN SIJUNJUNG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(738, 736, 'PERATURAN BUPATI KABUPATEN SIJUNJUNG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(739, 729, 'KABUPATEN TANAH DATAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(740, 739, 'PERATURAN DAERAH KABUPATEN TANAH DATAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(741, 739, 'PERATURAN BUPATI KABUPATEN TANAH DATAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(742, 729, 'KABUPATEN PADANG PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(743, 742, 'PERATURAN DAERAH KABUPATEN PADANG PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(744, 742, 'PERATURAN BUPATI KABUPATEN PADANG PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(745, 729, 'KABUPATEN AGAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(746, 745, 'PERATURAN DAERAH KABUPATEN AGAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(747, 745, 'PERATURAN BUPATI KABUPATEN AGAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(748, 729, 'KABUPATEN LIMA PULUH KOTA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(749, 748, 'PERATURAN DAERAH KABUPATEN LIMA PULUH KOTA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(750, 748, 'PERATURAN BUPATI KABUPATEN LIMA PULUH KOTA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(751, 729, 'KABUPATEN PASAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(752, 751, 'PERATURAN DAERAH KABUPATEN PASAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(753, 751, 'PERATURAN BUPATI KABUPATEN PASAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(754, 729, 'KABUPATEN KEPULAUAN MENTAWAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(755, 754, 'PERATURAN DAERAH KABUPATEN KEPULAUAN MENTAWAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(756, 754, 'PERATURAN BUPATI KABUPATEN KEPULAUAN MENTAWAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(757, 729, 'KABUPATEN DHARMASRAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(758, 757, 'PERATURAN DAERAH KABUPATEN DHARMASRAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(759, 757, 'PERATURAN BUPATI KABUPATEN DHARMASRAYA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(760, 729, 'KABUPATEN SOLOK SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(761, 760, 'PERATURAN DAERAH KABUPATEN SOLOK SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(762, 760, 'PERATURAN BUPATI KABUPATEN SOLOK SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(763, 729, 'KABUPATEN PASAMAN BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(764, 763, 'PERATURAN DAERAH KABUPATEN PASAMAN BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(765, 763, 'PERATURAN BUPATI KABUPATEN PASAMAN BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(766, 729, 'KOTA PADANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(767, 766, 'PERATURAN DAERAH KOTA PADANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(768, 766, 'PERATURAN WALIKOTA PADANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(769, 729, 'KOTA SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(770, 769, 'PERATURAN DAERAH KOTA SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(771, 769, 'PERATURAN WALIKOTA SOLOK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(772, 729, 'KOTA SAWAHLUNTO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(773, 772, 'PERATURAN DAERAH KOTA SAWAHLUNTO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(774, 772, 'PERATURAN WALIKOTA SAWAHLUNTO', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(775, 729, 'KOTA PADANG PANJANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(776, 775, 'PERATURAN DAERAH KOTA PADANG PANJANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(777, 775, 'PERATURAN WALIKOTA PADANG PANJANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(778, 729, 'KOTA BUKITTINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(779, 778, 'PERATURAN DAERAH KOTA BUKITTINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(780, 778, 'PERATURAN WALIKOTA BUKITTINGGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(781, 729, 'KOTA PAYAKUMBUH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(782, 781, 'PERATURAN DAERAH KOTA PAYAKUMBUH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(783, 781, 'PERATURAN WALIKOTA PAYAKUMBUH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(784, 729, 'KOTA PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(785, 784, 'PERATURAN DAERAH KOTA PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(786, 784, 'PERATURAN WALIKOTA PARIAMAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(787, 729, 'PROVINSI SUMATERA BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(788, 787, 'PERATURAN DAERAH PROVINSI SUMATERA BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(789, 787, 'PERATURAN GUBERNUR PROVINSI SUMATERA BARAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(790, 108, 'RIAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(791, 790, 'KABUPATEN KAMPAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(792, 791, 'PERATURAN DAERAH KABUPATEN KAMPAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(793, 791, 'PERATURAN BUPATI KABUPATEN KAMPAR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(794, 790, 'KABUPATEN INDRAGIRI HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(795, 794, 'PERATURAN DAERAH KABUPATEN INDRAGIRI HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(796, 794, 'PERATURAN BUPATI KABUPATEN INDRAGIRI HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(797, 790, 'KABUPATEN BENGKALIS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(798, 797, 'PERATURAN DAERAH KABUPATEN BENGKALIS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(799, 797, 'PERATURAN BUPATI KABUPATEN BENGKALIS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(800, 790, 'KABUPATEN INDRAGIRI HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(801, 800, 'PERATURAN DAERAH KABUPATEN INDRAGIRI HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(802, 800, 'PERATURAN BUPATI KABUPATEN INDRAGIRI HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(803, 790, 'KABUPATEN PELALAWAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(804, 803, 'PERATURAN DAERAH KABUPATEN PELALAWAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(805, 803, 'PERATURAN BUPATI KABUPATEN PELALAWAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(806, 790, 'KABUPATEN ROKAN HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(807, 806, 'PERATURAN DAERAH KABUPATEN ROKAN HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(808, 806, 'PERATURAN BUPATI KABUPATEN ROKAN HULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(809, 790, 'KABUPATEN ROKAN HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(810, 809, 'PERATURAN DAERAH KABUPATEN ROKAN HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(811, 809, 'PERATURAN BUPATI KABUPATEN ROKAN HILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(812, 790, 'KABUPATEN SIAK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(813, 812, 'PERATURAN DAERAH KABUPATEN SIAK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(814, 812, 'PERATURAN BUPATI KABUPATEN SIAK', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(815, 790, 'KABUPATEN KUANTAN SINGINGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(816, 815, 'PERATURAN DAERAH KABUPATEN KUANTAN SINGINGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(817, 815, 'PERATURAN BUPATI KABUPATEN KUANTAN SINGINGI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(818, 790, 'KABUPATEN KEPULAUAN MERANTI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(819, 818, 'PERATURAN DAERAH KABUPATEN KEPULAUAN MERANTI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(820, 818, 'PERATURAN BUPATI KABUPATEN KEPULAUAN MERANTI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(821, 790, 'KOTA PEKANBARU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(822, 821, 'PERATURAN DAERAH KOTA PEKANBARU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(823, 821, 'PERATURAN WALIKOTA PEKANBARU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(824, 790, 'KOTA DUMAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(825, 824, 'PERATURAN DAERAH KOTA DUMAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(826, 824, 'PERATURAN WALIKOTA DUMAI', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(827, 790, 'PROVINSI RIAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(828, 827, 'PERATURAN DAERAH PROVINSI RIAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(829, 827, 'PERATURAN GUBERNUR PROVINSI RIAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(830, 108, 'SUMATERA SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(831, 830, 'KABUPATEN OGAN KOMERING ULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(832, 831, 'PERATURAN DAERAH KABUPATEN OGAN KOMERING ULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(833, 831, 'PERATURAN BUPATI KABUPATEN OGAN KOMERING ULU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(834, 830, 'KABUPATEN OGAN KOMERING ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(835, 834, 'PERATURAN DAERAH KABUPATEN OGAN KOMERING ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(836, 834, 'PERATURAN BUPATI KABUPATEN OGAN KOMERING ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(837, 830, 'KABUPATEN MUARA ENIM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(838, 837, 'PERATURAN DAERAH KABUPATEN MUARA ENIM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(839, 837, 'PERATURAN BUPATI KABUPATEN MUARA ENIM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(840, 830, 'KABUPATEN LAHAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(841, 840, 'PERATURAN DAERAH KABUPATEN LAHAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(842, 840, 'PERATURAN BUPATI KABUPATEN LAHAT', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(843, 830, 'KABUPATEN MUSI RAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(844, 843, 'PERATURAN DAERAH KABUPATEN MUSI RAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(845, 843, 'PERATURAN BUPATI KABUPATEN MUSI RAWAS', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(846, 830, 'KABUPATEN MUSI BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(847, 846, 'PERATURAN DAERAH KABUPATEN MUSI BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(848, 846, 'PERATURAN BUPATI KABUPATEN MUSI BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(849, 830, 'KABUPATEN BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(850, 849, 'PERATURAN DAERAH KABUPATEN BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(851, 849, 'PERATURAN BUPATI KABUPATEN BANYUASIN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(852, 830, 'KABUPATEN OGAN KOMERING ULU TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(853, 852, 'PERATURAN DAERAH KABUPATEN OGAN KOMERING ULU TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(854, 852, 'PERATURAN BUPATI KABUPATEN OGAN KOMERING ULU TIMUR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(855, 830, 'KABUPATEN OGAN KOMERING ULU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(856, 855, 'PERATURAN DAERAH KABUPATEN OGAN KOMERING ULU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(857, 855, 'PERATURAN BUPATI KABUPATEN OGAN KOMERING ULU SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(858, 830, 'KABUPATEN OGAN ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(859, 858, 'PERATURAN DAERAH KABUPATEN OGAN ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(860, 858, 'PERATURAN BUPATI KABUPATEN OGAN ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(861, 830, 'KABUPATEN EMPAT LAWANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(862, 861, 'PERATURAN DAERAH KABUPATEN EMPAT LAWANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(863, 861, 'PERATURAN BUPATI KABUPATEN EMPAT LAWANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(864, 830, 'KOTA PALEMBANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(865, 864, 'PERATURAN DAERAH KOTA PALEMBANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(866, 864, 'PERATURAN WALIKOTA PALEMBANG', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(867, 830, 'KOTA PAGAR ALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(868, 867, 'PERATURAN DAERAH KOTA PAGAR ALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(869, 867, 'PERATURAN WALIKOTA PAGAR ALAM', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(870, 830, 'KOTA LUBUK LINGGAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(871, 870, 'PERATURAN DAERAH KOTA LUBUK LINGGAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(872, 870, 'PERATURAN WALIKOTA LUBUK LINGGAU', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(873, 830, 'KOTA PRABUMULIH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(874, 873, 'PERATURAN DAERAH KOTA PRABUMULIH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(875, 873, 'PERATURAN WALIKOTA PRABUMULIH', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(876, 830, 'KABUPATEN MUSI RAWAS UTARA', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(877, 830, 'KABUPATEN PENUKAL ABAB LEMATANG ILIR', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(878, 830, 'PROVINSI SUMATERA SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(879, 878, 'PERATURAN DAERAH PROVINSI SUMATERA SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(880, 878, 'PERATURAN GUBERNUR PROVINSI SUMATERA SELATAN', '1', '1', '1', '2018-10-10 12:46:46', '2018-10-10 12:46:46'),
(881, 108, 'BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(882, 881, 'KABUPATEN BENGKULU SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(883, 882, 'PERATURAN DAERAH KABUPATEN BENGKULU SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(884, 882, 'PERATURAN BUPATI KABUPATEN BENGKULU SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(885, 881, 'KABUPATEN REJANG LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(886, 885, 'PERATURAN DAERAH KABUPATEN REJANG LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(887, 885, 'PERATURAN BUPATI KABUPATEN REJANG LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(888, 881, 'KABUPATEN BENGKULU UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(889, 888, 'PERATURAN DAERAH KABUPATEN BENGKULU UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(890, 888, 'PERATURAN BUPATI KABUPATEN BENGKULU UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(891, 881, 'KABUPATEN KAUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(892, 891, 'PERATURAN DAERAH KABUPATEN KAUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(893, 891, 'PERATURAN BUPATI KABUPATEN KAUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(894, 881, 'KABUPATEN SELUMA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(895, 894, 'PERATURAN DAERAH KABUPATEN SELUMA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(896, 894, 'PERATURAN BUPATI KABUPATEN SELUMA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(897, 881, 'KABUPATEN MUKO MUKO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(898, 897, 'PERATURAN DAERAH KABUPATEN MUKO MUKO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(899, 897, 'PERATURAN BUPATI KABUPATEN MUKO MUKO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(900, 881, 'KABUPATEN LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(901, 900, 'PERATURAN DAERAH KABUPATEN LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(902, 900, 'PERATURAN BUPATI KABUPATEN LEBONG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(903, 881, 'KABUPATEN KEPAHIANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(904, 903, 'PERATURAN DAERAH KABUPATEN KEPAHIANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(905, 903, 'PERATURAN BUPATI KABUPATEN KEPAHIANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(906, 881, 'KABUPATEN BENGKULU TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(907, 906, 'PERATURAN DAERAH KABUPATEN BENGKULU TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(908, 906, 'PERATURAN BUPATI KABUPATEN BENGKULU TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(909, 881, 'KOTA BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(910, 909, 'PERATURAN DAERAH KOTA BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(911, 909, 'PERATURAN WALIKOTA BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(912, 881, 'PROVINSI BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(913, 912, 'PERATURAN DAERAH PROVINSI BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(914, 912, 'PERATURAN GUBERNUR PROVINSI BENGKULU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(915, 108, 'LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(916, 915, 'KABUPATEN LAMPUNG SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(917, 916, 'PERATURAN DAERAH KABUPATEN LAMPUNG SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(918, 916, 'PERATURAN BUPATI KABUPATEN LAMPUNG SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(919, 915, 'KABUPATEN LAMPUNG TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(920, 919, 'PERATURAN DAERAH KABUPATEN LAMPUNG TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(921, 919, 'PERATURAN BUPATI KABUPATEN LAMPUNG TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(922, 915, 'KABUPATEN LAMPUNG UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(923, 922, 'PERATURAN DAERAH KABUPATEN LAMPUNG UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(924, 922, 'PERATURAN BUPATI KABUPATEN LAMPUNG UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(925, 915, 'KABUPATEN LAMPUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(926, 925, 'PERATURAN DAERAH KABUPATEN LAMPUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(927, 925, 'PERATURAN BUPATI KABUPATEN LAMPUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(928, 915, 'KABUPATEN TULANG BAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(929, 928, 'PERATURAN DAERAH KABUPATEN TULANG BAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(930, 928, 'PERATURAN BUPATI KABUPATEN TULANG BAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(931, 915, 'KABUPATEN TANGGAMUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(932, 931, 'PERATURAN DAERAH KABUPATEN TANGGAMUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(933, 931, 'PERATURAN BUPATI KABUPATEN TANGGAMUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(934, 915, 'KABUPATEN LAMPUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(935, 934, 'PERATURAN DAERAH KABUPATEN LAMPUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(936, 934, 'PERATURAN BUPATI KABUPATEN LAMPUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(937, 915, 'KABUPATEN WAY KANAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(938, 937, 'PERATURAN DAERAH KABUPATEN WAY KANAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(939, 937, 'PERATURAN BUPATI KABUPATEN WAY KANAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(940, 915, 'KABUPATEN PESAWARAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(941, 940, 'PERATURAN DAERAH KABUPATEN PESAWARAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(942, 940, 'PERATURAN BUPATI KABUPATEN PESAWARAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(943, 915, 'KABUPATEN PRINGSEWU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(944, 943, 'PERATURAN DAERAH KABUPATEN PRINGSEWU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(945, 943, 'PERATURAN BUPATI KABUPATEN PRINGSEWU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(946, 915, 'KABUPATEN MESUJI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(947, 946, 'PERATURAN DAERAH KABUPATEN MESUJI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(948, 946, 'PERATURAN BUPATI KABUPATEN MESUJI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(949, 915, 'KABUPATEN TULANG BAWANG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(950, 949, 'PERATURAN DAERAH KABUPATEN TULANG BAWANG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(951, 949, 'PERATURAN BUPATI KABUPATEN TULANG BAWANG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(952, 915, 'KOTA BANDAR LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(953, 952, 'PERATURAN DAERAH KOTA BANDAR LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(954, 952, 'PERATURAN WALIKOTA BANDAR LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(955, 915, 'KOTA METRO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(956, 955, 'PERATURAN DAERAH KOTA METRO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(957, 955, 'PERATURAN WALIKOTA METRO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(958, 915, 'KABUPATEN PESISIR BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(959, 958, 'PERATURAN DAERAH KABUPATEN PESISIR BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(960, 958, 'PERATURAN BUPATI PESISIR BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(961, 915, 'PROVINSI LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(962, 961, 'PERATURAN DAERAH PROVINSI LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(963, 961, 'PERATURAN GUBERNUR PROVINSI LAMPUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(964, 108, 'KEP. BANGKA BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(965, 964, 'KABUPATEN BANGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(966, 965, 'PERATURAN DAERAH KABUPATEN BANGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(967, 965, 'PERATURAN BUPATI KABUPATEN BANGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(968, 964, 'KABUPATEN BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(969, 968, 'PERATURAN DAERAH KABUPATEN BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(970, 968, 'PERATURAN BUPATI KABUPATEN BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(971, 964, 'KABUPATEN BANGKA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(972, 971, 'PERATURAN DAERAH KABUPATEN BANGKA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(973, 971, 'PERATURAN BUPATI KABUPATEN BANGKA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(974, 964, 'KABUPATEN BANGKA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(975, 974, 'PERATURAN DAERAH KABUPATEN BANGKA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(976, 974, 'PERATURAN BUPATI KABUPATEN BANGKA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(977, 964, 'KABUPATEN BANGKA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(978, 977, 'PERATURAN DAERAH KABUPATEN BANGKA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(979, 977, 'PERATURAN BUPATI KABUPATEN BANGKA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(980, 964, 'KABUPATEN BELITUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47');
INSERT INTO `document_type` (`id`, `parent_id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(981, 980, 'PERATURAN DAERAH KABUPATEN BELITUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(982, 980, 'PERATURAN BUPATI KABUPATEN BELITUNG TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(983, 964, 'KOTA PANGKAL PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(984, 983, 'PERATURAN DAERAH KOTA PANGKAL PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(985, 983, 'PERATURAN WALIKOTA PANGKAL PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(986, 964, 'PROVINSI KEP. BANGKA BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(987, 986, 'PERATURAN DAERAH PROVINSI KEP. BANGKA BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(988, 986, 'PERATURAN GUBERNUR PROVINSI KEP. BANGKA BELITUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(989, 108, 'KEPULAUAN RIAU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(990, 989, 'KABUPATEN BINTAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(991, 990, 'PERATURAN DAERAH KABUPATEN BINTAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(992, 990, 'PERATURAN BUPATI KABUPATEN BINTAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(993, 989, 'KABUPATEN KARIMUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(994, 993, 'PERATURAN DAERAH KABUPATEN KARIMUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(995, 993, 'PERATURAN BUPATI KABUPATEN KARIMUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(996, 989, 'KABUPATEN NATUNA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(997, 996, 'PERATURAN DAERAH KABUPATEN NATUNA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(998, 996, 'PERATURAN BUPATI KABUPATEN NATUNA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(999, 989, 'KABUPATEN LINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1000, 999, 'PERATURAN DAERAH KABUPATEN LINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1001, 999, 'PERATURAN BUPATI KABUPATEN LINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1002, 989, 'KABUPATEN KEPULAUAN ANAMBAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1003, 1002, 'PERATURAN DAERAH KABUPATEN KEPULAUAN ANAMBAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1004, 1002, 'PERATURAN BUPATI KABUPATEN KEPULAUAN ANAMBAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1005, 989, 'KOTA BATAM', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1006, 1005, 'PERATURAN DAERAH KOTA BATAM', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1007, 1005, 'PERATURAN WALIKOTA BATAM', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1008, 989, 'KOTA TANJUNG PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1009, 1008, 'PERATURAN DAERAH KOTA TANJUNG PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1010, 1008, 'PERATURAN WALIKOTA TANJUNG PINANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1011, 989, 'PROVINSI KEPULAUAN RIAU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1012, 1011, 'PERATURAN DAERAH PROVINSI KEPULAUAN RIAU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1013, 1011, 'PERATURAN GUBERNUR PROVINSI KEPULAUAN RIAU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1014, 108, 'DKI JAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1015, 1014, 'KABUPATEN ADMINISTRASI KEP. SERIBU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1016, 1015, 'PERATURAN DAERAH KABUPATEN ADMINISTRASI KEP. SERIBU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1017, 1015, 'PERATURAN BUPATI KABUPATEN ADMINISTRASI KEP. SERIBU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1018, 1014, 'KOTA ADMINISTRASI JAKARTA PUSAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1019, 1018, 'PERATURAN DAERAH KOTA ADMINISTRASI JAKARTA PUSAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1020, 1018, 'PERATURAN WALIKOTA ADMINISTRASI JAKARTA PUSAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1021, 1014, 'KOTA ADMINISTRASI JAKARTA UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1022, 1021, 'PERATURAN DAERAH KOTA ADMINISTRASI JAKARTA UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1023, 1021, 'PERATURAN WALIKOTA ADMINISTRASI JAKARTA UTARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1024, 1014, 'KOTA ADMINISTRASI JAKARTA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1025, 1024, 'PERATURAN DAERAH KOTA ADMINISTRASI JAKARTA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1026, 1024, 'PERATURAN WALIKOTA ADMINISTRASI JAKARTA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1027, 1014, 'KOTA ADMINISTRASI JAKARTA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1028, 1027, 'PERATURAN DAERAH KOTA ADMINISTRASI JAKARTA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1029, 1027, 'PERATURAN WALIKOTA ADMINISTRASI JAKARTA SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1030, 1014, 'KOTA ADMINISTRASI JAKARTA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1031, 1030, 'PERATURAN DAERAH KOTA ADMINISTRASI JAKARTA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1032, 1030, 'PERATURAN WALIKOTA ADMINISTRASI JAKARTA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1033, 1014, 'PROVINSI DKI JAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1034, 1033, 'PERATURAN DAERAH PROVINSI DKI JAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1035, 1033, 'PERATURAN GUBERNUR PROVINSI DKI JAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1036, 108, 'JAWA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1037, 1036, 'KABUPATEN BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1038, 1037, 'PERATURAN DAERAH KABUPATEN BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1039, 1037, 'PERATURAN BUPATI KABUPATEN BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1040, 1036, 'KABUPATEN SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1041, 1040, 'PERATURAN DAERAH KABUPATEN SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1042, 1040, 'PERATURAN BUPATI KABUPATEN SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1043, 1036, 'KABUPATEN CIANJUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1044, 1043, 'PERATURAN DAERAH KABUPATEN CIANJUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1045, 1043, 'PERATURAN BUPATI KABUPATEN CIANJUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1046, 1036, 'KABUPATEN BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1047, 1046, 'PERATURAN DAERAH KABUPATEN BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1048, 1046, 'PERATURAN BUPATI KABUPATEN BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1049, 1036, 'KABUPATEN GARUT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1050, 1049, 'PERATURAN DAERAH KABUPATEN GARUT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1051, 1049, 'PERATURAN BUPATI KABUPATEN GARUT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1052, 1036, 'KABUPATEN TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1053, 1052, 'PERATURAN DAERAH KABUPATEN TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1054, 1052, 'PERATURAN BUPATI KABUPATEN TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1055, 1036, 'KABUPATEN CIAMIS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1056, 1055, 'PERATURAN DAERAH KABUPATEN CIAMIS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1057, 1055, 'PERATURAN BUPATI KABUPATEN CIAMIS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1058, 1036, 'KABUPATEN KUNINGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1059, 1058, 'PERATURAN DAERAH KABUPATEN KUNINGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1060, 1058, 'PERATURAN BUPATI KABUPATEN KUNINGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1061, 1036, 'KABUPATEN CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1062, 1061, 'PERATURAN DAERAH KABUPATEN CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1063, 1061, 'PERATURAN BUPATI KABUPATEN CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1064, 1036, 'KABUPATEN MAJALENGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1065, 1064, 'PERATURAN DAERAH KABUPATEN MAJALENGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1066, 1064, 'PERATURAN BUPATI KABUPATEN MAJALENGKA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1067, 1036, 'KABUPATEN SUMEDANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1068, 1067, 'PERATURAN DAERAH KABUPATEN SUMEDANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1069, 1067, 'PERATURAN BUPATI KABUPATEN SUMEDANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1070, 1036, 'KABUPATEN INDRAMAYU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1071, 1070, 'PERATURAN DAERAH KABUPATEN INDRAMAYU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1072, 1070, 'PERATURAN BUPATI KABUPATEN INDRAMAYU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1073, 1036, 'KABUPATEN SUBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1074, 1073, 'PERATURAN DAERAH KABUPATEN SUBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1075, 1073, 'PERATURAN BUPATI KABUPATEN SUBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1076, 1036, 'KABUPATEN PURWAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1077, 1076, 'PERATURAN DAERAH KABUPATEN PURWAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1078, 1076, 'PERATURAN BUPATI KABUPATEN PURWAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1079, 1036, 'KABUPATEN KARAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1080, 1079, 'PERATURAN DAERAH KABUPATEN KARAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1081, 1079, 'PERATURAN BUPATI KABUPATEN KARAWANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1082, 1036, 'KABUPATEN BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1083, 1082, 'PERATURAN DAERAH KABUPATEN BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1084, 1082, 'PERATURAN BUPATI KABUPATEN BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1085, 1036, 'KABUPATEN BANDUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1086, 1085, 'PERATURAN DAERAH KABUPATEN BANDUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1087, 1085, 'PERATURAN BUPATI KABUPATEN BANDUNG BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1088, 1036, 'KOTA BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1089, 1088, 'PERATURAN DAERAH KOTA BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1090, 1088, 'PERATURAN WALIKOTA BOGOR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1091, 1036, 'KOTA SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1092, 1091, 'PERATURAN DAERAH KOTA SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1093, 1091, 'PERATURAN WALIKOTA SUKABUMI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1094, 1036, 'KOTA BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1095, 1094, 'PERATURAN DAERAH KOTA BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1096, 1094, 'PERATURAN WALIKOTA BANDUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1097, 1036, 'KOTA CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1098, 1097, 'PERATURAN DAERAH KOTA CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1099, 1097, 'PERATURAN WALIKOTA CIREBON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1100, 1036, 'KOTA BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1101, 1100, 'PERATURAN DAERAH KOTA BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1102, 1100, 'PERATURAN WALIKOTA BEKASI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1103, 1036, 'KOTA DEPOK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1104, 1103, 'PERATURAN DAERAH KOTA DEPOK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1105, 1103, 'PERATURAN WALIKOTA DEPOK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1106, 1036, 'KOTA CIMAHI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1107, 1106, 'PERATURAN DAERAH KOTA CIMAHI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1108, 1106, 'PERATURAN WALIKOTA CIMAHI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1109, 1036, 'KOTA TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1110, 1109, 'PERATURAN DAERAH KOTA TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1111, 1109, 'PERATURAN WALIKOTA TASIKMALAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1112, 1036, 'KOTA BANJAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1113, 1112, 'PERATURAN DAERAH KOTA BANJAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1114, 1112, 'PERATURAN WALIKOTA BANJAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1115, 1036, 'KABUPATEN PANGANDARAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1116, 1036, 'PROVINSI JAWA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1117, 1116, 'PERATURAN DAERAH PROVINSI JAWA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1118, 1116, 'PERATURAN GUBERNUR PROVINSI JAWA BARAT', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1119, 108, 'JAWA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1120, 1119, 'KABUPATEN CILACAP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1121, 1120, 'PERATURAN DAERAH KABUPATEN CILACAP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1122, 1120, 'PERATURAN BUPATI KABUPATEN CILACAP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1123, 1119, 'KABUPATEN BANYUMAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1124, 1123, 'PERATURAN DAERAH KABUPATEN BANYUMAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1125, 1123, 'PERATURAN BUPATI KABUPATEN BANYUMAS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1126, 1119, 'KABUPATEN PURBALINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1127, 1126, 'PERATURAN DAERAH KABUPATEN PURBALINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1128, 1126, 'PERATURAN BUPATI KABUPATEN PURBALINGGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1129, 1119, 'KABUPATEN BANJARNEGARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1130, 1129, 'PERATURAN DAERAH KABUPATEN BANJARNEGARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1131, 1129, 'PERATURAN BUPATI KABUPATEN BANJARNEGARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1132, 1119, 'KABUPATEN KEBUMEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1133, 1132, 'PERATURAN DAERAH KABUPATEN KEBUMEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1134, 1132, 'PERATURAN BUPATI KABUPATEN KEBUMEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1135, 1119, 'KABUPATEN PURWOREJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1136, 1135, 'PERATURAN DAERAH KABUPATEN PURWOREJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1137, 1135, 'PERATURAN BUPATI KABUPATEN PURWOREJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1138, 1119, 'KABUPATEN WONOSOBO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1139, 1138, 'PERATURAN DAERAH KABUPATEN WONOSOBO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1140, 1138, 'PERATURAN BUPATI KABUPATEN WONOSOBO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1141, 1119, 'KABUPATEN MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1142, 1141, 'PERATURAN DAERAH KABUPATEN MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1143, 1141, 'PERATURAN BUPATI KABUPATEN MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1144, 1119, 'KABUPATEN BOYOLALI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1145, 1144, 'PERATURAN DAERAH KABUPATEN BOYOLALI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1146, 1144, 'PERATURAN BUPATI KABUPATEN BOYOLALI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1147, 1119, 'KABUPATEN KLATEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1148, 1147, 'PERATURAN DAERAH KABUPATEN KLATEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1149, 1147, 'PERATURAN BUPATI KABUPATEN KLATEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1150, 1119, 'KABUPATEN SUKOHARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1151, 1150, 'PERATURAN DAERAH KABUPATEN SUKOHARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1152, 1150, 'PERATURAN BUPATI KABUPATEN SUKOHARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1153, 1119, 'KABUPATEN WONOGIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1154, 1153, 'PERATURAN DAERAH KABUPATEN WONOGIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1155, 1153, 'PERATURAN BUPATI KABUPATEN WONOGIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1156, 1119, 'KABUPATEN KARANGANYAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1157, 1156, 'PERATURAN DAERAH KABUPATEN KARANGANYAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1158, 1156, 'PERATURAN BUPATI KABUPATEN KARANGANYAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1159, 1119, 'KABUPATEN SRAGEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1160, 1159, 'PERATURAN DAERAH KABUPATEN SRAGEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1161, 1159, 'PERATURAN BUPATI KABUPATEN SRAGEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1162, 1119, 'KABUPATEN GROBOGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1163, 1162, 'PERATURAN DAERAH KABUPATEN GROBOGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1164, 1162, 'PERATURAN BUPATI KABUPATEN GROBOGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1165, 1119, 'KABUPATEN BLORA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1166, 1165, 'PERATURAN DAERAH KABUPATEN BLORA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1167, 1165, 'PERATURAN BUPATI KABUPATEN BLORA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1168, 1119, 'KABUPATEN REMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1169, 1168, 'PERATURAN DAERAH KABUPATEN REMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1170, 1168, 'PERATURAN BUPATI KABUPATEN REMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1171, 1119, 'KABUPATEN PATI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1172, 1171, 'PERATURAN DAERAH KABUPATEN PATI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1173, 1171, 'PERATURAN BUPATI KABUPATEN PATI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1174, 1119, 'KABUPATEN KUDUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1175, 1174, 'PERATURAN DAERAH KABUPATEN KUDUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1176, 1174, 'PERATURAN BUPATI KABUPATEN KUDUS', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1177, 1119, 'KABUPATEN JEPARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1178, 1177, 'PERATURAN DAERAH KABUPATEN JEPARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1179, 1177, 'PERATURAN BUPATI KABUPATEN JEPARA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1180, 1119, 'KABUPATEN DEMAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1181, 1180, 'PERATURAN DAERAH KABUPATEN DEMAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1182, 1180, 'PERATURAN BUPATI KABUPATEN DEMAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1183, 1119, 'KABUPATEN SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1184, 1183, 'PERATURAN DAERAH KABUPATEN SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1185, 1183, 'PERATURAN BUPATI KABUPATEN SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1186, 1119, 'KABUPATEN TEMANGGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1187, 1186, 'PERATURAN DAERAH KABUPATEN TEMANGGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1188, 1186, 'PERATURAN BUPATI KABUPATEN TEMANGGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1189, 1119, 'KABUPATEN KENDAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1190, 1189, 'PERATURAN DAERAH KABUPATEN KENDAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1191, 1189, 'PERATURAN BUPATI KABUPATEN KENDAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1192, 1119, 'KABUPATEN BATANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1193, 1192, 'PERATURAN DAERAH KABUPATEN BATANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1194, 1192, 'PERATURAN BUPATI KABUPATEN BATANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1195, 1119, 'KABUPATEN PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1196, 1195, 'PERATURAN DAERAH KABUPATEN PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1197, 1195, 'PERATURAN BUPATI KABUPATEN PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1198, 1119, 'KABUPATEN PEMALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1199, 1198, 'PERATURAN DAERAH KABUPATEN PEMALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1200, 1198, 'PERATURAN BUPATI KABUPATEN PEMALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1201, 1119, 'KABUPATEN TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1202, 1201, 'PERATURAN DAERAH KABUPATEN TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1203, 1201, 'PERATURAN BUPATI KABUPATEN TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1204, 1119, 'KABUPATEN BREBES', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1205, 1204, 'PERATURAN DAERAH KABUPATEN BREBES', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1206, 1204, 'PERATURAN BUPATI KABUPATEN BREBES', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1207, 1119, 'KOTA MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1208, 1207, 'PERATURAN DAERAH KOTA MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1209, 1207, 'PERATURAN WALIKOTA MAGELANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1210, 1119, 'KOTA SURAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1211, 1210, 'PERATURAN DAERAH KOTA SURAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1212, 1210, 'PERATURAN WALIKOTA SURAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1213, 1119, 'KOTA SALATIGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1214, 1213, 'PERATURAN DAERAH KOTA SALATIGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1215, 1213, 'PERATURAN WALIKOTA SALATIGA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1216, 1119, 'KOTA SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1217, 1216, 'PERATURAN DAERAH KOTA SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1218, 1216, 'PERATURAN WALIKOTA SEMARANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1219, 1119, 'KOTA PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1220, 1219, 'PERATURAN DAERAH KOTA PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1221, 1219, 'PERATURAN WALIKOTA PEKALONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1222, 1119, 'KOTA TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1223, 1222, 'PERATURAN DAERAH KOTA TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1224, 1222, 'PERATURAN WALIKOTA TEGAL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1225, 1119, 'PROVINSI JAWA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1226, 1225, 'PERATURAN DAERAH PROVINSI JAWA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1227, 1225, 'PERATURAN GUBERNUR PROVINSI JAWA TENGAH', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1228, 108, 'DI YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1229, 1228, 'KABUPATEN KULON PROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1230, 1229, 'PERATURAN DAERAH KABUPATEN KULON PROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1231, 1229, 'PERATURAN BUPATI KABUPATEN KULON PROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1232, 1228, 'KABUPATEN BANTUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1233, 1232, 'PERATURAN DAERAH KABUPATEN BANTUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1234, 1232, 'PERATURAN BUPATI KABUPATEN BANTUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1235, 1228, 'KABUPATEN GUNUNG KIDUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1236, 1235, 'PERATURAN DAERAH KABUPATEN GUNUNG KIDUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1237, 1235, 'PERATURAN BUPATI KABUPATEN GUNUNG KIDUL', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1238, 1228, 'KABUPATEN SLEMAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1239, 1238, 'PERATURAN DAERAH KABUPATEN SLEMAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1240, 1238, 'PERATURAN BUPATI KABUPATEN SLEMAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1241, 1228, 'KOTA YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1242, 1241, 'PERATURAN DAERAH KOTA YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1243, 1241, 'PERATURAN WALIKOTA YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1244, 1228, 'PROVINSI DI YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1245, 1244, 'PERATURAN DAERAH PROVINSI DI YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1246, 1244, 'PERATURAN GUBERNUR PROVINSI DI YOGYAKARTA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1247, 108, 'JAWA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1248, 1247, 'KABUPATEN PACITAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1249, 1248, 'PERATURAN DAERAH KABUPATEN PACITAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1250, 1248, 'PERATURAN BUPATI KABUPATEN PACITAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1251, 1247, 'KABUPATEN PONOROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1252, 1251, 'PERATURAN DAERAH KABUPATEN PONOROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1253, 1251, 'PERATURAN BUPATI KABUPATEN PONOROGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1254, 1247, 'KABUPATEN TRENGGALEK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1255, 1254, 'PERATURAN DAERAH KABUPATEN TRENGGALEK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1256, 1254, 'PERATURAN BUPATI KABUPATEN TRENGGALEK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1257, 1247, 'KABUPATEN TULUNGAGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1258, 1257, 'PERATURAN DAERAH KABUPATEN TULUNGAGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1259, 1257, 'PERATURAN BUPATI KABUPATEN TULUNGAGUNG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1260, 1247, 'KABUPATEN BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1261, 1260, 'PERATURAN DAERAH KABUPATEN BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1262, 1260, 'PERATURAN BUPATI KABUPATEN BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1263, 1247, 'KABUPATEN KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1264, 1263, 'PERATURAN DAERAH KABUPATEN KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1265, 1263, 'PERATURAN BUPATI KABUPATEN KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1266, 1247, 'KABUPATEN MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1267, 1266, 'PERATURAN DAERAH KABUPATEN MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1268, 1266, 'PERATURAN BUPATI KABUPATEN MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1269, 1247, 'KABUPATEN LUMAJANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1270, 1269, 'PERATURAN DAERAH KABUPATEN LUMAJANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1271, 1269, 'PERATURAN BUPATI KABUPATEN LUMAJANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1272, 1247, 'KABUPATEN JEMBER', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1273, 1272, 'PERATURAN DAERAH KABUPATEN JEMBER', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1274, 1272, 'PERATURAN BUPATI KABUPATEN JEMBER', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1275, 1247, 'KABUPATEN BANYUWANGI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1276, 1275, 'PERATURAN DAERAH KABUPATEN BANYUWANGI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1277, 1275, 'PERATURAN BUPATI KABUPATEN BANYUWANGI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1278, 1247, 'KABUPATEN BONDOWOSO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1279, 1278, 'PERATURAN DAERAH KABUPATEN BONDOWOSO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1280, 1278, 'PERATURAN BUPATI KABUPATEN BONDOWOSO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1281, 1247, 'KABUPATEN SITUBONDO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1282, 1281, 'PERATURAN DAERAH KABUPATEN SITUBONDO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1283, 1281, 'PERATURAN BUPATI KABUPATEN SITUBONDO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1284, 1247, 'KABUPATEN PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1285, 1284, 'PERATURAN DAERAH KABUPATEN PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1286, 1284, 'PERATURAN BUPATI KABUPATEN PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1287, 1247, 'KABUPATEN PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1288, 1287, 'PERATURAN DAERAH KABUPATEN PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1289, 1287, 'PERATURAN BUPATI KABUPATEN PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1290, 1247, 'KABUPATEN SIDOARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1291, 1290, 'PERATURAN DAERAH KABUPATEN SIDOARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1292, 1290, 'PERATURAN BUPATI KABUPATEN SIDOARJO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1293, 1247, 'KABUPATEN MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1294, 1293, 'PERATURAN DAERAH KABUPATEN MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1295, 1293, 'PERATURAN BUPATI KABUPATEN MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1296, 1247, 'KABUPATEN JOMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1297, 1296, 'PERATURAN DAERAH KABUPATEN JOMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1298, 1296, 'PERATURAN BUPATI KABUPATEN JOMBANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1299, 1247, 'KABUPATEN NGANJUK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1300, 1299, 'PERATURAN DAERAH KABUPATEN NGANJUK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1301, 1299, 'PERATURAN BUPATI KABUPATEN NGANJUK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1302, 1247, 'KABUPATEN MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1303, 1302, 'PERATURAN DAERAH KABUPATEN MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1304, 1302, 'PERATURAN BUPATI KABUPATEN MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1305, 1247, 'KABUPATEN MAGETAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1306, 1305, 'PERATURAN DAERAH KABUPATEN MAGETAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1307, 1305, 'PERATURAN BUPATI KABUPATEN MAGETAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1308, 1247, 'KABUPATEN NGAWI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1309, 1308, 'PERATURAN DAERAH KABUPATEN NGAWI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1310, 1308, 'PERATURAN BUPATI KABUPATEN NGAWI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1311, 1247, 'KABUPATEN BOJONEGORO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1312, 1311, 'PERATURAN DAERAH KABUPATEN BOJONEGORO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1313, 1311, 'PERATURAN BUPATI KABUPATEN BOJONEGORO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1314, 1247, 'KABUPATEN TUBAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1315, 1314, 'PERATURAN DAERAH KABUPATEN TUBAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1316, 1314, 'PERATURAN BUPATI KABUPATEN TUBAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1317, 1247, 'KABUPATEN LAMONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1318, 1317, 'PERATURAN DAERAH KABUPATEN LAMONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1319, 1317, 'PERATURAN BUPATI KABUPATEN LAMONGAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1320, 1247, 'KABUPATEN GRESIK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1321, 1320, 'PERATURAN DAERAH KABUPATEN GRESIK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1322, 1320, 'PERATURAN BUPATI KABUPATEN GRESIK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1323, 1247, 'KABUPATEN BANGKALAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1324, 1323, 'PERATURAN DAERAH KABUPATEN BANGKALAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1325, 1323, 'PERATURAN BUPATI KABUPATEN BANGKALAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1326, 1247, 'KABUPATEN SAMPANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1327, 1326, 'PERATURAN DAERAH KABUPATEN SAMPANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1328, 1326, 'PERATURAN BUPATI KABUPATEN SAMPANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1329, 1247, 'KABUPATEN PAMEKASAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1330, 1329, 'PERATURAN DAERAH KABUPATEN PAMEKASAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1331, 1329, 'PERATURAN BUPATI KABUPATEN PAMEKASAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1332, 1247, 'KABUPATEN SUMENEP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1333, 1332, 'PERATURAN DAERAH KABUPATEN SUMENEP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1334, 1332, 'PERATURAN BUPATI KABUPATEN SUMENEP', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1335, 1247, 'KOTA KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1336, 1335, 'PERATURAN DAERAH KOTA KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1337, 1335, 'PERATURAN WALIKOTA KEDIRI', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1338, 1247, 'KOTA BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1339, 1338, 'PERATURAN DAERAH KOTA BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1340, 1338, 'PERATURAN WALIKOTA BLITAR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1341, 1247, 'KOTA MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1342, 1341, 'PERATURAN DAERAH KOTA MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1343, 1341, 'PERATURAN WALIKOTA MALANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1344, 1247, 'KOTA PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1345, 1344, 'PERATURAN DAERAH KOTA PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1346, 1344, 'PERATURAN WALIKOTA PROBOLINGGO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1347, 1247, 'KOTA PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1348, 1347, 'PERATURAN DAERAH KOTA PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1349, 1347, 'PERATURAN WALIKOTA PASURUAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1350, 1247, 'KOTA MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1351, 1350, 'PERATURAN DAERAH KOTA MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1352, 1350, 'PERATURAN WALIKOTA MOJOKERTO', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1353, 1247, 'KOTA MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1354, 1353, 'PERATURAN DAERAH KOTA MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1355, 1353, 'PERATURAN WALIKOTA MADIUN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1356, 1247, 'KOTA SURABAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1357, 1356, 'PERATURAN DAERAH KOTA SURABAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1358, 1356, 'PERATURAN WALIKOTA SURABAYA', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1359, 1247, 'KOTA BATU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1360, 1359, 'PERATURAN DAERAH KOTA BATU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1361, 1359, 'PERATURAN WALIKOTA BATU', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1362, 1247, 'PROVINSI JAWA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1363, 1362, 'PERATURAN DAERAH PROVINSI JAWA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1364, 1362, 'PERATURAN GUBERNUR PROVINSI JAWA TIMUR', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1365, 108, 'BANTEN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1366, 1365, 'KABUPATEN PANDEGLANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1367, 1366, 'PERATURAN DAERAH KABUPATEN PANDEGLANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1368, 1366, 'PERATURAN BUPATI KABUPATEN PANDEGLANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1369, 1365, 'KABUPATEN LEBAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1370, 1369, 'PERATURAN DAERAH KABUPATEN LEBAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1371, 1369, 'PERATURAN BUPATI KABUPATEN LEBAK', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1372, 1365, 'KABUPATEN TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1373, 1372, 'PERATURAN DAERAH KABUPATEN TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1374, 1372, 'PERATURAN BUPATI KABUPATEN TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1375, 1365, 'KABUPATEN SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1376, 1375, 'PERATURAN DAERAH KABUPATEN SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1377, 1375, 'PERATURAN BUPATI KABUPATEN SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1378, 1365, 'KOTA TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1379, 1378, 'PERATURAN DAERAH KOTA TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1380, 1378, 'PERATURAN WALIKOTA TANGERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1381, 1365, 'KOTA CILEGON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1382, 1381, 'PERATURAN DAERAH KOTA CILEGON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1383, 1381, 'PERATURAN WALIKOTA CILEGON', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1384, 1365, 'KOTA SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1385, 1384, 'PERATURAN DAERAH KOTA SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1386, 1384, 'PERATURAN WALIKOTA SERANG', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1387, 1365, 'KOTA TANGERANG SELATAN', '1', '1', '1', '2018-10-10 12:46:47', '2018-10-10 12:46:47'),
(1388, 1387, 'PERATURAN DAERAH KOTA TANGERANG SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1389, 1387, 'PERATURAN WALIKOTA TANGERANG SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1390, 1365, 'PROVINSI BANTEN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1391, 1390, 'PERATURAN DAERAH PROVINSI BANTEN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1392, 1390, 'PERATURAN GUBERNUR PROVINSI BANTEN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1393, 108, 'BALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1394, 1393, 'KABUPATEN JEMBRANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1395, 1394, 'PERATURAN DAERAH KABUPATEN JEMBRANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1396, 1394, 'PERATURAN BUPATI KABUPATEN JEMBRANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1397, 1393, 'KABUPATEN TABANAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1398, 1397, 'PERATURAN DAERAH KABUPATEN TABANAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1399, 1397, 'PERATURAN BUPATI KABUPATEN TABANAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1400, 1393, 'KABUPATEN BADUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1401, 1400, 'PERATURAN DAERAH KABUPATEN BADUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1402, 1400, 'PERATURAN BUPATI KABUPATEN BADUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1403, 1393, 'KABUPATEN GIANYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1404, 1403, 'PERATURAN DAERAH KABUPATEN GIANYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1405, 1403, 'PERATURAN BUPATI KABUPATEN GIANYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1406, 1393, 'KABUPATEN KLUNGKUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1407, 1406, 'PERATURAN DAERAH KABUPATEN KLUNGKUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1408, 1406, 'PERATURAN BUPATI KABUPATEN KLUNGKUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1409, 1393, 'KABUPATEN BANGLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1410, 1409, 'PERATURAN DAERAH KABUPATEN BANGLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1411, 1409, 'PERATURAN BUPATI KABUPATEN BANGLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1412, 1393, 'KABUPATEN KARANGASEM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1413, 1412, 'PERATURAN DAERAH KABUPATEN KARANGASEM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1414, 1412, 'PERATURAN BUPATI KABUPATEN KARANGASEM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1415, 1393, 'KABUPATEN BULELENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1416, 1415, 'PERATURAN DAERAH KABUPATEN BULELENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1417, 1415, 'PERATURAN BUPATI KABUPATEN BULELENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1418, 1393, 'KOTA DENPASAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1419, 1418, 'PERATURAN DAERAH KOTA DENPASAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1420, 1418, 'PERATURAN WALIKOTA DENPASAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1421, 1393, 'PROVINSI BALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1422, 1421, 'PERATURAN DAERAH PROVINSI BALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1423, 1421, 'PERATURAN GUBERNUR PROVINSI BALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1424, 108, 'NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1425, 1424, 'KABUPATEN LOMBOK BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1426, 1425, 'PERATURAN DAERAH KABUPATEN LOMBOK BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1427, 1425, 'PERATURAN BUPATI KABUPATEN LOMBOK BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1428, 1424, 'KABUPATEN LOMBOK TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1429, 1428, 'PERATURAN DAERAH KABUPATEN LOMBOK TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1430, 1428, 'PERATURAN BUPATI KABUPATEN LOMBOK TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1431, 1424, 'KABUPATEN LOMBOK TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1432, 1431, 'PERATURAN DAERAH KABUPATEN LOMBOK TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1433, 1431, 'PERATURAN BUPATI KABUPATEN LOMBOK TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1434, 1424, 'KABUPATEN SUMBAWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1435, 1434, 'PERATURAN DAERAH KABUPATEN SUMBAWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1436, 1434, 'PERATURAN BUPATI KABUPATEN SUMBAWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1437, 1424, 'KABUPATEN DOMPU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1438, 1437, 'PERATURAN DAERAH KABUPATEN DOMPU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1439, 1437, 'PERATURAN BUPATI KABUPATEN DOMPU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1440, 1424, 'KABUPATEN BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1441, 1440, 'PERATURAN DAERAH KABUPATEN BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1442, 1440, 'PERATURAN BUPATI KABUPATEN BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1443, 1424, 'KABUPATEN SUMBAWA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1444, 1443, 'PERATURAN DAERAH KABUPATEN SUMBAWA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1445, 1443, 'PERATURAN BUPATI KABUPATEN SUMBAWA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1446, 1424, 'KABUPATEN LOMBOK UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1447, 1446, 'PERATURAN DAERAH KABUPATEN LOMBOK UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1448, 1446, 'PERATURAN BUPATI KABUPATEN LOMBOK UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1449, 1424, 'KOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1450, 1449, 'PERATURAN DAERAH KOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1451, 1449, 'PERATURAN WALIKOTA MATARAM', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1452, 1424, 'KOTA BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1453, 1452, 'PERATURAN DAERAH KOTA BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1454, 1452, 'PERATURAN WALIKOTA BIMA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48');
INSERT INTO `document_type` (`id`, `parent_id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1455, 1424, 'PROVINSI NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1456, 1455, 'PERATURAN DAERAH PROVINSI NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1457, 1455, 'PERATURAN GUBERNUR PROVINSI NUSA TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1458, 108, 'NUSA TENGGARA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1459, 1458, 'KABUPATEN KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1460, 1459, 'PERATURAN DAERAH KABUPATEN KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1461, 1459, 'PERATURAN BUPATI KABUPATEN KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1462, 1458, 'KABUPATEN TIMOR TENGAH SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1463, 1462, 'PERATURAN DAERAH KABUPATEN TIMOR TENGAH SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1464, 1462, 'PERATURAN BUPATI KABUPATEN TIMOR TENGAH SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1465, 1458, 'KABUPATEN TIMOR TENGAH UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1466, 1465, 'PERATURAN DAERAH KABUPATEN TIMOR TENGAH UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1467, 1465, 'PERATURAN BUPATI KABUPATEN TIMOR TENGAH UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1468, 1458, 'KABUPATEN BELU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1469, 1468, 'PERATURAN DAERAH KABUPATEN BELU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1470, 1468, 'PERATURAN BUPATI KABUPATEN BELU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1471, 1458, 'KABUPATEN ALOR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1472, 1471, 'PERATURAN DAERAH KABUPATEN ALOR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1473, 1471, 'PERATURAN BUPATI KABUPATEN ALOR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1474, 1458, 'KABUPATEN FLORES TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1475, 1474, 'PERATURAN DAERAH KABUPATEN FLORES TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1476, 1474, 'PERATURAN BUPATI KABUPATEN FLORES TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1477, 1458, 'KABUPATEN SIKKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1478, 1477, 'PERATURAN DAERAH KABUPATEN SIKKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1479, 1477, 'PERATURAN BUPATI KABUPATEN SIKKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1480, 1458, 'KABUPATEN ENDE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1481, 1480, 'PERATURAN DAERAH KABUPATEN ENDE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1482, 1480, 'PERATURAN BUPATI KABUPATEN ENDE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1483, 1458, 'KABUPATEN NGADA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1484, 1483, 'PERATURAN DAERAH KABUPATEN NGADA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1485, 1483, 'PERATURAN BUPATI KABUPATEN NGADA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1486, 1458, 'KABUPATEN MANGGARAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1487, 1486, 'PERATURAN DAERAH KABUPATEN MANGGARAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1488, 1486, 'PERATURAN BUPATI KABUPATEN MANGGARAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1489, 1458, 'KABUPATEN SUMBA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1490, 1489, 'PERATURAN DAERAH KABUPATEN SUMBA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1491, 1489, 'PERATURAN BUPATI KABUPATEN SUMBA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1492, 1458, 'KABUPATEN SUMBA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1493, 1492, 'PERATURAN DAERAH KABUPATEN SUMBA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1494, 1492, 'PERATURAN BUPATI KABUPATEN SUMBA BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1495, 1458, 'KABUPATEN LEMBATA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1496, 1495, 'PERATURAN DAERAH KABUPATEN LEMBATA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1497, 1495, 'PERATURAN BUPATI KABUPATEN LEMBATA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1498, 1458, 'KABUPATEN ROTE NDAO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1499, 1498, 'PERATURAN DAERAH KABUPATEN ROTE NDAO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1500, 1498, 'PERATURAN BUPATI KABUPATEN ROTE NDAO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1501, 1458, 'KABUPATEN MANGGARAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1502, 1501, 'PERATURAN DAERAH KABUPATEN MANGGARAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1503, 1501, 'PERATURAN BUPATI KABUPATEN MANGGARAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1504, 1458, 'KABUPATEN NAGEKEO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1505, 1504, 'PERATURAN DAERAH KABUPATEN NAGEKEO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1506, 1504, 'PERATURAN BUPATI KABUPATEN NAGEKEO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1507, 1458, 'KABUPATEN SUMBA TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1508, 1507, 'PERATURAN DAERAH KABUPATEN SUMBA TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1509, 1507, 'PERATURAN BUPATI KABUPATEN SUMBA TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1510, 1458, 'KABUPATEN SUMBA BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1511, 1510, 'PERATURAN DAERAH KABUPATEN SUMBA BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1512, 1510, 'PERATURAN BUPATI KABUPATEN SUMBA BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1513, 1458, 'KABUPATEN MANGGARAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1514, 1513, 'PERATURAN DAERAH KABUPATEN MANGGARAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1515, 1513, 'PERATURAN BUPATI KABUPATEN MANGGARAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1516, 1458, 'KABUPATEN SABU RAIJUA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1517, 1516, 'PERATURAN DAERAH KABUPATEN SABU RAIJUA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1518, 1516, 'PERATURAN BUPATI KABUPATEN SABU RAIJUA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1519, 1458, 'KOTA KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1520, 1519, 'PERATURAN DAERAH KOTA KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1521, 1519, 'PERATURAN WALIKOTA KUPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1522, 1458, 'PROVINSI NUSA TENGGARA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1523, 1522, 'PERATURAN DAERAH PROVINSI NUSA TENGGARA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1524, 1522, 'PERATURAN GUBERNUR PROVINSI NUSA TENGGARA TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1525, 108, 'KALIMANTAN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1526, 1525, 'KABUPATEN SAMBAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1527, 1526, 'PERATURAN DAERAH KABUPATEN SAMBAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1528, 1526, 'PERATURAN BUPATI KABUPATEN SAMBAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1529, 1525, 'KABUPATEN PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1530, 1529, 'PERATURAN DAERAH KABUPATEN PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1531, 1529, 'PERATURAN BUPATI KABUPATEN PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1532, 1525, 'KABUPATEN SANGGAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1533, 1532, 'PERATURAN DAERAH KABUPATEN SANGGAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1534, 1532, 'PERATURAN BUPATI KABUPATEN SANGGAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1535, 1525, 'KABUPATEN KETAPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1536, 1535, 'PERATURAN DAERAH KABUPATEN KETAPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1537, 1535, 'PERATURAN BUPATI KABUPATEN KETAPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1538, 1525, 'KABUPATEN SINTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1539, 1538, 'PERATURAN DAERAH KABUPATEN SINTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1540, 1538, 'PERATURAN BUPATI KABUPATEN SINTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1541, 1525, 'KABUPATEN KAPUAS HULU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1542, 1541, 'PERATURAN DAERAH KABUPATEN KAPUAS HULU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1543, 1541, 'PERATURAN BUPATI KABUPATEN KAPUAS HULU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1544, 1525, 'KABUPATEN BENGKAYANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1545, 1544, 'PERATURAN DAERAH KABUPATEN BENGKAYANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1546, 1544, 'PERATURAN BUPATI KABUPATEN BENGKAYANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1547, 1525, 'KABUPATEN LANDAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1548, 1547, 'PERATURAN DAERAH KABUPATEN LANDAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1549, 1547, 'PERATURAN BUPATI KABUPATEN LANDAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1550, 1525, 'KABUPATEN SEKADAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1551, 1550, 'PERATURAN DAERAH KABUPATEN SEKADAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1552, 1550, 'PERATURAN BUPATI KABUPATEN SEKADAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1553, 1525, 'KABUPATEN MELAWI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1554, 1553, 'PERATURAN DAERAH KABUPATEN MELAWI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1555, 1553, 'PERATURAN BUPATI KABUPATEN MELAWI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1556, 1525, 'KABUPATEN KAYONG UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1557, 1556, 'PERATURAN DAERAH KABUPATEN KAYONG UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1558, 1556, 'PERATURAN BUPATI KABUPATEN KAYONG UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1559, 1525, 'KABUPATEN KUBU RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1560, 1559, 'PERATURAN DAERAH KABUPATEN KUBU RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1561, 1559, 'PERATURAN BUPATI KABUPATEN KUBU RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1562, 1525, 'KOTA PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1563, 1562, 'PERATURAN DAERAH KOTA PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1564, 1562, 'PERATURAN WALIKOTA PONTIANAK', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1565, 1525, 'KOTA SINGKAWANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1566, 1565, 'PERATURAN DAERAH KOTA SINGKAWANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1567, 1565, 'PERATURAN WALIKOTA SINGKAWANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1568, 1525, 'PROVINSI KALIMANTAN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1569, 1568, 'PERATURAN DAERAH PROVINSI KALIMANTAN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1570, 1568, 'PERATURAN GUBERNUR PROVINSI KALIMANTAN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1571, 108, 'KALIMANTAN TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1572, 1571, 'KABUPATEN KOTAWARINGIN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1573, 1572, 'PERATURAN DAERAH KABUPATEN KOTAWARINGIN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1574, 1572, 'PERATURAN BUPATI KABUPATEN KOTAWARINGIN BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1575, 1571, 'KABUPATEN KOTAWARINGIN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1576, 1575, 'PERATURAN DAERAH KABUPATEN KOTAWARINGIN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1577, 1575, 'PERATURAN BUPATI KABUPATEN KOTAWARINGIN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1578, 1571, 'KABUPATEN KAPUAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1579, 1578, 'PERATURAN DAERAH KABUPATEN KAPUAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1580, 1578, 'PERATURAN BUPATI KABUPATEN KAPUAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1581, 1571, 'KABUPATEN BARITO SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1582, 1581, 'PERATURAN DAERAH KABUPATEN BARITO SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1583, 1581, 'PERATURAN BUPATI KABUPATEN BARITO SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1584, 1571, 'KABUPATEN BARITO UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1585, 1584, 'PERATURAN DAERAH KABUPATEN BARITO UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1586, 1584, 'PERATURAN BUPATI KABUPATEN BARITO UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1587, 1571, 'KABUPATEN KATINGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1588, 1587, 'PERATURAN DAERAH KABUPATEN KATINGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1589, 1587, 'PERATURAN BUPATI KABUPATEN KATINGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1590, 1571, 'KABUPATEN SERUYAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1591, 1590, 'PERATURAN DAERAH KABUPATEN SERUYAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1592, 1590, 'PERATURAN BUPATI KABUPATEN SERUYAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1593, 1571, 'KABUPATEN SUKAMARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1594, 1593, 'PERATURAN DAERAH KABUPATEN SUKAMARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1595, 1593, 'PERATURAN BUPATI KABUPATEN SUKAMARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1596, 1571, 'KABUPATEN LAMANDAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1597, 1596, 'PERATURAN DAERAH KABUPATEN LAMANDAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1598, 1596, 'PERATURAN BUPATI KABUPATEN LAMANDAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1599, 1571, 'KABUPATEN GUNUNG MAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1600, 1599, 'PERATURAN DAERAH KABUPATEN GUNUNG MAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1601, 1599, 'PERATURAN BUPATI KABUPATEN GUNUNG MAS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1602, 1571, 'KABUPATEN PULANG PISAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1603, 1602, 'PERATURAN DAERAH KABUPATEN PULANG PISAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1604, 1602, 'PERATURAN BUPATI KABUPATEN PULANG PISAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1605, 1571, 'KABUPATEN MURUNG RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1606, 1605, 'PERATURAN DAERAH KABUPATEN MURUNG RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1607, 1605, 'PERATURAN BUPATI KABUPATEN MURUNG RAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1608, 1571, 'KABUPATEN BARITO TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1609, 1608, 'PERATURAN DAERAH KABUPATEN BARITO TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1610, 1608, 'PERATURAN BUPATI KABUPATEN BARITO TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1611, 1571, 'KOTA PALANGKARAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1612, 1611, 'PERATURAN DAERAH KOTA PALANGKARAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1613, 1611, 'PERATURAN WALIKOTA PALANGKARAYA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1614, 1571, 'PROVINSI KALIMANTAN TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1615, 1614, 'PERATURAN DAERAH PROVINSI KALIMANTAN TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1616, 1614, 'PERATURAN GUBERNUR PROVINSI KALIMANTAN TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1617, 108, 'KALIMANTAN SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1618, 1617, 'KABUPATEN TANAH LAUT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1619, 1618, 'PERATURAN DAERAH KABUPATEN TANAH LAUT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1620, 1618, 'PERATURAN BUPATI KABUPATEN TANAH LAUT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1621, 1617, 'KABUPATEN KOTABARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1622, 1621, 'PERATURAN DAERAH KABUPATEN KOTABARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1623, 1621, 'PERATURAN BUPATI KABUPATEN KOTABARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1624, 1617, 'KABUPATEN BANJAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1625, 1624, 'PERATURAN DAERAH KABUPATEN BANJAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1626, 1624, 'PERATURAN BUPATI KABUPATEN BANJAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1627, 1617, 'KABUPATEN BARITO KUALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1628, 1627, 'PERATURAN DAERAH KABUPATEN BARITO KUALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1629, 1627, 'PERATURAN BUPATI KABUPATEN BARITO KUALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1630, 1617, 'KABUPATEN TAPIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1631, 1630, 'PERATURAN DAERAH KABUPATEN TAPIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1632, 1630, 'PERATURAN BUPATI KABUPATEN TAPIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1633, 1617, 'KABUPATEN HULU SUNGAI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1634, 1633, 'PERATURAN DAERAH KABUPATEN HULU SUNGAI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1635, 1633, 'PERATURAN BUPATI KABUPATEN HULU SUNGAI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1636, 1617, 'KABUPATEN HULU SUNGAI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1637, 1636, 'PERATURAN DAERAH KABUPATEN HULU SUNGAI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1638, 1636, 'PERATURAN BUPATI KABUPATEN HULU SUNGAI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1639, 1617, 'KABUPATEN HULU SUNGAI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1640, 1639, 'PERATURAN DAERAH KABUPATEN HULU SUNGAI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1641, 1639, 'PERATURAN BUPATI KABUPATEN HULU SUNGAI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1642, 1617, 'KABUPATEN TABALONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1643, 1642, 'PERATURAN DAERAH KABUPATEN TABALONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1644, 1642, 'PERATURAN BUPATI KABUPATEN TABALONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1645, 1617, 'KABUPATEN TANAH BUMBU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1646, 1645, 'PERATURAN DAERAH KABUPATEN TANAH BUMBU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1647, 1645, 'PERATURAN BUPATI KABUPATEN TANAH BUMBU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1648, 1617, 'KABUPATEN BALANGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1649, 1648, 'PERATURAN DAERAH KABUPATEN BALANGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1650, 1648, 'PERATURAN BUPATI KABUPATEN BALANGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1651, 1617, 'KOTA BANJARMASIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1652, 1651, 'PERATURAN DAERAH KOTA BANJARMASIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1653, 1651, 'PERATURAN WALIKOTA BANJARMASIN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1654, 1617, 'KOTA BANJARBARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1655, 1654, 'PERATURAN DAERAH KOTA BANJARBARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1656, 1654, 'PERATURAN WALIKOTA BANJARBARU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1657, 1617, 'PROVINSI KALIMANTAN SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1658, 1657, 'PERATURAN DAERAH PROVINSI KALIMANTAN SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1659, 1657, 'PERATURAN GUBERNUR PROVINSI KALIMANTAN SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1660, 108, 'KALIMANTAN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1661, 1660, 'KABUPATEN PASER', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1662, 1661, 'PERATURAN DAERAH KABUPATEN PASER', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1663, 1661, 'PERATURAN BUPATI KABUPATEN PASER', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1664, 1660, 'KABUPATEN KUTAI KARTANEGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1665, 1664, 'PERATURAN DAERAH KABUPATEN KUTAI KARTANEGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1666, 1664, 'PERATURAN BUPATI KABUPATEN KUTAI KARTANEGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1667, 1660, 'KABUPATEN BERAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1668, 1667, 'PERATURAN DAERAH KABUPATEN BERAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1669, 1667, 'PERATURAN BUPATI KABUPATEN BERAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1670, 1660, 'KABUPATEN BULUNGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1671, 1670, 'PERATURAN DAERAH KABUPATEN BULUNGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1672, 1670, 'PERATURAN BUPATI KABUPATEN BULUNGAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1673, 1660, 'KABUPATEN NUNUKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1674, 1673, 'PERATURAN DAERAH KABUPATEN NUNUKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1675, 1673, 'PERATURAN BUPATI KABUPATEN NUNUKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1676, 1660, 'KABUPATEN MALINAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1677, 1676, 'PERATURAN DAERAH KABUPATEN MALINAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1678, 1676, 'PERATURAN BUPATI KABUPATEN MALINAU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1679, 1660, 'KABUPATEN KUTAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1680, 1679, 'PERATURAN DAERAH KABUPATEN KUTAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1681, 1679, 'PERATURAN BUPATI KABUPATEN KUTAI BARAT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1682, 1660, 'KABUPATEN KUTAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1683, 1682, 'PERATURAN DAERAH KABUPATEN KUTAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1684, 1682, 'PERATURAN BUPATI KABUPATEN KUTAI TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1685, 1660, 'KABUPATEN PENAJAM PASER UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1686, 1685, 'PERATURAN DAERAH KABUPATEN PENAJAM PASER UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1687, 1685, 'PERATURAN BUPATI KABUPATEN PENAJAM PASER UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1688, 1660, 'KABUPATEN TANA TIDUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1689, 1688, 'PERATURAN DAERAH KABUPATEN TANA TIDUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1690, 1688, 'PERATURAN BUPATI KABUPATEN TANA TIDUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1691, 1660, 'KOTA BALIKPAPAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1692, 1691, 'PERATURAN DAERAH KOTA BALIKPAPAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1693, 1691, 'PERATURAN WALIKOTA BALIKPAPAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1694, 1660, 'KOTA SAMARINDA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1695, 1694, 'PERATURAN DAERAH KOTA SAMARINDA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1696, 1694, 'PERATURAN WALIKOTA SAMARINDA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1697, 1660, 'KOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1698, 1697, 'PERATURAN DAERAH KOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1699, 1697, 'PERATURAN WALIKOTA TARAKAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1700, 1660, 'KOTA BONTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1701, 1700, 'PERATURAN DAERAH KOTA BONTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1702, 1700, 'PERATURAN WALIKOTA BONTANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1703, 1660, 'KABUPATEN MAHAKAM ULU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1704, 1660, 'PROVINSI KALIMANTAN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1705, 1704, 'PERATURAN DAERAH PROVINSI KALIMANTAN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1706, 1704, 'PERATURAN GUBERNUR PROVINSI KALIMANTAN TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1707, 108, 'SULAWESI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1708, 1707, 'KABUPATEN BOLAANG MONGONDOW', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1709, 1708, 'PERATURAN DAERAH KABUPATEN BOLAANG MONGONDOW', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1710, 1708, 'PERATURAN BUPATI KABUPATEN BOLAANG MONGONDOW', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1711, 1707, 'KABUPATEN MINAHASA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1712, 1711, 'PERATURAN DAERAH KABUPATEN MINAHASA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1713, 1711, 'PERATURAN BUPATI KABUPATEN MINAHASA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1714, 1707, 'KABUPATEN KEPULAUAN SANGIHE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1715, 1714, 'PERATURAN DAERAH KABUPATEN KEPULAUAN SANGIHE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1716, 1714, 'PERATURAN BUPATI KABUPATEN KEPULAUAN SANGIHE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1717, 1707, 'TAGULANDANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1718, 1717, 'PERATURAN DAERAH KABUPATEN TAGULANDANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1719, 1717, 'PERATURAN BUPATI KABUPATEN TAGULANDANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1720, 1707, 'KABUPATEN KEPULAUAN TALAUD', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1721, 1720, 'PERATURAN DAERAH KABUPATEN KEPULAUAN TALAUD', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1722, 1720, 'PERATURAN BUPATI KABUPATEN KEPULAUAN TALAUD', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1723, 1707, 'KABUPATEN MINAHASA SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1724, 1723, 'PERATURAN DAERAH KABUPATEN MINAHASA SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1725, 1723, 'PERATURAN BUPATI KABUPATEN MINAHASA SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1726, 1707, 'KABUPATEN MINAHASA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1727, 1726, 'PERATURAN DAERAH KABUPATEN MINAHASA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1728, 1726, 'PERATURAN BUPATI KABUPATEN MINAHASA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1729, 1707, 'KABUPATEN MINAHASA TENGGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1730, 1729, 'PERATURAN DAERAH KABUPATEN MINAHASA TENGGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1731, 1729, 'PERATURAN BUPATI KABUPATEN MINAHASA TENGGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1732, 1707, 'KABUPATEN BOLAANG MONGONDOW UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1733, 1732, 'PERATURAN DAERAH KABUPATEN BOLAANG MONGONDOW UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1734, 1732, 'PERATURAN BUPATI KABUPATEN BOLAANG MONGONDOW UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1735, 1707, 'KABUPATEN KEP. SIAU TAGULANDANG BIARO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1736, 1735, 'PERATURAN DAERAH KABUPATEN KEP. SIAU TAGULANDANG BIARO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1737, 1735, 'PERATURAN BUPATI KABUPATEN KEP. SIAU TAGULANDANG BIARO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1738, 1707, 'KABUPATEN BOLAANG MONGONDOW TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1739, 1738, 'PERATURAN DAERAH KABUPATEN BOLAANG MONGONDOW TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1740, 1738, 'PERATURAN BUPATI KABUPATEN BOLAANG MONGONDOW TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1741, 1707, 'KABUPATEN BOLAANG MONGONDOW SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1742, 1741, 'PERATURAN DAERAH KABUPATEN BOLAANG MONGONDOW SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1743, 1741, 'PERATURAN BUPATI KABUPATEN BOLAANG MONGONDOW SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1744, 1707, 'KOTA MANADO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1745, 1744, 'PERATURAN DAERAH KOTA MANADO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1746, 1744, 'PERATURAN WALIKOTA MANADO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1747, 1707, 'KOTA BITUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1748, 1747, 'PERATURAN DAERAH KOTA BITUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1749, 1747, 'PERATURAN WALIKOTA BITUNG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1750, 1707, 'KOTA TOMOHON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1751, 1750, 'PERATURAN DAERAH KOTA TOMOHON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1752, 1750, 'PERATURAN WALIKOTA TOMOHON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1753, 1707, 'KOTA KOTAMOBAGU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1754, 1753, 'PERATURAN DAERAH KOTA KOTAMOBAGU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1755, 1753, 'PERATURAN WALIKOTA KOTAMOBAGU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1756, 1707, 'PROVINSI SULAWESI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1757, 1756, 'PERATURAN DAERAH PROVINSI SULAWESI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1758, 1756, 'PERATURAN GUBERNUR PROVINSI SULAWESI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1759, 108, 'SULAWESI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1760, 1759, 'KABUPATEN BANGGAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1761, 1760, 'PERATURAN DAERAH KABUPATEN BANGGAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1762, 1760, 'PERATURAN BUPATI KABUPATEN BANGGAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1763, 1759, 'KABUPATEN POSO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1764, 1763, 'PERATURAN DAERAH KABUPATEN POSO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1765, 1763, 'PERATURAN BUPATI KABUPATEN POSO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1766, 1759, 'KABUPATEN DONGGALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1767, 1766, 'PERATURAN DAERAH KABUPATEN DONGGALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1768, 1766, 'PERATURAN BUPATI KABUPATEN DONGGALA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1769, 1759, 'KABUPATEN TOLI TOLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1770, 1769, 'PERATURAN DAERAH KABUPATEN TOLI TOLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1771, 1769, 'PERATURAN BUPATI KABUPATEN TOLI TOLI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1772, 1759, 'KABUPATEN BUOL', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1773, 1772, 'PERATURAN DAERAH KABUPATEN BUOL', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1774, 1772, 'PERATURAN BUPATI KABUPATEN BUOL', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1775, 1759, 'KABUPATEN MOROWALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1776, 1775, 'PERATURAN DAERAH KABUPATEN MOROWALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1777, 1775, 'PERATURAN BUPATI KABUPATEN MOROWALI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1778, 1759, 'KABUPATEN BANGGAI KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1779, 1778, 'PERATURAN DAERAH KABUPATEN BANGGAI KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1780, 1778, 'PERATURAN BUPATI KABUPATEN BANGGAI KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1781, 1759, 'KABUPATEN PARIGI MOUTONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1782, 1781, 'PERATURAN DAERAH KABUPATEN PARIGI MOUTONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1783, 1781, 'PERATURAN BUPATI KABUPATEN PARIGI MOUTONG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1784, 1759, 'KABUPATEN TOJO UNA UNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1785, 1784, 'PERATURAN DAERAH KABUPATEN TOJO UNA UNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1786, 1784, 'PERATURAN BUPATI KABUPATEN TOJO UNA UNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1787, 1759, 'KABUPATEN SIGI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1788, 1787, 'PERATURAN DAERAH KABUPATEN SIGI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1789, 1787, 'PERATURAN BUPATI KABUPATEN SIGI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1790, 1759, 'KOTA PALU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1791, 1790, 'PERATURAN DAERAH KOTA PALU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1792, 1790, 'PERATURAN WALIKOTA PALU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1793, 1759, 'KABUPATEN BANGGAI LAUT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1794, 1759, 'KABUPATEN MOROWALI UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1795, 1759, 'PROVINSI SULAWESI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1796, 1795, 'PERATURAN DAERAH PROVINSI SULAWESI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1797, 1795, 'PERATURAN GUBERNUR PROVINSI SULAWESI TENGAH', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1798, 108, 'SULAWESI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1799, 1798, 'KABUPATEN KEPULAUAN SELAYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1800, 1799, 'PERATURAN DAERAH KABUPATEN KEPULAUAN SELAYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1801, 1799, 'PERATURAN BUPATI KABUPATEN KEPULAUAN SELAYAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1802, 1798, 'KABUPATEN BULUKUMBA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1803, 1802, 'PERATURAN DAERAH KABUPATEN BULUKUMBA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1804, 1802, 'PERATURAN BUPATI KABUPATEN BULUKUMBA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1805, 1798, 'KABUPATEN BANTAENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1806, 1805, 'PERATURAN DAERAH KABUPATEN BANTAENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1807, 1805, 'PERATURAN BUPATI KABUPATEN BANTAENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1808, 1798, 'KABUPATEN JENEPONTO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1809, 1808, 'PERATURAN DAERAH KABUPATEN JENEPONTO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1810, 1808, 'PERATURAN BUPATI KABUPATEN JENEPONTO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1811, 1798, 'KABUPATEN TAKALAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1812, 1811, 'PERATURAN DAERAH KABUPATEN TAKALAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1813, 1811, 'PERATURAN BUPATI KABUPATEN TAKALAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1814, 1798, 'KABUPATEN GOWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1815, 1814, 'PERATURAN DAERAH KABUPATEN GOWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1816, 1814, 'PERATURAN BUPATI KABUPATEN GOWA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1817, 1798, 'KABUPATEN SINJAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1818, 1817, 'PERATURAN DAERAH KABUPATEN SINJAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1819, 1817, 'PERATURAN BUPATI KABUPATEN SINJAI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1820, 1798, 'KABUPATEN BONE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1821, 1820, 'PERATURAN DAERAH KABUPATEN BONE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1822, 1820, 'PERATURAN BUPATI KABUPATEN BONE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1823, 1798, 'KABUPATEN MAROS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1824, 1823, 'PERATURAN DAERAH KABUPATEN MAROS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1825, 1823, 'PERATURAN BUPATI KABUPATEN MAROS', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1826, 1798, 'KABUPATEN PANGKAJENE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1827, 1826, 'PERATURAN DAERAH KABUPATEN PANGKAJENE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1828, 1826, 'PERATURAN BUPATI KABUPATEN PANGKAJENE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1829, 1798, 'KABUPATEN BARRU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1830, 1829, 'PERATURAN DAERAH KABUPATEN BARRU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1831, 1829, 'PERATURAN BUPATI KABUPATEN BARRU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1832, 1798, 'KABUPATEN SOPPENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1833, 1832, 'PERATURAN DAERAH KABUPATEN SOPPENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1834, 1832, 'PERATURAN BUPATI KABUPATEN SOPPENG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1835, 1798, 'KABUPATEN WAJO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1836, 1835, 'PERATURAN DAERAH KABUPATEN WAJO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1837, 1835, 'PERATURAN BUPATI KABUPATEN WAJO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1838, 1798, 'KABUPATEN SIDENRENG RAPPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1839, 1838, 'PERATURAN DAERAH KABUPATEN SIDENRENG RAPPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1840, 1838, 'PERATURAN BUPATI KABUPATEN SIDENRENG RAPPANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1841, 1798, 'KABUPATEN PINRANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1842, 1841, 'PERATURAN DAERAH KABUPATEN PINRANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1843, 1841, 'PERATURAN BUPATI KABUPATEN PINRANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1844, 1798, 'KABUPATEN ENREKANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1845, 1844, 'PERATURAN DAERAH KABUPATEN ENREKANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1846, 1844, 'PERATURAN BUPATI KABUPATEN ENREKANG', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1847, 1798, 'KABUPATEN LUWU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1848, 1847, 'PERATURAN DAERAH KABUPATEN LUWU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1849, 1847, 'PERATURAN BUPATI KABUPATEN LUWU', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1850, 1798, 'KABUPATEN TANA TORAJA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1851, 1850, 'PERATURAN DAERAH KABUPATEN TANA TORAJA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1852, 1850, 'PERATURAN BUPATI KABUPATEN TANA TORAJA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1853, 1798, 'KABUPATEN LUWU UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1854, 1853, 'PERATURAN DAERAH KABUPATEN LUWU UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1855, 1853, 'PERATURAN BUPATI KABUPATEN LUWU UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1856, 1798, 'KABUPATEN LUWU TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1857, 1856, 'PERATURAN DAERAH KABUPATEN LUWU TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1858, 1856, 'PERATURAN BUPATI KABUPATEN LUWU TIMUR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1859, 1798, 'KABUPATEN TORAJA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1860, 1859, 'PERATURAN DAERAH KABUPATEN TORAJA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1861, 1859, 'PERATURAN BUPATI KABUPATEN TORAJA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1862, 1798, 'KOTA MAKASSAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1863, 1862, 'PERATURAN DAERAH KOTA MAKASSAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1864, 1862, 'PERATURAN WALIKOTA MAKASSAR', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1865, 1798, 'KOTA PARE PARE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1866, 1865, 'PERATURAN DAERAH KOTA PARE PARE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1867, 1865, 'PERATURAN WALIKOTA PARE PARE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1868, 1798, 'KOTA PALOPO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1869, 1868, 'PERATURAN DAERAH KOTA PALOPO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1870, 1868, 'PERATURAN WALIKOTA PALOPO', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1871, 1798, 'KABUPATEN BANGGAI LAUT', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1872, 1798, 'PROVINSI SULAWESI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1873, 1872, 'PERATURAN DAERAH PROVINSI SULAWESI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1874, 1872, 'PERATURAN GUBERNUR PROVINSI SULAWESI SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1875, 108, 'SULAWESI TENGGARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1876, 1875, 'KABUPATEN KOLAKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1877, 1876, 'PERATURAN DAERAH KABUPATEN KOLAKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1878, 1876, 'PERATURAN BUPATI KABUPATEN KOLAKA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1879, 1875, 'KABUPATEN KONAWE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1880, 1879, 'PERATURAN DAERAH KABUPATEN KONAWE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1881, 1879, 'PERATURAN BUPATI KABUPATEN KONAWE', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1882, 1875, 'KABUPATEN MUNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1883, 1882, 'PERATURAN DAERAH KABUPATEN MUNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1884, 1882, 'PERATURAN BUPATI KABUPATEN MUNA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1885, 1875, 'KABUPATEN BUTON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1886, 1885, 'PERATURAN DAERAH KABUPATEN BUTON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1887, 1885, 'PERATURAN BUPATI KABUPATEN BUTON', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1888, 1875, 'KABUPATEN KONAWE SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1889, 1888, 'PERATURAN DAERAH KABUPATEN KONAWE SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1890, 1888, 'PERATURAN BUPATI KABUPATEN KONAWE SELATAN', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1891, 1875, 'KABUPATEN BOMBANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1892, 1891, 'PERATURAN DAERAH KABUPATEN BOMBANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1893, 1891, 'PERATURAN BUPATI KABUPATEN BOMBANA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1894, 1875, 'KABUPATEN WAKATOBI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1895, 1894, 'PERATURAN DAERAH KABUPATEN WAKATOBI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1896, 1894, 'PERATURAN BUPATI KABUPATEN WAKATOBI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1897, 1875, 'KABUPATEN KOLAKA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1898, 1897, 'PERATURAN DAERAH KABUPATEN KOLAKA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1899, 1897, 'PERATURAN BUPATI KABUPATEN KOLAKA UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1900, 1875, 'KABUPATEN KONAWE UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1901, 1900, 'PERATURAN DAERAH KABUPATEN KONAWE UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1902, 1900, 'PERATURAN BUPATI KABUPATEN KONAWE UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1903, 1875, 'KABUPATEN BUTON UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1904, 1903, 'PERATURAN DAERAH KABUPATEN BUTON UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1905, 1903, 'PERATURAN BUPATI KABUPATEN BUTON UTARA', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1906, 1875, 'KOTA KENDARI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1907, 1906, 'PERATURAN DAERAH KOTA KENDARI', '1', '1', '1', '2018-10-10 12:46:48', '2018-10-10 12:46:48'),
(1908, 1906, 'PERATURAN WALIKOTA KENDARI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1909, 1875, 'KOTA BAU BAU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1910, 1909, 'PERATURAN DAERAH KOTA BAU BAU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1911, 1909, 'PERATURAN WALIKOTA BAU BAU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1912, 1875, 'KABUPATEN BUTON SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1913, 1875, 'PROVINSI SULAWESI TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1914, 1913, 'PERATURAN DAERAH PROVINSI SULAWESI TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1915, 1913, 'PERATURAN GUBERNUR PROVINSI SULAWESI TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1916, 1875, 'KABUPATEN BUTON TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1917, 1875, 'KABUPATEN KOLAKA TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49');
INSERT INTO `document_type` (`id`, `parent_id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1918, 1875, 'KABUPATEN KONAWE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1919, 1875, 'KABUPATEN MUNA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1920, 108, 'GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1921, 1920, 'KABUPATEN GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1922, 1921, 'PERATURAN DAERAH KABUPATEN GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1923, 1921, 'PERATURAN BUPATI KABUPATEN GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1924, 1920, 'KABUPATEN BOALEMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1925, 1924, 'PERATURAN DAERAH KABUPATEN BOALEMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1926, 1924, 'PERATURAN BUPATI KABUPATEN BOALEMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1927, 1920, 'KABUPATEN BONE BOLANGO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1928, 1927, 'PERATURAN DAERAH KABUPATEN BONE BOLANGO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1929, 1927, 'PERATURAN BUPATI KABUPATEN BONE BOLANGO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1930, 1920, 'KABUPATEN POHUWATO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1931, 1930, 'PERATURAN DAERAH KABUPATEN POHUWATO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1932, 1930, 'PERATURAN BUPATI KABUPATEN POHUWATO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1933, 1920, 'KABUPATEN GORONTALO UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1934, 1933, 'PERATURAN DAERAH KABUPATEN GORONTALO UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1935, 1933, 'PERATURAN BUPATI KABUPATEN GORONTALO UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1936, 1920, 'KOTA GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1937, 1936, 'PERATURAN DAERAH KOTA GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1938, 1936, 'PERATURAN WALIKOTA GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1939, 1920, 'PROVINSI GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1940, 1939, 'PERATURAN DAERAH PROVINSI GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1941, 1939, 'PERATURAN GUBERNUR PROVINSI GORONTALO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1942, 108, 'SULAWESI BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1943, 1942, 'KABUPATEN MAMUJU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1944, 1943, 'PERATURAN DAERAH KABUPATEN MAMUJU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1945, 1943, 'PERATURAN BUPATI KABUPATEN MAMUJU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1946, 1942, 'KABUPATEN MAMUJU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1947, 1946, 'PERATURAN DAERAH KABUPATEN MAMUJU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1948, 1946, 'PERATURAN BUPATI KABUPATEN MAMUJU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1949, 1942, 'KABUPATEN MAMASA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1950, 1949, 'PERATURAN DAERAH KABUPATEN MAMASA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1951, 1949, 'PERATURAN BUPATI KABUPATEN MAMASA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1952, 1942, 'KABUPATEN POLEWALI MANDAR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1953, 1952, 'PERATURAN DAERAH KABUPATEN POLEWALI MANDAR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1954, 1952, 'PERATURAN BUPATI KABUPATEN POLEWALI MANDAR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1955, 1942, 'KABUPATEN MAJENE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1956, 1955, 'PERATURAN DAERAH KABUPATEN MAJENE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1957, 1955, 'PERATURAN BUPATI KABUPATEN MAJENE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1958, 1942, 'KABUPATEN MAMUJU TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1959, 1942, 'PROVINSI SULAWESI BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1960, 1959, 'PERATURAN DAERAH PROVINSI SULAWESI BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1961, 1959, 'PERATURAN GUBERNUR PROVINSI SULAWESI BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1962, 1942, 'KOTA MAMUJU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1963, 108, 'MALUKU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1964, 1963, 'KABUPATEN MALUKU TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1965, 1964, 'PERATURAN DAERAH KABUPATEN MALUKU TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1966, 1964, 'PERATURAN BUPATI KABUPATEN MALUKU TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1967, 1963, 'KABUPATEN MALUKU TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1968, 1967, 'PERATURAN DAERAH KABUPATEN MALUKU TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1969, 1967, 'PERATURAN BUPATI KABUPATEN MALUKU TENGGARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1970, 1963, 'KABUPATEN MALUKU TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1971, 1970, 'PERATURAN DAERAH KABUPATEN MALUKU TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1972, 1970, 'PERATURAN BUPATI KABUPATEN MALUKU TENGGARA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1973, 1963, 'KABUPATEN BURU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1974, 1973, 'PERATURAN DAERAH KABUPATEN BURU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1975, 1973, 'PERATURAN BUPATI KABUPATEN BURU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1976, 1963, 'KABUPATEN SERAM BAGIAN TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1977, 1976, 'PERATURAN DAERAH KABUPATEN SERAM BAGIAN TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1978, 1976, 'PERATURAN BUPATI KABUPATEN SERAM BAGIAN TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1979, 1963, 'KABUPATEN SERAM BAGIAN BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1980, 1979, 'PERATURAN DAERAH KABUPATEN SERAM BAGIAN BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1981, 1979, 'PERATURAN BUPATI KABUPATEN SERAM BAGIAN BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1982, 1963, 'KABUPATEN KEPULAUAN ARU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1983, 1982, 'PERATURAN DAERAH KABUPATEN KEPULAUAN ARU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1984, 1982, 'PERATURAN BUPATI KABUPATEN KEPULAUAN ARU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1985, 1963, 'KABUPATEN MALUKU BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1986, 1985, 'PERATURAN DAERAH KABUPATEN MALUKU BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1987, 1985, 'PERATURAN BUPATI KABUPATEN MALUKU BARAT DAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1988, 1963, 'KABUPATEN BURU SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1989, 1988, 'PERATURAN DAERAH KABUPATEN BURU SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1990, 1988, 'PERATURAN BUPATI KABUPATEN BURU SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1991, 1963, 'KOTA AMBON', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1992, 1991, 'PERATURAN DAERAH KOTA AMBON', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1993, 1991, 'PERATURAN WALIKOTA AMBON', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1994, 1963, 'KOTA TUAL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1995, 1994, 'PERATURAN DAERAH KOTA TUAL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1996, 1994, 'PERATURAN WALIKOTA TUAL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1997, 1963, 'PROVINSI MALUKU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1998, 1997, 'PERATURAN DAERAH PROVINSI MALUKU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(1999, 1997, 'PERATURAN GUBERNUR PROVINSI MALUKU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2000, 108, 'MALUKU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2001, 2000, 'KABUPATEN HALMAHERA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2002, 2001, 'PERATURAN DAERAH KABUPATEN HALMAHERA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2003, 2001, 'PERATURAN BUPATI KABUPATEN HALMAHERA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2004, 2000, 'KABUPATEN HALMAHERA TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2005, 2004, 'PERATURAN DAERAH KABUPATEN HALMAHERA TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2006, 2004, 'PERATURAN BUPATI KABUPATEN HALMAHERA TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2007, 2000, 'KABUPATEN HALMAHERA UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2008, 2007, 'PERATURAN DAERAH KABUPATEN HALMAHERA UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2009, 2007, 'PERATURAN BUPATI KABUPATEN HALMAHERA UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2010, 2000, 'KABUPATEN HALMAHERA SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2011, 2010, 'PERATURAN DAERAH KABUPATEN HALMAHERA SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2012, 2010, 'PERATURAN BUPATI KABUPATEN HALMAHERA SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2013, 2000, 'KABUPATEN KEPULAUAN SULA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2014, 2013, 'PERATURAN DAERAH KABUPATEN KEPULAUAN SULA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2015, 2013, 'PERATURAN BUPATI KABUPATEN KEPULAUAN SULA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2016, 2000, 'KABUPATEN HALMAHERA TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2017, 2016, 'PERATURAN DAERAH KABUPATEN HALMAHERA TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2018, 2016, 'PERATURAN BUPATI KABUPATEN HALMAHERA TIMUR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2019, 2000, 'KABUPATEN PULAU MOROTAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2020, 2019, 'PERATURAN DAERAH KABUPATEN PULAU MOROTAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2021, 2019, 'PERATURAN BUPATI KABUPATEN PULAU MOROTAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2022, 2000, 'KOTA TERNATE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2023, 2022, 'PERATURAN DAERAH KOTA TERNATE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2024, 2022, 'PERATURAN WALIKOTA TERNATE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2025, 2000, 'KOTA TIDORE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2026, 2025, 'PERATURAN DAERAH KOTA TIDORE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2027, 2025, 'PERATURAN WALIKOTA TIDORE KEPULAUAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2028, 2000, 'KABUPATEN PULAU TALIABU', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2029, 2000, 'PROVINSI MALUKU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2030, 2029, 'PERATURAN DAERAH PROVINSI MALUKU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2031, 2029, 'PERATURAN GUBERNUR PROVINSI MALUKU UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2032, 2000, 'KOTA SOFIFI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2033, 108, 'P A P U A', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2034, 2033, 'KABUPATEN MERAUKE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2035, 2034, 'PERATURAN DAERAH KABUPATEN MERAUKE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2036, 2034, 'PERATURAN BUPATI KABUPATEN MERAUKE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2037, 2033, 'KABUPATEN JAYAWIJAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2038, 2037, 'PERATURAN DAERAH KABUPATEN JAYAWIJAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2039, 2037, 'PERATURAN BUPATI KABUPATEN JAYAWIJAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2040, 2033, 'KABUPATEN JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2041, 2040, 'PERATURAN DAERAH KABUPATEN JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2042, 2040, 'PERATURAN BUPATI KABUPATEN JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2043, 2033, 'KABUPATEN NABIRE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2044, 2043, 'PERATURAN DAERAH KABUPATEN NABIRE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2045, 2043, 'PERATURAN BUPATI KABUPATEN NABIRE', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2046, 2033, 'KABUPATEN KEPULAUAN YAPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2047, 2046, 'PERATURAN DAERAH KABUPATEN KEPULAUAN YAPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2048, 2046, 'PERATURAN BUPATI KABUPATEN KEPULAUAN YAPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2049, 2033, 'KABUPATEN BIAK NUMFOR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2050, 2049, 'PERATURAN DAERAH KABUPATEN BIAK NUMFOR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2051, 2049, 'PERATURAN BUPATI KABUPATEN BIAK NUMFOR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2052, 2033, 'KABUPATEN PUNCAK JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2053, 2052, 'PERATURAN DAERAH KABUPATEN PUNCAK JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2054, 2052, 'PERATURAN BUPATI KABUPATEN PUNCAK JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2055, 2033, 'KABUPATEN PANIAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2056, 2055, 'PERATURAN DAERAH KABUPATEN PANIAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2057, 2055, 'PERATURAN BUPATI KABUPATEN PANIAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2058, 2033, 'KABUPATEN MIMIKA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2059, 2058, 'PERATURAN DAERAH KABUPATEN MIMIKA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2060, 2058, 'PERATURAN BUPATI KABUPATEN MIMIKA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2061, 2033, 'KABUPATEN SARMI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2062, 2061, 'PERATURAN DAERAH KABUPATEN SARMI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2063, 2061, 'PERATURAN BUPATI KABUPATEN SARMI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2064, 2033, 'KABUPATEN KEEROM', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2065, 2064, 'PERATURAN DAERAH KABUPATEN KEEROM', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2066, 2064, 'PERATURAN BUPATI KABUPATEN KEEROM', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2067, 2033, 'KABUPATEN PEGUNUNGAN BINTANG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2068, 2067, 'PERATURAN DAERAH KABUPATEN PEGUNUNGAN BINTANG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2069, 2067, 'PERATURAN BUPATI KABUPATEN PEGUNUNGAN BINTANG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2070, 2033, 'KABUPATEN YAHUKIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2071, 2070, 'PERATURAN DAERAH KABUPATEN YAHUKIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2072, 2070, 'PERATURAN BUPATI KABUPATEN YAHUKIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2073, 2033, 'KABUPATEN TOLIKARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2074, 2073, 'PERATURAN DAERAH KABUPATEN TOLIKARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2075, 2073, 'PERATURAN BUPATI KABUPATEN TOLIKARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2076, 2033, 'KABUPATEN WAROPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2077, 2076, 'PERATURAN DAERAH KABUPATEN WAROPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2078, 2076, 'PERATURAN BUPATI KABUPATEN WAROPEN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2079, 2033, 'KABUPATEN BOVEN DIGOEL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2080, 2079, 'PERATURAN DAERAH KABUPATEN BOVEN DIGOEL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2081, 2079, 'PERATURAN BUPATI KABUPATEN BOVEN DIGOEL', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2082, 2033, 'KABUPATEN MAPPI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2083, 2082, 'PERATURAN DAERAH KABUPATEN MAPPI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2084, 2082, 'PERATURAN BUPATI KABUPATEN MAPPI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2085, 2033, 'KABUPATEN ASMAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2086, 2085, 'PERATURAN DAERAH KABUPATEN ASMAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2087, 2085, 'PERATURAN BUPATI KABUPATEN ASMAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2088, 2033, 'KABUPATEN SUPIORI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2089, 2088, 'PERATURAN DAERAH KABUPATEN SUPIORI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2090, 2088, 'PERATURAN BUPATI KABUPATEN SUPIORI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2091, 2033, 'KABUPATEN MAMBERAMO RAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2092, 2091, 'PERATURAN DAERAH KABUPATEN MAMBERAMO RAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2093, 2091, 'PERATURAN BUPATI KABUPATEN MAMBERAMO RAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2094, 2033, 'KABUPATEN MAMBERAMO TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2095, 2094, 'PERATURAN DAERAH KABUPATEN MAMBERAMO TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2096, 2094, 'PERATURAN BUPATI KABUPATEN MAMBERAMO TENGAH', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2097, 2033, 'KABUPATEN YALIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2098, 2097, 'PERATURAN DAERAH KABUPATEN YALIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2099, 2097, 'PERATURAN BUPATI KABUPATEN YALIMO', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2100, 2033, 'KABUPATEN LANNY JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2101, 2100, 'PERATURAN DAERAH KABUPATEN LANNY JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2102, 2100, 'PERATURAN BUPATI KABUPATEN LANNY JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2103, 2033, 'KABUPATEN NDUGA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2104, 2103, 'PERATURAN DAERAH KABUPATEN NDUGA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2105, 2103, 'PERATURAN BUPATI KABUPATEN NDUGA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2106, 2033, 'KABUPATEN PUNCAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2107, 2106, 'PERATURAN DAERAH KABUPATEN PUNCAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2108, 2106, 'PERATURAN BUPATI KABUPATEN PUNCAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2109, 2033, 'KABUPATEN DOGIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2110, 2109, 'PERATURAN DAERAH KABUPATEN DOGIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2111, 2109, 'PERATURAN BUPATI KABUPATEN DOGIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2112, 2033, 'KABUPATEN INTAN JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2113, 2112, 'PERATURAN DAERAH KABUPATEN INTAN JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2114, 2112, 'PERATURAN BUPATI KABUPATEN INTAN JAYA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2115, 2033, 'KABUPATEN DEIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2116, 2115, 'PERATURAN DAERAH KABUPATEN DEIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2117, 2115, 'PERATURAN BUPATI KABUPATEN DEIYAI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2118, 2033, 'KOTA JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2119, 2118, 'PERATURAN DAERAH KOTA JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2120, 2118, 'PERATURAN WALIKOTA JAYAPURA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2121, 2033, 'KABUPATEN ILAGA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2122, 2033, 'PROVINSI P A P U A', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2123, 2122, 'PERATURAN DAERAH PROVINSI P A P U A', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2124, 2122, 'PERATURAN GUBERNUR PROVINSI P A P U A', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2125, 108, 'PAPUA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2126, 2125, 'KABUPATEN SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2127, 2126, 'PERATURAN DAERAH KABUPATEN SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2128, 2126, 'PERATURAN BUPATI KABUPATEN SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2129, 2125, 'KABUPATEN MANOKWARI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2130, 2129, 'PERATURAN DAERAH KABUPATEN MANOKWARI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2131, 2129, 'PERATURAN BUPATI KABUPATEN MANOKWARI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2132, 2125, 'KABUPATEN FAK FAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2133, 2132, 'PERATURAN DAERAH KABUPATEN FAK FAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2134, 2132, 'PERATURAN BUPATI KABUPATEN FAK FAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2135, 2125, 'KABUPATEN SORONG SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2136, 2135, 'PERATURAN DAERAH KABUPATEN SORONG SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2137, 2135, 'PERATURAN BUPATI KABUPATEN SORONG SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2138, 2125, 'KABUPATEN RAJA AMPAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2139, 2138, 'PERATURAN DAERAH KABUPATEN RAJA AMPAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2140, 2138, 'PERATURAN BUPATI KABUPATEN RAJA AMPAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2141, 2125, 'KABUPATEN TELUK BINTUNI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2142, 2141, 'PERATURAN DAERAH KABUPATEN TELUK BINTUNI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2143, 2141, 'PERATURAN BUPATI KABUPATEN TELUK BINTUNI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2144, 2125, 'KABUPATEN TELUK WONDAMA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2145, 2144, 'PERATURAN DAERAH KABUPATEN TELUK WONDAMA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2146, 2144, 'PERATURAN BUPATI KABUPATEN TELUK WONDAMA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2147, 2125, 'KABUPATEN KAIMANA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2148, 2147, 'PERATURAN DAERAH KABUPATEN KAIMANA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2149, 2147, 'PERATURAN BUPATI KABUPATEN KAIMANA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2150, 2125, 'KABUPATEN TAMBRAUW', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2151, 2150, 'PERATURAN DAERAH KABUPATEN TAMBRAUW', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2152, 2150, 'PERATURAN BUPATI KABUPATEN TAMBRAUW', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2153, 2125, 'KABUPATEN MAYBRAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2154, 2153, 'PERATURAN DAERAH KABUPATEN MAYBRAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2155, 2153, 'PERATURAN BUPATI KABUPATEN MAYBRAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2156, 2125, 'KOTA SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2157, 2156, 'PERATURAN DAERAH KOTA SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2158, 2156, 'PERATURAN WALIKOTA SORONG', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2159, 2125, 'KABUPATEN PEGUNUNGAN ARFAK', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2160, 2125, 'PROVINSI PAPUA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2161, 2160, 'PERATURAN DAERAH PROVINSI PAPUA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2162, 2160, 'PERATURAN GUBERNUR PROVINSI PAPUA BARAT', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2163, 2125, 'KABUPATEN MANOKWARI SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2164, 2163, 'PERATURAN DAERAH KABUPATEN MANOKWARI SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2165, 2163, 'PERATURAN BUPATI KABUPATEN MANOKWARI SELATAN', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2166, 2125, 'KOTA MANOKWARI', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2167, 108, 'KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2168, 2167, 'KOTA TANJUNG SELOR', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2169, 2167, 'PROVINSI KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2170, 2169, 'PERATURAN DAERAH PROVINSI KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49'),
(2171, 2169, 'PERATURAN GUBERNUR PROVINSI KALIMANTAN UTARA', '1', '1', '1', '2018-10-10 12:46:49', '2018-10-10 12:46:49');

-- --------------------------------------------------------

--
-- Table structure for table `gmd`
--

CREATE TABLE `gmd` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `gmd`
--

INSERT INTO `gmd` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Art Original', NULL, '1', '1', '2018-08-21 08:26:33', '2018-08-21 08:26:33'),
(2, 'Chart', NULL, '1', '1', '2018-08-21 08:26:37', '2018-08-21 08:26:37'),
(3, 'Computer Software', NULL, '1', '1', '2018-08-21 08:26:50', '2018-08-21 08:26:50'),
(4, 'Diorama', NULL, '1', '1', '2018-08-21 08:26:55', '2018-08-21 08:26:55'),
(5, 'Film Strip', NULL, '1', '1', '2018-08-21 08:27:07', '2018-08-21 08:27:07'),
(6, 'Flash Card', NULL, '1', '1', '2018-08-21 08:27:11', '2018-08-21 08:27:11'),
(7, 'Game', NULL, '1', '1', '2018-08-21 08:27:23', '2018-08-21 08:27:23'),
(8, 'Globe', NULL, '1', '1', '2018-08-21 08:27:26', '2018-08-21 08:27:26'),
(9, 'Kit', NULL, '1', '1', '2018-08-21 08:27:29', '2018-08-21 08:27:29'),
(10, 'Map', NULL, '1', '1', '2018-08-21 08:27:31', '2018-08-21 08:27:31'),
(11, 'Microform', NULL, '1', '1', '2018-08-21 08:27:47', '2018-08-21 08:27:47'),
(12, 'Manuscript', NULL, '1', '1', '2018-08-21 08:27:51', '2018-08-21 08:27:51'),
(13, 'Model', NULL, '1', '1', '2018-08-21 08:28:02', '2018-08-21 08:28:02'),
(14, 'Motion Picture', NULL, '1', '1', '2018-08-21 08:28:08', '2018-08-21 08:28:08'),
(15, 'Microscope Slide', NULL, '1', '1', '2018-08-21 08:28:42', '2018-08-21 08:28:42');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `id` int(11) NOT NULL,
  `biblio_id` int(11) DEFAULT NULL,
  `call_number` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `coll_type_id` int(3) DEFAULT NULL,
  `item_code` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `inventory_code` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `supplier_id` varchar(6) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_no` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `location_id` varchar(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `order_date` date DEFAULT NULL,
  `item_status_id` char(3) COLLATE utf8_unicode_ci DEFAULT NULL,
  `site` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  `source` int(1) NOT NULL DEFAULT '0',
  `invoice` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `price_currency` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `invoice_date` date DEFAULT NULL,
  `input_date` datetime NOT NULL,
  `last_update` datetime DEFAULT NULL,
  `uid` int(11) DEFAULT NULL,
  `_created_by` int(11) NOT NULL,
  `_updated_by` int(11) NOT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jenis_pengarang`
--

CREATE TABLE `jenis_pengarang` (
  `id` int(11) NOT NULL,
  `orders` varchar(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_pengarang`
--

INSERT INTO `jenis_pengarang` (`id`, `orders`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'Pengarang Utama', NULL, '1', '1', '2018-08-29 14:21:59', '2018-08-29 14:21:59'),
(2, '2', 'Pengarang Tambahan', NULL, '1', '1', '2018-08-29 14:22:03', '2018-08-29 14:22:03'),
(3, '3', 'Penyunting', NULL, '1', '1', '2018-08-29 14:22:10', '2018-08-29 14:22:10'),
(4, '4', 'Penerjemah', NULL, '1', '1', '2018-08-29 14:22:16', '2018-08-29 14:22:16'),
(5, '5', 'Direktur', NULL, '1', '1', '2018-08-29 14:22:25', '2018-08-29 14:22:25'),
(6, '6', 'Produser', NULL, '1', '1', '2018-08-29 14:22:29', '2018-08-29 14:22:29'),
(7, '7', 'Pengubah', NULL, '1', '1', '2018-08-29 14:22:38', '2018-08-29 14:22:38'),
(8, '8', 'Ilustrator', NULL, '1', '1', '2018-08-29 14:22:42', '2018-08-29 14:22:42'),
(9, '9', 'Pencipta', NULL, '1', '1', '2018-08-29 14:22:50', '2018-08-29 14:22:50'),
(10, '10', 'Kontributor', NULL, '1', '1', '2018-08-29 14:22:53', '2018-08-29 14:22:53');

-- --------------------------------------------------------

--
-- Table structure for table `jenis_peraturan`
--

CREATE TABLE `jenis_peraturan` (
  `id` int(11) NOT NULL,
  `orders` varchar(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent` int(11) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `jenis_peraturan`
--

INSERT INTO `jenis_peraturan` (`id`, `orders`, `name`, `parent`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'Undang-Undang Dasar Negara Republik Indonesia Tahun 1945', 1, NULL, '1', '1', '2018-09-11 19:22:56', '2018-09-19 13:33:12'),
(2, '2', 'Ketetapan Majelis Permusyawaratan Rakyat', 1, NULL, '1', '1', '2018-09-11 19:22:59', '2018-09-19 13:33:22'),
(3, '3', 'Undang-Undang/Peraturan Pemerintah Pengganti Undang-Undang', 1, NULL, '1', '1', '2018-09-11 19:23:01', '2018-09-19 13:34:06'),
(4, '4', 'Peraturan Pemerintah', 1, NULL, '1', '1', '2018-09-11 19:23:04', '2018-09-19 13:34:20'),
(5, '5', 'Peraturan Presiden', 1, NULL, '1', '1', '2018-09-19 13:34:32', '2018-09-19 13:34:32'),
(6, '6', 'Peraturan Daerah Provinsi', 1, NULL, '1', '1', '2018-09-19 13:34:43', '2018-09-19 13:34:43'),
(7, '7', 'Peraturan Daerah Kabupaten/Kota', 1, NULL, '1', '1', '2018-09-19 13:34:52', '2018-09-19 13:34:52');

-- --------------------------------------------------------

--
-- Table structure for table `kala_terbit`
--

CREATE TABLE `kala_terbit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `kala_terbit`
--

INSERT INTO `kala_terbit` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Weekly', NULL, '1', '1', '2018-08-21 08:37:30', '2018-08-21 08:37:30'),
(2, 'Bi Weekly', NULL, '1', '1', '2018-08-21 08:37:35', '2018-08-21 08:37:35'),
(3, 'Fourth Nightly', NULL, '1', '1', '2018-08-21 08:38:03', '2018-08-21 08:38:03'),
(4, 'Monthly', NULL, '1', '1', '2018-08-21 08:38:19', '2018-08-21 08:38:19'),
(5, 'Bi Monthly', NULL, '1', '1', '2018-08-21 08:38:29', '2018-08-21 08:38:29'),
(6, 'Quarterly', NULL, '1', '1', '2018-08-21 08:38:42', '2018-08-21 08:38:42'),
(7, '3 Times a Year', NULL, '1', '1', '2018-08-21 08:38:55', '2018-08-21 08:38:55'),
(8, 'Anually', NULL, '1', '1', '2018-08-21 08:39:07', '2018-08-21 08:39:07');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id` int(11) NOT NULL,
  `parent_id` varchar(255) NOT NULL,
  `nama_kategori` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi`
--

CREATE TABLE `klasifikasi` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `klasifikasi`
--

INSERT INTO `klasifikasi` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Peraturan Perundang - undangan', NULL, '1', '1', '2018-08-21 08:35:09', '2018-08-21 08:35:09'),
(2, 'Keputusan Presiden', NULL, '1', '1', '2018-08-21 08:35:16', '2018-08-21 08:35:16');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id` int(11) NOT NULL,
  `member_id` varchar(100) DEFAULT NULL,
  `member_name` varchar(100) DEFAULT NULL,
  `gender` varchar(100) DEFAULT NULL,
  `birth_date` date DEFAULT NULL,
  `member_type_id` varchar(100) DEFAULT NULL,
  `member_address` text,
  `member_mail_address` varchar(255) DEFAULT NULL,
  `member_email` varchar(255) DEFAULT NULL,
  `postal_code` varchar(100) DEFAULT NULL,
  `personal_id_number` varchar(100) DEFAULT NULL,
  `inst_name` varchar(100) DEFAULT NULL,
  `member_image` text,
  `member_since_date` date DEFAULT NULL,
  `register_date` date DEFAULT NULL,
  `expire_date` date DEFAULT NULL,
  `phone_number` varchar(50) DEFAULT NULL,
  `fax_number` varchar(50) DEFAULT NULL,
  `member_notes` text,
  `confirm_password` varchar(255) DEFAULT NULL,
  `is_pending` varchar(255) DEFAULT NULL,
  `mpasswd` varchar(255) DEFAULT NULL,
  `_created_by` int(11) DEFAULT NULL,
  `_updated_by` int(11) DEFAULT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id`, `member_id`, `member_name`, `gender`, `birth_date`, `member_type_id`, `member_address`, `member_mail_address`, `member_email`, `postal_code`, `personal_id_number`, `inst_name`, `member_image`, `member_since_date`, `register_date`, `expire_date`, `phone_number`, `fax_number`, `member_notes`, `confirm_password`, `is_pending`, `mpasswd`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '001', 'Habibudin', '1', '2018-01-01', '1', 'Jakarta', 'mbiebs94@gmail.com', 'tes@email.com', '09302', '8983823', 'Dinas', '{\"name\":\"example.jpg\",\"filename\":\"dad597bde636f135aea09910527d5372.jpg\",\"bucket\":\"storage\",\"mime_type\":\"image\\/jpeg\"}', '2018-02-01', '2018-08-06', '2018-09-30', '093883399', '092393', 'Tess', '089999', '1', '089999', NULL, NULL, '2018-08-06 15:51:35', '2018-08-06 15:56:39');

-- --------------------------------------------------------

--
-- Table structure for table `mst_member_type`
--

CREATE TABLE `mst_member_type` (
  `id` int(11) NOT NULL,
  `member_type_name` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `loan_limit` int(11) NOT NULL,
  `loan_periode` int(11) NOT NULL,
  `enable_reserve` int(1) NOT NULL DEFAULT '0',
  `reserve_limit` int(11) NOT NULL DEFAULT '0',
  `member_periode` int(11) NOT NULL,
  `reborrow_limit` int(11) NOT NULL,
  `fine_each_day` int(11) NOT NULL,
  `grace_periode` int(2) DEFAULT '0',
  `input_date` date NOT NULL,
  `last_update` date DEFAULT NULL,
  `_created_by` int(11) DEFAULT NULL,
  `_updated_by` int(11) DEFAULT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `mst_member_type`
--

INSERT INTO `mst_member_type` (`id`, `member_type_name`, `loan_limit`, `loan_periode`, `enable_reserve`, `reserve_limit`, `member_periode`, `reborrow_limit`, `fine_each_day`, `grace_periode`, `input_date`, `last_update`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Premium', 7, 2018, 1, 1, 2019, 1, 11, 2020, '2018-08-02', '2018-08-02', NULL, NULL, '2018-08-02 12:10:42', '2018-08-09 12:48:09');

-- --------------------------------------------------------

--
-- Table structure for table `penerbit`
--

CREATE TABLE `penerbit` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `penerbit`
--

INSERT INTO `penerbit` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Gramedia', NULL, '1', '1', '2018-08-21 08:19:03', '2018-08-21 08:19:03'),
(2, 'Kompas', NULL, '1', '1', '2018-08-29 14:11:18', '2018-08-29 14:11:18');

-- --------------------------------------------------------

--
-- Table structure for table `pengarang`
--

CREATE TABLE `pengarang` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pengarang`
--

INSERT INTO `pengarang` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Fauzi', NULL, '1', '1', '2018-09-12 06:30:12', '2018-09-12 06:30:12');

-- --------------------------------------------------------

--
-- Table structure for table `pola_eksemplar`
--

CREATE TABLE `pola_eksemplar` (
  `id` int(11) NOT NULL,
  `pattern` varchar(100) NOT NULL,
  `prefix` varchar(100) NOT NULL,
  `suffix` varchar(100) NOT NULL,
  `length` varchar(100) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `pola_eksemplar`
--

INSERT INTO `pola_eksemplar` (`id`, `pattern`, `prefix`, `suffix`, `length`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(4, 'P00000S', 'P', 'S', '5', NULL, '1', '1', '2018-10-05 10:49:08', '2018-10-05 10:49:08');

-- --------------------------------------------------------

--
-- Table structure for table `previleges`
--

CREATE TABLE `previleges` (
  `id` int(11) NOT NULL,
  `module` varchar(255) DEFAULT NULL,
  `submodule` varchar(255) DEFAULT NULL,
  `ordering` varchar(255) DEFAULT NULL,
  `action` varchar(255) DEFAULT NULL,
  `uri` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `previleges`
--

INSERT INTO `previleges` (`id`, `module`, `submodule`, `ordering`, `action`, `uri`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'All', 'All', '1', 'Full Access', '*', '59b60c0c8af9e96df3b7acda', '59b60c0c8af9e96df3b7acda', '2018-07-26 10:59:11', '2018-07-26 10:59:11');

-- --------------------------------------------------------

--
-- Table structure for table `report`
--

CREATE TABLE `report` (
  `id` int(11) NOT NULL,
  `jalan` varchar(255) NOT NULL,
  `kota` varchar(255) NOT NULL,
  `provinsi` varchar(255) NOT NULL,
  `kode_pos` varchar(255) NOT NULL,
  `telepon` varchar(100) NOT NULL,
  `faksimili` varchar(100) NOT NULL,
  `website_utama` varchar(100) NOT NULL,
  `website_jdih` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `sop_pengolahan_jdih` text NOT NULL,
  `nama_biro` varchar(100) NOT NULL,
  `nip_biro` varchar(100) NOT NULL,
  `pangkat_biro` varchar(100) NOT NULL,
  `klasifikasi_pendidikan_biro` varchar(100) NOT NULL,
  `nama_sub` varchar(100) NOT NULL,
  `nip_sub` varchar(100) NOT NULL,
  `pangkat_sub` varchar(100) NOT NULL,
  `klasifikasi_pendidikan_sub` varchar(100) NOT NULL,
  `nama_jfu` varchar(100) NOT NULL,
  `nip_jfu` varchar(100) NOT NULL,
  `pangkat_jfu` varchar(100) NOT NULL,
  `klasifikasi_pendidikan_jfu` varchar(100) NOT NULL,
  `undang_undang` text NOT NULL,
  `peraturan_pemerintah_pengganti_uu` text NOT NULL,
  `peraturan_pemerintah` text NOT NULL,
  `peraturan_presiden` text NOT NULL,
  `peraturan_menteri` text NOT NULL,
  `peraturan_daerah_provinsi` text NOT NULL,
  `peraturan_daerah_kabupaten` text NOT NULL,
  `peraturan_daerah_kota` text NOT NULL,
  `peraturan_gubernur` text NOT NULL,
  `peraturan_bupati` text NOT NULL,
  `peraturan_walikota` text NOT NULL,
  `buku_hukum` varchar(255) NOT NULL,
  `jurnal_hukum` varchar(255) NOT NULL,
  `hasil_penelitian_hukum` varchar(255) NOT NULL,
  `hasil_pengkajian_hukum` varchar(255) NOT NULL,
  `naskah_akademis` varchar(255) NOT NULL,
  `rancangan_peraturan_daerah` varchar(255) NOT NULL,
  `keputusan_pengadilan` varchar(255) NOT NULL,
  `yurispundensi` varchar(255) NOT NULL,
  `artikel_hukum` varchar(255) NOT NULL,
  `kliping_koran_berita_hukum` varchar(255) NOT NULL,
  `lain_lain` varchar(255) NOT NULL,
  `sudah_pedoman` varchar(100) NOT NULL,
  `sudah_pedoman_jumlah` varchar(100) NOT NULL,
  `sudah_iventarisasi` varchar(100) NOT NULL,
  `sudah_iventarisasi_jumlah` varchar(100) NOT NULL,
  `sudah_katalogisasi` varchar(100) NOT NULL,
  `sudah_katalogisasi_jumlah` varchar(100) NOT NULL,
  `sudah_abstrak` varchar(100) NOT NULL,
  `sudah_abstrak_jumlah` varchar(100) NOT NULL,
  `sudah_indeks` varchar(100) NOT NULL,
  `sudah_indeks_jumlah` varchar(100) NOT NULL,
  `sudah_majalah` varchar(100) NOT NULL,
  `sudah_majalah_jumlah` varchar(100) NOT NULL,
  `sudah_katalogisasi_hukum` varchar(100) NOT NULL,
  `sudah_katalogisasi_jumlah_hukum` varchar(100) NOT NULL,
  `ruang_kerja` varchar(100) NOT NULL,
  `ruang_koleksi` varchar(100) NOT NULL,
  `ruang_baca` varchar(100) NOT NULL,
  `meja_baca` varchar(100) NOT NULL,
  `kursi_baca` varchar(100) NOT NULL,
  `komputer` varchar(100) NOT NULL,
  `printer` varchar(100) NOT NULL,
  `scanner` varchar(100) NOT NULL,
  `koneksi_internet` varchar(100) NOT NULL,
  `mesin_fotocopy` varchar(100) NOT NULL,
  `writer` varchar(100) NOT NULL,
  `telepon_sarana` varchar(100) NOT NULL,
  `fak` varchar(100) NOT NULL,
  `lain` varchar(100) NOT NULL,
  `telah_otomasi` varchar(100) NOT NULL,
  `memiliki_permasalahan` varchar(100) NOT NULL,
  `memiliki_situs` varchar(100) NOT NULL,
  `melakukan_pemutaakhiran` varchar(100) NOT NULL,
  `web_dikelola` varchar(100) NOT NULL,
  `jml_kegiatan_bimtek` varchar(100) NOT NULL,
  `jml_peserta_bimtek` varchar(100) NOT NULL,
  `ket_bimtek` varchar(100) NOT NULL,
  `jml_kegiatan_sos` varchar(100) NOT NULL,
  `jml_peserta_sos` varchar(100) NOT NULL,
  `ket_sos` varchar(100) NOT NULL,
  `jml_kegiatan_mon` varchar(100) NOT NULL,
  `jml_peserta_mon` varchar(100) NOT NULL,
  `ket_mon` varchar(100) NOT NULL,
  `jml_kegiatan_koor` varchar(100) NOT NULL,
  `jml_peserta_koor` varchar(100) NOT NULL,
  `ket_koor` varchar(100) NOT NULL,
  `jml_kegiatan_rakor` varchar(100) NOT NULL,
  `jml_peserta_rakor` varchar(100) NOT NULL,
  `ket_rakor` varchar(100) NOT NULL,
  `jml_kegiatan_kons` varchar(100) NOT NULL,
  `jml_peserta_kons` varchar(100) NOT NULL,
  `ket_kons` varchar(100) NOT NULL,
  `jml_kegiatan_mengikuti` varchar(100) NOT NULL,
  `jml_peserta_mengikuti` varchar(100) NOT NULL,
  `ket_mengikuti` varchar(100) NOT NULL,
  `jml_kegiatan_kerja` varchar(100) NOT NULL,
  `jml_peserta_kerja` varchar(100) NOT NULL,
  `ket_kerja` varchar(100) NOT NULL,
  `jml_kegiatan_kerjasama` varchar(100) NOT NULL,
  `jml_peserta_kerjasama` varchar(100) NOT NULL,
  `ket_kerjasama` varchar(100) NOT NULL,
  `jml_kegiatan_mitra` varchar(100) NOT NULL,
  `jml_peserta_mitra` varchar(100) NOT NULL,
  `ket_mitra` varchar(100) NOT NULL,
  `pengelola_jdih_prov` varchar(255) NOT NULL,
  `website_jdih_prov` varchar(255) NOT NULL,
  `status_integrasi_prov` varchar(255) NOT NULL,
  `pengelola_jdih_kab` varchar(255) NOT NULL,
  `website_jdih_kab` varchar(255) NOT NULL,
  `status_integrasi_kab` varchar(255) NOT NULL,
  `pengelola_jdih_kota` varchar(255) NOT NULL,
  `website_jdih_kota` varchar(255) NOT NULL,
  `status_integrasi_kota` varchar(255) NOT NULL,
  `pengelola_jdih_dewprov` varchar(255) NOT NULL,
  `website_jdih_dewprov` varchar(255) NOT NULL,
  `status_integrasi_dewprov` varchar(255) NOT NULL,
  `pengelola_jdih_dewpkab` varchar(255) NOT NULL,
  `website_jdih_dewpkab` varchar(255) NOT NULL,
  `status_integrasi_dewpkab` varchar(255) NOT NULL,
  `pengelola_jdih_negri` varchar(255) NOT NULL,
  `website_jdih_negri` varchar(255) NOT NULL,
  `status_integrasi_negri` varchar(255) NOT NULL,
  `pengelola_jdih_swasta` varchar(255) NOT NULL,
  `website_jdih_swasta` varchar(255) NOT NULL,
  `status_integrasi_swasta` varchar(255) NOT NULL,
  `otomasi` varchar(100) NOT NULL,
  `permasalahan` varchar(100) NOT NULL,
  `situs_jdih` varchar(100) NOT NULL,
  `pemutakhiran` varchar(100) NOT NULL,
  `web_yg_dikelola` varchar(255) NOT NULL,
  `_created_by` int(11) NOT NULL,
  `_updated_by` int(11) NOT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `name`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Super Administrator', '59b60c0c8af9e96df3b7acda', '59b60c0c8af9e96df3b7acda', '2018-07-26 10:59:29', '2018-07-26 10:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `role_previleges`
--

CREATE TABLE `role_previleges` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `rule` varchar(255) NOT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role_previleges`
--

INSERT INTO `role_previleges` (`id`, `role`, `type`, `rule`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'uri', '*', '59b60c0c8af9e96df3b7acda', '59b60c0c8af9e96df3b7acda', '2018-07-26 10:59:29', '2018-07-26 10:59:29');

-- --------------------------------------------------------

--
-- Table structure for table `stock_opname`
--

CREATE TABLE `stock_opname` (
  `id` int(11) NOT NULL,
  `nama_inventarisasi` varchar(255) NOT NULL,
  `gmd` varchar(50) NOT NULL,
  `type_koleksi` varchar(50) NOT NULL,
  `lokasi` varchar(50) NOT NULL,
  `lokasi_rak` varchar(50) NOT NULL,
  `klasifikasi` varchar(255) NOT NULL,
  `stok_status` varchar(100) DEFAULT NULL,
  `tanggal_dibuat` datetime NOT NULL,
  `tanggal_selesai` datetime DEFAULT NULL,
  `_created_by` int(11) NOT NULL,
  `_updated_by` int(11) NOT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_opname`
--

INSERT INTO `stock_opname` (`id`, `nama_inventarisasi`, `gmd`, `type_koleksi`, `lokasi`, `lokasi_rak`, `klasifikasi`, `stok_status`, `tanggal_dibuat`, `tanggal_selesai`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(2, 'Tes', '2', '1', '1', '930', 'Tes', NULL, '2018-09-10 00:00:00', NULL, 1, 1, '2018-09-10 22:30:09', '2018-09-10 22:30:09');

-- --------------------------------------------------------

--
-- Table structure for table `stock_search_result`
--

CREATE TABLE `stock_search_result` (
  `id` int(11) NOT NULL,
  `id_stock_opname` varchar(100) NOT NULL,
  `nomor_panggil_doc` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `_created_by` int(11) NOT NULL,
  `_created_time` datetime NOT NULL,
  `_updated_by` int(11) NOT NULL,
  `_updated_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `stock_search_result`
--

INSERT INTO `stock_search_result` (`id`, `id_stock_opname`, `nomor_panggil_doc`, `name`, `_created_by`, `_created_time`, `_updated_by`, `_updated_time`) VALUES
(2, '2', 'Testing 1', 'Testing 1', 1, '2018-09-10 22:30:26', 1, '2018-09-10 22:30:26');

-- --------------------------------------------------------

--
-- Table structure for table `sysparam`
--

CREATE TABLE `sysparam` (
  `id` int(11) NOT NULL,
  `groups` varchar(255) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `long_value` text,
  `order_param` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sysparam`
--

INSERT INTO `sysparam` (`id`, `groups`, `key`, `value`, `long_value`, `order_param`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Gender', '1', 'Male', 'Male', 1, NULL, '1', '1', '2018-07-26 11:16:43', '2018-07-26 11:16:43'),
(2, 'Tipe Dokumen', '1', 'Peraturan Perundangan - undangan', 'Peraturan Perundangan - undangan', 1, NULL, '1', '1', '2018-08-03 15:55:48', '2018-08-06 16:12:46'),
(3, 'Tipe Dokumen', '2', 'Monografi Hukum', 'Monografi Hukum', 2, NULL, '1', '1', '2018-08-06 15:24:27', '2018-08-06 15:24:27'),
(4, 'Tipe Dokumen', '3', 'Artikel Hukum (Majalah, Koran)', 'Artikel Hukum (Majalah, Koran)', 3, NULL, '1', '1', '2018-08-06 15:25:00', '2018-08-06 15:26:34'),
(5, 'Tipe Dokumen', '4', 'Putusan Pengadilan/Yurisprudensi (Pts MA, PT, PN)', 'Putusan Pengadilan/Yurisprudensi (Pts MA, PT, PN)', 4, NULL, '1', '1', '2018-08-06 15:26:01', '2018-08-06 15:26:01'),
(6, 'Teu', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:40:59', '2018-08-07 11:40:59'),
(7, 'Jenis', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:42:25', '2018-08-07 11:42:25'),
(8, 'Singkatan Jenis', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:44:31', '2018-08-07 11:44:31'),
(9, 'Tempat Terbit', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:45:32', '2018-08-07 11:45:32'),
(10, 'Penerbit', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:46:17', '2018-08-07 11:46:17'),
(11, 'Sumber', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:47:21', '2018-08-07 11:47:21'),
(12, 'Status', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:49:07', '2018-08-07 11:49:07'),
(13, 'Bahasa', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:50:38', '2018-08-07 11:50:38'),
(14, 'Bidang Hukum', '1', 'Opsi 1', 'Opsi 1', 1, NULL, '1', '1', '2018-08-07 11:51:42', '2018-08-07 11:51:42');

-- --------------------------------------------------------

--
-- Table structure for table `tempat_penetapan`
--

CREATE TABLE `tempat_penetapan` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tempat_penetapan`
--

INSERT INTO `tempat_penetapan` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Jakarta', NULL, '1', '1', '2018-08-21 08:09:53', '2018-08-21 08:09:53'),
(2, 'Bekasi', NULL, '1', '1', '2018-08-21 08:09:57', '2018-08-21 08:09:57');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_kata_kunci`
--

CREATE TABLE `tipe_kata_kunci` (
  `id` int(11) NOT NULL,
  `orders` varchar(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipe_kata_kunci`
--

INSERT INTO `tipe_kata_kunci` (`id`, `orders`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'Topik', NULL, '1', '1', '2018-08-30 17:01:44', '2018-08-30 17:01:44'),
(2, '2', 'Geografis', NULL, '1', '1', '2018-08-30 17:01:48', '2018-08-30 17:01:48'),
(3, '3', 'Nama', NULL, '1', '1', '2018-08-30 17:01:51', '2018-08-30 17:01:51'),
(4, '4', 'Masa', NULL, '1', '1', '2018-08-30 17:01:57', '2018-08-30 17:01:57'),
(5, '5', 'Aliran', NULL, '1', '1', '2018-08-30 17:02:00', '2018-08-30 17:02:00'),
(6, '6', 'Pekerjaan', NULL, '1', '1', '2018-08-30 17:02:06', '2018-08-30 17:02:06');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_koleksi`
--

CREATE TABLE `tipe_koleksi` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipe_koleksi`
--

INSERT INTO `tipe_koleksi` (`id`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Reference', NULL, '1', '1', '2018-08-21 08:23:14', '2018-08-21 08:23:14'),
(2, 'Textbook', NULL, '1', '1', '2018-08-21 08:23:18', '2018-08-21 08:23:18'),
(3, 'Fiction', NULL, '1', '1', '2018-08-21 08:23:35', '2018-08-21 08:23:35');

-- --------------------------------------------------------

--
-- Table structure for table `tipe_pengarang`
--

CREATE TABLE `tipe_pengarang` (
  `id` int(11) NOT NULL,
  `orders` varchar(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tipe_pengarang`
--

INSERT INTO `tipe_pengarang` (`id`, `orders`, `name`, `status`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, '1', 'Nama Orang', NULL, '1', '1', '2018-08-29 14:14:26', '2018-08-29 14:14:26'),
(2, '2', 'Badan Organisasi', NULL, '1', '1', '2018-08-29 14:14:31', '2018-08-29 14:14:31'),
(3, '3', 'Konfrensi', NULL, '1', '1', '2018-08-29 14:14:39', '2018-08-29 14:14:39');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `nik` varchar(50) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `normalized_username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` date DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `mobile_phone` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `site` text,
  `ispriority_approver` text,
  `_created_by` varchar(255) DEFAULT NULL,
  `_updated_by` varchar(255) DEFAULT NULL,
  `_created_time` datetime DEFAULT NULL,
  `_updated_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `first_name`, `last_name`, `photo`, `username`, `nik`, `email`, `normalized_username`, `password`, `birthday`, `position`, `gender`, `address`, `mobile_phone`, `role`, `site`, `ispriority_approver`, `_created_by`, `_updated_by`, `_created_time`, `_updated_time`) VALUES
(1, 'Super', 'Administrator', NULL, 'admin', NULL, 'admin@jdihn.go.id', '', '0fcfcbbb420d3b6f81cd5a0d70a96579', NULL, NULL, '', '', '', '[\"1\"]', NULL, NULL, '59b60c0c8af9e96df3b7acda', '1', '2018-07-26 11:00:10', '2018-08-10 10:03:23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_trail`
--
ALTER TABLE `audit_trail`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bidang_hukum`
--
ALTER TABLE `bidang_hukum`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `circulation`
--
ALTER TABLE `circulation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_lampiran`
--
ALTER TABLE `data_lampiran`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_pengarang`
--
ALTER TABLE `data_pengarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_status`
--
ALTER TABLE `data_status`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `data_subyek`
--
ALTER TABLE `data_subyek`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document`
--
ALTER TABLE `document`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_configuration`
--
ALTER TABLE `document_configuration`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `document_type`
--
ALTER TABLE `document_type`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gmd`
--
ALTER TABLE `gmd`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `item_code` (`item_code`),
  ADD KEY `uid` (`uid`),
  ADD KEY `item_references_idx` (`coll_type_id`,`location_id`,`item_status_id`),
  ADD KEY `biblio_id_idx` (`biblio_id`);

--
-- Indexes for table `jenis_pengarang`
--
ALTER TABLE `jenis_pengarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `jenis_peraturan`
--
ALTER TABLE `jenis_peraturan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kala_terbit`
--
ALTER TABLE `kala_terbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `mst_member_type`
--
ALTER TABLE `mst_member_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `member_type_name` (`member_type_name`);

--
-- Indexes for table `penerbit`
--
ALTER TABLE `penerbit`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pengarang`
--
ALTER TABLE `pengarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `pola_eksemplar`
--
ALTER TABLE `pola_eksemplar`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `previleges`
--
ALTER TABLE `previleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `report`
--
ALTER TABLE `report`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_previleges`
--
ALTER TABLE `role_previleges`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_opname`
--
ALTER TABLE `stock_opname`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `stock_search_result`
--
ALTER TABLE `stock_search_result`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sysparam`
--
ALTER TABLE `sysparam`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tempat_penetapan`
--
ALTER TABLE `tempat_penetapan`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_kata_kunci`
--
ALTER TABLE `tipe_kata_kunci`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_koleksi`
--
ALTER TABLE `tipe_koleksi`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tipe_pengarang`
--
ALTER TABLE `tipe_pengarang`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_trail`
--
ALTER TABLE `audit_trail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `bidang_hukum`
--
ALTER TABLE `bidang_hukum`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `circulation`
--
ALTER TABLE `circulation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `data_lampiran`
--
ALTER TABLE `data_lampiran`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `data_pengarang`
--
ALTER TABLE `data_pengarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `data_status`
--
ALTER TABLE `data_status`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `data_subyek`
--
ALTER TABLE `data_subyek`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `document`
--
ALTER TABLE `document`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `document_configuration`
--
ALTER TABLE `document_configuration`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `document_type`
--
ALTER TABLE `document_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2172;
--
-- AUTO_INCREMENT for table `gmd`
--
ALTER TABLE `gmd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `jenis_pengarang`
--
ALTER TABLE `jenis_pengarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
--
-- AUTO_INCREMENT for table `jenis_peraturan`
--
ALTER TABLE `jenis_peraturan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `kala_terbit`
--
ALTER TABLE `kala_terbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `klasifikasi`
--
ALTER TABLE `klasifikasi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `mst_member_type`
--
ALTER TABLE `mst_member_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `penerbit`
--
ALTER TABLE `penerbit`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `pengarang`
--
ALTER TABLE `pengarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `pola_eksemplar`
--
ALTER TABLE `pola_eksemplar`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `previleges`
--
ALTER TABLE `previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `report`
--
ALTER TABLE `report`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `role_previleges`
--
ALTER TABLE `role_previleges`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `stock_opname`
--
ALTER TABLE `stock_opname`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `stock_search_result`
--
ALTER TABLE `stock_search_result`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `sysparam`
--
ALTER TABLE `sysparam`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `tempat_penetapan`
--
ALTER TABLE `tempat_penetapan`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tipe_kata_kunci`
--
ALTER TABLE `tipe_kata_kunci`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tipe_koleksi`
--
ALTER TABLE `tipe_koleksi`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tipe_pengarang`
--
ALTER TABLE `tipe_pengarang`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
