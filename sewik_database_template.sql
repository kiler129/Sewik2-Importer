-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 30 Kwi 2015, 23:35
-- Server version: 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `sewik_2014`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `pojazdy`
--

CREATE TABLE IF NOT EXISTS `pojazdy` (
  `ID` int(11) NOT NULL,
  `ZSZD_ID` int(11) NOT NULL,
  `NR_POJAZDU` int(11) NOT NULL,
  `RODZAJ_POJAZDU` varchar(4) COLLATE utf8_polish_ci NOT NULL,
  `MARKA` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `SPSU_KOD` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `SPSP_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SPIC_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `KRAJ_REJ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `KRAJ_UBZ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ZSPO_ID` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ZSZD_ID` (`ZSZD_ID`),
  KEY `rodzaj_pojazdu` (`RODZAJ_POJAZDU`),
  KEY `SPSP_KOD` (`SPSP_KOD`),
  KEY `SPIC_KOD` (`SPIC_KOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `uczestnicy`
--

CREATE TABLE IF NOT EXISTS `uczestnicy` (
  `ID` int(11) unsigned NOT NULL,
  `ZSZD_ID` int(11) unsigned NOT NULL,
  `ZSPO_ID` int(11) unsigned DEFAULT NULL,
  `SSRU_KOD` varchar(2) COLLATE utf8_polish_ci DEFAULT NULL,
  `DATA_UR` date NOT NULL,
  `SOBY_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `PLEC` varchar(1) COLLATE utf8_polish_ci NOT NULL,
  `SUSU_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `LICZBA_LAT_KIEROWANIA` int(11) unsigned DEFAULT NULL,
  `SPSZ_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SRUZ_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SUSW_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `STUC_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `POD_WPLYWEM` varchar(10) COLLATE utf8_polish_ci NOT NULL,
  `SUSB_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `OBCOKRAJOWIEC` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `ZBIEGL_Z_MIEJSCA` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SPPI_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `MIEJSCE_W_POJ` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SUZZ_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `INWALIDA` varchar(1) COLLATE utf8_polish_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ZSPO_ID` (`ZSPO_ID`),
  KEY `ZSZD_ID` (`ZSZD_ID`),
  KEY `data_ur` (`DATA_UR`),
  KEY `STUC_KOD` (`STUC_KOD`),
  KEY `SPSZ_KOD` (`SPSZ_KOD`),
  KEY `SSRU_KOD` (`SSRU_KOD`),
  KEY `PLEC` (`PLEC`),
  KEY `SUSU_KOD` (`SUSU_KOD`),
  KEY `SRUZ_KOD` (`SRUZ_KOD`),
  KEY `SPPI_KOD` (`SPPI_KOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `zdarzenie`
--

CREATE TABLE IF NOT EXISTS `zdarzenie` (
  `ID` int(11) unsigned NOT NULL,
  `JEDNOSTKA_MIEJSCA` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `JEDNOSTKA_LIKWIDUJACA` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `JEDNOSTKA_OPERATORA` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `NR_KW` varchar(60) COLLATE utf8_polish_ci NOT NULL,
  `WOJ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `GMINA` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `POWIAT` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `MIEJSCOWOSC` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ULICA_ADRES` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `NUMER_DOMU` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `DATA_ZDARZENIA` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `DATA_ZDARZ` date NOT NULL,
  `GODZINA_ZDARZ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `PREDKOSC_DOPUSZCZALNA` int(10) unsigned NOT NULL,
  `SZOS_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SZRD_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `DROGA_PUBLICZNA` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `NADR_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `STNA_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `RODR_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SYSW_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `OZPO_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `GEOD_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `ZABU_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `CHMZ_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SSWA_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `ZSSD_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `ULICA_SKRZYZ` varchar(30) COLLATE utf8_polish_ci DEFAULT NULL,
  `KM_HM` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ODLEGLOSC_SKRZYZ` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `KIERUNEK` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `ZSSD_KOD2` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `STREFA_ZAMIESZKALA` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `SKRZ_KOD` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `WSP_GPS_X` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `WSP_GPS_Y` varchar(30) COLLATE utf8_polish_ci NOT NULL,
  `spip_kod` varchar(2) COLLATE utf8_polish_ci NOT NULL,
  `SSUP_KOD` varchar(2) COLLATE utf8_polish_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `SZOS_KOD` (`SZOS_KOD`),
  KEY `SZRD_KOD` (`SZRD_KOD`),
  KEY `RODR_KOD` (`RODR_KOD`),
  KEY `CHMZ_KOD` (`CHMZ_KOD`),
  KEY `MIEJSCOWOSC` (`MIEJSCOWOSC`),
  KEY `STNA_KOD` (`STNA_KOD`),
  KEY `SYSW_KOD` (`SYSW_KOD`),
  KEY `SSWA_KOD` (`SSWA_KOD`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
