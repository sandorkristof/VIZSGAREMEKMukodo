-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1:3306
-- Létrehozás ideje: 2024. Feb 20. 12:06
-- Kiszolgáló verziója: 8.0.31
-- PHP verzió: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `mesa_webshop`
--
CREATE DATABASE IF NOT EXISTS `mesa_webshop` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `mesa_webshop`;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo`
--

DROP TABLE IF EXISTS `felhasznalo`;
CREATE TABLE IF NOT EXISTS `felhasznalo` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Nev` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Email` varchar(60) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Jelszo` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `felhasznalo`
--

INSERT INTO `felhasznalo` (`Id`, `Nev`, `Email`, `Jelszo`) VALUES
('3f346a55-4dcf-4466-8f02-6177e88e8036', 'testuser', 'testuser@gmail.com', '688787d8ff144c502c7f5cffaafe2cc588d86079f9de88304c26b0cb99ce91c6');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `felhasznalo_cim`
--

DROP TABLE IF EXISTS `felhasznalo_cim`;
CREATE TABLE IF NOT EXISTS `felhasznalo_cim` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Felhasz_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Irsz` int NOT NULL,
  `Telepules` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Utca` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Hazszam` int NOT NULL,
  `Emelet/Ajto` varchar(5) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci DEFAULT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Felhasz_Id` (`Felhasz_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kategoriak`
--

DROP TABLE IF EXISTS `kategoriak`;
CREATE TABLE IF NOT EXISTS `kategoriak` (
  `Id` int NOT NULL AUTO_INCREMENT,
  `Nev` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `kategoriak`
--

INSERT INTO `kategoriak` (`Id`, `Nev`) VALUES
(1, 'TV'),
(2, 'Konzolok'),
(3, 'Routerek'),
(4, 'Kamerak'),
(5, 'Laptopok'),
(6, 'Fullhallgato'),
(7, 'Monitorok'),
(8, 'Fejhallgato'),
(9, 'Egerek'),
(10, 'Billentyuzet'),
(11, 'Szekek'),
(12, 'Egerpadok'),
(13, 'Alaplapok'),
(14, 'Processzorok'),
(15, 'Géphaz'),
(16, 'Videokartya'),
(17, 'Tapegyseg'),
(18, 'Memoriak'),
(19, 'AppleTel'),
(20, 'SamsungTel'),
(21, 'XiaomiTel'),
(22, 'Pasztak'),
(23, 'Hagszorok'),
(24, 'Kabelek');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar`
--

DROP TABLE IF EXISTS `kosar`;
CREATE TABLE IF NOT EXISTS `kosar` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Felhasz_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Felhasz_Id` (`Felhasz_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `kosar_elem`
--

DROP TABLE IF EXISTS `kosar_elem`;
CREATE TABLE IF NOT EXISTS `kosar_elem` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Kosar_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Termek_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Mennyiseg` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Kosar_Id` (`Kosar_Id`),
  KEY `Termek_Id` (`Termek_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles`
--

DROP TABLE IF EXISTS `rendeles`;
CREATE TABLE IF NOT EXISTS `rendeles` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Felhasz_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Datum` date NOT NULL,
  `Cim` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Vegosszeg` int NOT NULL,
  `Allapot` int NOT NULL,
  PRIMARY KEY (`Id`),
  UNIQUE KEY `Cim` (`Cim`),
  KEY `Felhasz_Id` (`Felhasz_Id`),
  KEY `Allapot` (`Allapot`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendeles_allapot`
--

DROP TABLE IF EXISTS `rendeles_allapot`;
CREATE TABLE IF NOT EXISTS `rendeles_allapot` (
  `Id` int NOT NULL,
  `Allapot` varchar(70) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `rendelt_elem`
--

DROP TABLE IF EXISTS `rendelt_elem`;
CREATE TABLE IF NOT EXISTS `rendelt_elem` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Rendeles_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Termek_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `TermekDarab` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Rendeles_Id` (`Rendeles_Id`),
  KEY `Termek_Id` (`Termek_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek`
--

DROP TABLE IF EXISTS `termek`;
CREATE TABLE IF NOT EXISTS `termek` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Foto` mediumblob NOT NULL,
  `Kategoria_Id` int NOT NULL,
  `MarkaNev` varchar(100) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Nev` varchar(120) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Keszlet` int NOT NULL,
  `Leiras` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  `Ar` int NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Kategoria` (`Kategoria_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- A tábla adatainak kiíratása `termek`
--

INSERT INTO `termek` (`Id`, `Foto`, `Kategoria_Id`, `MarkaNev`, `Nev`, `Keszlet`, `Leiras`, `Ar`) VALUES
('00c3942e-35bc-45f7-a377-5d1ffaddfa51', '', 9, 'Logitech', 'G502 X Plus', 18, 'A G502 X PLUS Wireless RGB Gaming Mouse a világ legnépszerűbb játékegérének újragondolt változata, amely a G502 ikonikus teljesítményét fejlett játéktechnológiákkal kombinálja, hogy a lehető legjobb játékélményt nyújtsa. ', 51000),
('0d69789d-a330-4ad4-9989-32729666603f', '', 14, 'Intel', 'Core i9-10940X', 8, 'Cascade Lake Processzor, 3.3Ghz, 19MB, Socket 2066', 753000),
('1186e6fc-4695-4f68-a264-9df45199790e', '', 18, 'Silicon', 'Power', 5, '8GB memória, DDR3L, 1600MHz, CL11, 1.35V', 5700),
('196b5d93-6ea8-4e6d-b827-fbf5ac3f78f1', '', 15, 'DeepCool', 'Smarter tok', 5, 'Mini Tower, ATX, fekete', 12300),
('1a5a58bc-d325-4027-833d-d4f56a5871cb', '', 17, 'nJoy', 'Dawn 550', 5, ' tápegység, 550W, 80+ Bronze, Aktív PFC', 19550),
('1b9624fe-bd08-430a-89f5-3f2c04caac8c', '', 3, 'Tenda', 'F300', 5, '', 6000),
('1b97f654-5155-4781-bea2-f65f2665e0b0', '', 3, 'TP-Link', 'TL-WR841N', 10, '', 9000),
('1dae637d-119d-4c82-8169-24a5c56046b6', '', 20, 'Samsung', 'Galaxy S22', 5, 'Kártyafüggetlen, Dual SIM, 128GB,', 220000),
('1dd24bf4-e5e7-40c0-8fca-7d3517a3c59f', '', 10, 'White Shark', 'GK-2101HU SPARTAN-X', 5, 'Tökéletes azok számára, akik kevésbé hangos, de még mindig jelenlévő \"kattanó\" hangot szeretnek gépelés közben.', 18755),
('22c16a65-74a9-4d64-9180-006c4f06b0da', '', 10, 'Spirit of Gamer', 'CLA-PK5_HU PRO-K5', 8, 'A Pro-k5 félelmetes gépelési kényelmet kínál a félig mechanikus membránbillentyűkkel, és rendelkezik a 19 billentyűs anti-ghosting funkcióval is', 8470),
('23d7f1f5-c23e-48a8-a19c-01bc90e327ba', '', 7, 'ASUS', 'TUF VG249Q', 8, 'Gaming monitor, 23.8”, IPS, Full HD, 1 ms, 144Hz, FreeSync, HDMI, D-Sub, DP', 62350),
('26821eee-643c-4a0f-887a-1c7d77a654e9', '', 14, 'Intel', 'Core i5-10500', 5, 'Comet Lake, 3.1GHz, 12MB, 1200 Socket', 66000),
('26842e72-73ab-4ee8-8e03-42b827983f4f', '', 18, 'Corsair', 'Vengeance LPX', 5, '16GB (2x8GB) DIMM, DDR4, 3000MHz, CL15, 1.35V, XMP 2.0, fekete', 19500),
('28fac237-ae65-4ed3-b1d2-dbbf86bbf76c', '', 5, 'MSI', 'Thin GF63 12VE', 5, 'Gaming Laptop Intel Core i5-12450H processzorral akár 4,4 GHz, 15,6\", Full HD, IPS, 144 Hz, 16 GB, 1 TB SSD, NVIDIA GeForce RTX 4050 6 GB GDDR6, ingyenes operációs rendszer', 398999),
('31c95b3d-7d17-4565-b809-497a158c397d', '', 7, 'ASUS', 'TUF VG27AQ1A', 10, 'LED IPS Gaming monitor 27\", QHD, 170Hz, 1ms MPRT, FreeSync Premium, HDR10, HDMI, DP, 130% sRGB, DCI-P3 95%', 65000),
('3a1368bc-41b9-4158-8b86-c8a9e674a241', '', 3, 'Asus', 'RT-AX58U', 8, '', 45000),
('3f2550a5-dfc9-4e2e-8b90-0e244aa3fa9b', '', 1, 'Samsung', 'Samsung Smart TV 2', 12, 'Nagy felbontású Smart TV a Samsung-tól', 899),
('422b29f3-75c2-4f58-9ac2-388c922a5a81', '', 2, 'Sony', 'PlayStation Classic', 5, 'Az egyik első olyan konzol volt, amely a CD-ROM formátumot alkalmazta a játékok tárolására, és hozzájárult a játékipar jelentős változásához és fejlődéséhez.', 20000),
('44d8bd79-b4c1-475a-94e0-4381d20b57a0', '', 8, 'Logitech', 'G435', 10, 'Játsszon játékokat, hallgasson zenét, és játsszon a barátaival.', 30000),
('45d51dce-5342-45d2-bf03-088c7efae52d', '', 16, 'Sapphire', 'Radeon RX 550 Pulse', 8, 'Videokártya, 4GB GDDR5, 128-bit\r\n', 38000),
('45f4373a-414e-40b4-8aa9-84f009b8ccf4', '', 15, 'Zalman', 'S2', 8, 'Számítógépház, Middle Tower, Tápegység nélkül, ATX, Fekete', 16000),
('46fdd315-b408-4e23-80a7-687632eaabf7', '', 4, 'Sony', 'DSCHX99', 10, 'A világ legkisebb fényképezőgépe széles zoomtartománnyal', 250000),
('49dd1add-c30a-4afe-9243-e0ecb29ee38c', '', 1, 'Panasonic', 'Panasonic LED TV 2', 15, 'Energiahatékony LED TV a Panasonic-tól', 699),
('4d2328d3-4edb-45e9-b57a-ae12650cbe79', '', 9, 'Asus', 'TUF Gaming M3 Gen II', 5, 'Rendkívül könnyű, 59 grammos vezetékes egér IP56 por- és vízállósággal', 12000),
('4f80545a-2090-412e-90c7-9b46bb91a701', '', 1, 'Sony', 'Sony Bravia UHD TV 1', 8, 'Ultra HD felbontású TV a Sony Bravia sorozatból', 1099),
('512fb283-8fbf-4ed3-a3d2-04394dd09944', '', 2, 'Sony', 'PlayStation 2', 5, 'Egy ikonikus játékkonzol', 40000),
('5339e78b-fd57-41ee-b1a2-c8962748b082', '', 5, 'HP', '15s-fq2005nh', 8, '15.6\" FullHD laptop, Intel Core i5-1135G7, 8GB, 512GB PCIe SSD, Intel® Iris® Xe Graphics, Windows 10, Magyar billentyűzet', 255999),
('55504837-970a-419a-a647-afcc315a2d10', '', 11, 'Kring', 'Bokai', 8, 'Bokai', 38999),
('55749ef2-03de-42b3-bf63-7126b6e56d1e', '', 2, 'Microsoft', 'Xbox One S', 5, 'Egy kompaktabb, árérzékenyebb változata a One X-nek', 80000),
('602a9924-ce31-4df9-a92e-44bbb74849ac', '', 1, 'Toshiba', 'Toshiba Full HD TV 2', 22, 'Full HD TV a Toshiba-tól', 549),
('619f3628-9377-4e6e-bb88-2a74b35980da', '', 5, 'Acer ', 'Aspire 3 A315-23-R8BG', 8, '15.6\" FullHD laptop, AMD Ryzen™ 5 3500U, 8GB, 256GB SSD, Radeon Vega 8 Graphics, FreeDOS, Magyar billentyűzet', 154000),
('62fb1ec8-0002-4e10-b26d-a5c826d18efa', '', 13, 'Asus', 'TUF GAMING B550-PLUS', 5, ' Alaplap, Socket AM4', 56000),
('6344ace4-fa7d-4ae8-b6b3-c9743f1dd2ed', '', 5, 'ASUS ', 'VivoBook X415EA-EB516', 5, '14\" FullHD laptop, Intel Core i3-1115G4, 8GB, 256GB SSD, Intel UHD Graphics, FreeDOS, Magyar billentyűzet', 134000),
('6661d460-f96d-4d8b-8c8f-867e8790447a', '', 1, 'LG', 'LG OLED TV 3', 20, 'Lenyűgöző OLED technológiával rendelkező LG TV', 1699),
('67d581b1-ea99-4e3e-ae95-3ef69ca13f41', '', 4, 'Canon', 'IXUS 285 HS', 5, 'Ezzel a 12-szeres zoommal rendelkező vékony IXUS géppel zsebét stílussal és nagy teljesítménnyel töltheti meg. Könnyedén készíthet lenyűgöző fényképeket és Full HD videókat, és kényelmesen megoszthatja őket Wi-Fi-n és NFC-n keresztül.', 190000),
('6aa15b51-0a39-4f5d-b4c5-e572953a7179', '', 12, 'Retoo', '80x40', 5, 'világűr mintás, fekete', 1857),
('6ebe30e4-7e56-4111-8b80-5b1b7d79f59b', '', 6, 'Lenovo', 'HT38 TWS', 10, 'Vezeték nélküli fejhallgató, műanyag, Bluetooth, 13 mm, 100 dB,', 5550),
('7323b406-d7d8-4616-b76f-10c1f4db0841', '', 11, 'Kring', 'Fit', 5, ' Ergonomikus', 27000),
('738e2683-aceb-42a9-a728-2a98e634319b', '', 11, 'Zenga', 'Extreme GT', 10, 'Gamer szék,Ökobőr,Világoskék', 35000),
('77f9d637-119a-4851-918a-c7a8a42b1e8d', '', 1, 'LG', 'LG OLED TV 1', 15, 'Lenyűgöző OLED technológiával rendelkező LG TV', 1499),
('79e50d79-d5ac-40be-b981-de3e92372c08', '', 12, 'Gembird', '25x35', 8, 'Gaming Pad', 1222),
('7a3be173-8d31-4356-9f1c-a319796dec76', '', 13, 'Asus', 'AMD PRIME B550M-A', 8, 'alaplap, Socket AM4', 42000),
('7d784eee-9366-48c6-b6fb-ad21fef2a94b', '', 18, 'Kingston', 'FURY Beast', 5, 'memória, 16GB DDR4, 3200MHz, CL16, Dual Channel Kit\r\n', 17800),
('7e1fd4e3-9fa9-42e6-9d85-01c5eb4554dd', '', 3, 'D-Link', 'DIR-842', 10, '', 34000),
('7fbb2f17-46c6-4035-933d-124d20deaa73', '', 2, 'Sony', 'PlayStation 4', 5, ' Hetedik generációs konzol, és azóta is a játékipar egyik vezető platformja', 130000),
('818cf43a-1183-4fa5-8ce3-217c35b39a63', '', 2, 'Microsoft', 'Xbox One X', 5, 'Bármely más harmadik generációs konzolnál 40%-kal erősebb', 90000),
('8218d908-0152-4931-91e0-1a40471f7400', '', 2, 'Sony', 'PlayStation 3', 5, 'Az ötödik generációs konzolok közé tartozik', 70000),
('83d87612-a1c2-4ba1-ab3a-afadd245580c', '', 5, 'Lenovo', 'IdeaPad 1 15IGL7 82V7008NHV', 10, '15.6\" HD laptop, Intel Celeron N4020, 8GB, 256GB SSD, Intel® UHD Graphics 600, Windows 11 S Home, Magyar billentyűzet', 159998),
('84d098e0-f5ee-4b17-a76b-b9e9250a729d', '', 7, 'ASUS', 'VP249QGR', 5, 'In-ear, True Wireless, Bluetooth, mély basszus, IPX2, érintésvezérlés', 60999),
('8733cacc-6011-42ea-9661-16ae88ec1cdb', '', 18, 'Corsair', 'ValueSelect', 5, '8GB memória, DDR4, 2133 MHz, CL 15, 1.2V, Fekete\r\n', 8990),
('88e26f5d-e2e3-4a79-8ace-e7c581d4571a', '', 16, 'XFX Radeon', 'RX 6750 XT', 5, 'SPEEDSTER QICK 319, 12 GB GDDR6, 192 bites videókártya', 151000),
('8dc927fd-7229-4f79-843d-582fee33686e', '', 19, 'Apple', 'iPhone 15 Pro Max', 5, 'Kártyafüggetlen, 256GB, 5G,', 523000),
('911a2b01-0e78-40c0-a090-36fc29b0743e', '', 4, 'Nikon', 'COOLPIX P1000', 8, 'Élvezze a tiszta eredményeket, még akkor is, ha rendkívül nagy gyújtótávolsággal, telefotóval fényképez. NIKKOR objektív nagy rekesznyílással, f / 2,8, 16 MP képérzékelővel és RAW fájlok támogatásával.', 499000),
('951db9ef-d7af-409b-877f-b8b5ba01c368', '', 7, 'LG', '24GQ50F-B', 5, 'Ultragear Gaming Monitor 24\", FHD, VA, 165Hz, AMD Freesync, 1ms, 2x HDMI, DP', 60999),
('9bbbe5d4-4eb8-4204-8bda-3074945bc68e', '', 6, 'JBL', 'Wave 200TWS', 5, 'In-ear, True Wireless, Bluetooth, mély basszus, IPX2, érintésvezérlés,', 21999),
('9e6a3716-f422-459a-83c1-d2f5bc883e49', '', 9, 'Logitech', 'G305 LightSpeed Hero', 11, 'A HERO a Logitech G által tervezett, forradalmian új optikai érzékelő kategóriájában a legjobb teljesítménnyel és akár 10-szer takarékosabb energiafelhasználással', 21000),
('9eabab47-8ade-4ff6-ada8-093e4d063867', '', 19, 'Apple', 'iPhone 12', 5, 'Kártyafüggetlen, 64GB, 5G,', 210000),
('9f80deae-2c48-443e-881d-f5410e488435', '', 2, 'Microsoft', 'Xbox Series X', 5, 'Új szintet állít fel az erő, a sebesség és a kompatibilitás tekintetében', 55000),
('a06bee14-725c-4199-8701-bb9f2d4e3333', '', 13, 'Asus', 'TUF GAMING X570-PLUS', 8, 'Alaplap, Socket AM4', 134000),
('a0fd1126-cf70-4c0e-b114-567f9e6fc0d9', '', 1, 'Sony', 'Sony Bravia UHD TV 2', 10, 'Ultra HD felbontású TV a Sony Bravia sorozatból', 1199),
('aaf13d51-8db9-40cf-ba3c-d8adbaa5745f', '', 15, 'Thermaltake', 'Versa N21', 5, 'Számítógépház, ATX Mid Tower, táp nélkül, Fekete', 25500),
('ab3c9fcd-9744-4ace-9a28-b81fd2d7c0a9', '', 2, 'Sony', 'PlayStation 5', 5, 'A Sony legújabb generációs játékkonzolja', 200000),
('afd22c81-ae1d-4f40-9f80-2f3bf99f3398', '', 1, 'Samsung', 'Samsung Smart TV 1', 10, 'Nagy felbontású Smart TV a Samsung-tól', 799),
('b25b8574-a60e-4ace-89f9-212025148020', '', 11, 'Genesis', 'NITRO550', 8, 'Gamer szék, Fekete/Kék', 37500),
('b2dafe9b-e878-40b6-88ba-3e3654b976b1', '', 3, 'TP-Link', 'AC1200 Mesh wireless rendszer', 10, '', 40000),
('b3862c7a-478a-4244-8fb8-30e76270128d', '', 1, 'Panasonic', 'Panasonic LED TV 1', 20, 'Energiahatékony LED TV a Panasonic-tól', 599),
('b55d8adb-e5aa-4d8a-8439-c8bf5edbee98', '', 8, 'Razer', 'Kraken', 5, ' 7.1-es surround hangszoftverrel pontos hanglokalizációs audiót érhetsz el játék közben', 28000),
('b5df0b4a-5f03-4429-af40-3c9859b76546', '', 5, 'HP', '255', 8, 'Erőteljes játékkonzol a Microsoft-tól', 154000),
('b6403d34-861e-4470-87d3-b26f3ed2d598', '', 7, 'MSI', 'Optix G241', 8, 'Esport gaming monitor, 23.8”, IPS, Full HD, 1920x1080, 144Hz, 1ms, FreeSync', 62350),
('b7ba861c-e268-4fee-a956-5d122525e8d7', '', 14, 'Intel', 'Core 7 i7-11700KF', 8, 'Rocket Lake Processzor, 3,60 GHz, 16 MB, integrált grafika nélkül, Socket 1200\r\n', 123000),
('be754c41-02f4-4ab9-9ae9-d652b30add96', '', 16, 'Asus', 'GeForce RTX 3060', 8, 'OC V2 Videokártya, 12 GB GDDR6, 192 bites', 128000),
('c1ed7727-fdd9-4623-a418-5f8242ed32eb', '', 21, 'Xiaomi', 'Redmi 13C', 5, 'Kártyafüggetlen, Dual SIM. 128GB, 4GB RAM, LTE', 50900),
('c49d1beb-c046-4e3b-8a38-e771de9250e1', '', 10, 'Logitech', 'K400', 10, 'Vezeték nélküli billentyűzet touch paddal', 18999),
('c79b93f2-2444-4d71-80ba-5681be0fa2c2', '', 20, 'Samsung', 'Galaxy A54', 5, 'Kártyafüggetlen, Dual SIM, 128GB,', 145000),
('c7f25db9-fd8b-4333-a103-9f2bde555191', '', 8, 'Logitech', 'G PRO', 8, 'A kristálytiszta hangkommunikációval kapcsolatot tarthat a csapatával.', 45000),
('ca496255-bdcd-46eb-a2b1-8456018bb981', '', 10, 'Razer', 'Ornata Chroma', 8, 'A puha érintés és az éles, érezhető kattanás ötvözésével a Razer Ornata Chroma bemutatja a mecha-membrán gépelési élményt, amely gyors és precíz', 31090),
('cd7e3798-1fe1-473d-a766-3222cf90faaf', '', 20, 'Samsung', 'Galaxy M53', 5, '5G Mobiltelefon, Dual SIM, 128GB, 6GB RAM,', 190000),
('d0813ba3-a02c-409e-a285-bacded09a729', '', 6, 'Apple', 'AirPods 2 ', 8, 'Vezeték nélküli gyári fülhallgató, vezetékes töltőtokkal', 55000),
('d401a540-2916-4507-945b-78f214c2fc26', '', 8, 'Razer', 'Kraken X', 5, 'Ultrakönnyű és kényelmes kivitelezés a non-stop játékélményért', 22000),
('d699344d-d5f9-4985-8b0f-da231b9dbff6', '', 18, 'Team', 'Group', 5, '4GB, DDR3, 1600MHz, Cl11', 4999),
('d7051825-f097-4dc0-baf1-cc65299be660', '', 19, 'Apple', 'iPhone 13', 5, 'Mobiltelefon, Kártyafüggetlen, 128GB, 5G, Kék', 250000),
('d8a0ea06-f259-43bb-81c2-a3f27508ca85', '', 21, 'Xiaomi', 'Redmi 12', 5, '8 GB RAM, 256 GB,', 71000),
('d94f422a-f780-4f92-bbe2-f51dda22d402', '', 2, 'Microsoft', 'Xbox 360', 5, 'Az erőteljes hardver és az online funkcionalitás', 55000),
('de474bd0-6b4e-4602-a406-fa1ad5d463cf', '', 3, 'TP-Link', 'Archer C6', 8, '', 15000),
('de9210be-a115-44f4-9c27-612612150a27', '', 1, 'Toshiba', 'Toshiba Full HD TV 1', 25, 'Full HD TV a Toshiba-tól', 499),
('deb32d80-2db3-49fb-a591-ab83e008e7a4', '', 17, 'Segotep', 'GTR-550', 5, 'Tápegység, 550W, PFC Activ', 25600),
('df8756f7-e063-4e93-999e-e29f68fbd028', '', 5, 'Apple', 'MacBook Air', 5, '13\" laptop, Apple M1 chip 8 core CPU, 8GB, 256GB, Apple 7 core GPU, macOS Big Sur, Magyar billentyűzet', 378999),
('e41ca184-d59b-43b2-88e1-12ff770b0b05', '', 12, 'Gembird', '350x900', 5, 'gamer egérpad, fekete', 3200),
('e4c0f223-0367-4106-ad05-bd78d25f71ee', '', 10, 'Trust', '23089 GXT 865', 8, 'Mechanikus billentyűzet játékosoknak gyors reagálású kapcsolókkal, 7 színmóddal és játékmód funkcióval', 25350),
('e70c7982-096c-4d1c-91f3-6997af75cb12', '', 17, 'Chieftec', 'GPE-700S', 8, '700W,tápegység', 26100),
('e7987aa9-e508-4140-b324-7172a76cacd0', '', 19, 'Apple', 'iPhone 11', 5, 'Kártyafüggetlen, 64GB, LTE,', 180000),
('e83b6ea8-1a88-49ed-a221-a8652fc3b7cb', '', 9, 'Razer', 'DeathAdder Essential 2021', 10, 'A Razer DeathAdder termékcsalád több mint egy évtizede a globális esport-aréna egyik főszereplője', 8599),
('f1389f51-6ddd-421c-b022-5d4e4253b13d', '', 1, 'Samsung', 'Samsung Smart TV 3', 14, 'Nagy felbontású Smart TV a Samsung-tól', 849),
('f418352a-fdcf-46ba-b46b-98153c9d1ab9', '', 11, 'Serioux', 'X-GC01-2D-R', 5, 'Gamer szék, Fekete/Piros', 65400),
('f5232386-6558-45a8-8e7e-4f0dabd4efb1', '', 1, 'LG', 'LG OLED TV 2', 18, 'Lenyűgöző OLED technológiával rendelkező LG TV', 1599),
('f5e32c2d-743b-4cf7-9808-71ee5f3e56e1', '', 13, 'MSI', 'MAG B550 TOMAHAWK', 5, 'Alaplap, AM4 foglalat', 55000),
('f89e15d6-9e40-424f-a2a8-8e4a2709d934', '', 8, 'HyperX', 'Cloud II', 8, 'A HyperX Cloudot úgy építették, hogy egy rendkívül kényelmes, elképesztő hangzással rendelkező játék headset legyen', 40000),
('fa92389d-0adf-4d1e-ad1a-19594f15a6d8', '', 14, 'Intel', 'Core™ i3-10100', 10, 'Comet Lake, 3.6GHz, 6MB, 1200 socket', 33000),
('ff102acb-e3cc-47d0-acac-d94f03486908', '', 13, 'Asus', 'ROG STRIX B550-F', 5, 'GAMING alaplap, Socket AM4', 70000);

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `termek_ertekeles`
--

DROP TABLE IF EXISTS `termek_ertekeles`;
CREATE TABLE IF NOT EXISTS `termek_ertekeles` (
  `Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Felhasznalo_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Termek_Id` char(36) CHARACTER SET ascii COLLATE ascii_general_ci NOT NULL,
  `Ertekeles` int NOT NULL,
  `Ertekeles_Szoveg` varchar(200) CHARACTER SET utf8mb3 COLLATE utf8mb3_hungarian_ci NOT NULL,
  PRIMARY KEY (`Id`),
  KEY `Felhasznalo_Id` (`Felhasznalo_Id`),
  KEY `Termek_Id` (`Termek_Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_hungarian_ci;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `felhasznalo_cim`
--
ALTER TABLE `felhasznalo_cim`
  ADD CONSTRAINT `felhasznalo_cim_ibfk_1` FOREIGN KEY (`Felhasz_Id`) REFERENCES `felhasznalo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kosar`
--
ALTER TABLE `kosar`
  ADD CONSTRAINT `kosar_ibfk_1` FOREIGN KEY (`Felhasz_Id`) REFERENCES `felhasznalo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `kosar_elem`
--
ALTER TABLE `kosar_elem`
  ADD CONSTRAINT `kosar_elem_ibfk_1` FOREIGN KEY (`Kosar_Id`) REFERENCES `kosar` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `kosar_elem_ibfk_2` FOREIGN KEY (`Termek_Id`) REFERENCES `termek` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendeles`
--
ALTER TABLE `rendeles`
  ADD CONSTRAINT `rendeles_ibfk_1` FOREIGN KEY (`Allapot`) REFERENCES `rendeles_allapot` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendeles_ibfk_2` FOREIGN KEY (`Cim`) REFERENCES `felhasznalo_cim` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendeles_ibfk_3` FOREIGN KEY (`Felhasz_Id`) REFERENCES `felhasznalo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `rendelt_elem`
--
ALTER TABLE `rendelt_elem`
  ADD CONSTRAINT `rendelt_elem_ibfk_1` FOREIGN KEY (`Rendeles_Id`) REFERENCES `rendeles` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `rendelt_elem_ibfk_2` FOREIGN KEY (`Termek_Id`) REFERENCES `termek` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `termek`
--
ALTER TABLE `termek`
  ADD CONSTRAINT `termek_ibfk_2` FOREIGN KEY (`Kategoria_Id`) REFERENCES `kategoriak` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Megkötések a táblához `termek_ertekeles`
--
ALTER TABLE `termek_ertekeles`
  ADD CONSTRAINT `termek_ertekeles_ibfk_1` FOREIGN KEY (`Felhasznalo_Id`) REFERENCES `felhasznalo` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `termek_ertekeles_ibfk_2` FOREIGN KEY (`Termek_Id`) REFERENCES `termek` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
