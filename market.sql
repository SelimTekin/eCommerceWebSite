-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 25 May 2022, 22:44:20
-- Sunucu sürümü: 10.4.22-MariaDB
-- PHP Sürümü: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `market`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `firmalar`
--

CREATE TABLE `firmalar` (
  `firma_id` int(10) UNSIGNED NOT NULL,
  `firma_adi` varchar(50) DEFAULT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `tel` int(11) DEFAULT NULL,
  `fax` varchar(11) DEFAULT NULL,
  `eposta` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `kategori_id` int(10) UNSIGNED NOT NULL,
  `kategori_adi` varchar(30) DEFAULT NULL,
  `kdv_orani` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`kategori_id`, `kategori_adi`, `kdv_orani`) VALUES
(1, 'otruma_odasi', NULL),
(2, 'mutfak', NULL),
(3, 'yatak_odasi', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `musteriler`
--

CREATE TABLE `musteriler` (
  `musteri_id` int(10) UNSIGNED NOT NULL,
  `ad` varchar(30) NOT NULL,
  `soyad` varchar(30) DEFAULT NULL,
  `cep_tel` int(11) NOT NULL,
  `eposta` varchar(50) NOT NULL,
  `adres` varchar(100) DEFAULT NULL,
  `sifre` varchar(30) NOT NULL,
  `kullaniciAdi` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `musteriler`
--

INSERT INTO `musteriler` (`musteri_id`, `ad`, `soyad`, `cep_tel`, `eposta`, `adres`, `sifre`, `kullaniciAdi`) VALUES
(13, 'selim', NULL, 1, 'selim@mail.com', NULL, '$2y$10$u8gZ2k82UKqlkDjB/1BejuI', ''),
(14, 'selim2', NULL, 12, 'selim2@mail.com', NULL, '$2y$10$L7VtdLeItdHMPoPh0nrRq.o', ''),
(18, 'deneme', NULL, 1, 'deneme@mail.com', NULL, '202cb962ac59075b964b07152d234b', ''),
(19, 'Endo', 'pukonto', 123, 'pikachu@mail.com', NULL, '$2y$10$Jksuabk6eAe8s.6DhAVIbeO', 'reza'),
(20, 'selim', 'tekin', 123, 'selim@mail.com', NULL, '$2y$10$OTwquI7iBoQ1J4Q9vdTktef', 'selim'),
(21, 'yavuz', 'koz', 1234567, 'yavuz@mail.com', NULL, '$2y$10$HW79iW/QU.hbY0Y4AEyeYeR', 'yavuz'),
(22, 'yavuz1', 'koz', 1321653, 'yavuz@mail.com', NULL, '$2y$10$/fphgQuIDoqdmic9vPTNC.A', 'yavuz'),
(23, 'armagan', 'filizli', 456, 'arm@mail.com', NULL, '$2y$10$i.L0nV3DWUSywXqRENhXx.g', 'arm'),
(24, 'Endo', 'koz', 12, 'deneme1@mail.com', NULL, '$2y$10$pUcpKSEGv3XfEikOS6kF/uk', 'endo'),
(25, 'Endo', 'koz', 123456, 'endo1@mail.com', NULL, '$2y$10$Yi2F/brWQrIw/hmr4xI.vOy', 'endo1'),
(26, 'endo2', NULL, 123, 'endo2@mail.com', NULL, '1', ''),
(27, 'selim5', NULL, 123, 'selim5@mail.com', NULL, 'c4ca4238a0b923820dcc509a6f7584', '');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparisler`
--

CREATE TABLE `siparisler` (
  `siparis_id` int(10) UNSIGNED NOT NULL,
  `tarih` date DEFAULT NULL,
  `musteri_id` int(10) UNSIGNED DEFAULT NULL,
  `fis_adedi` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `siparisler`
--

INSERT INTO `siparisler` (`siparis_id`, `tarih`, `musteri_id`, `fis_adedi`) VALUES
(2, NULL, NULL, NULL),
(3, '2022-04-25', NULL, NULL),
(4, '2022-04-25', NULL, NULL),
(5, '2022-04-25', NULL, NULL),
(6, '2022-04-25', NULL, NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis_detay`
--

CREATE TABLE `siparis_detay` (
  `detay_id` int(10) UNSIGNED NOT NULL,
  `siparis_id` int(10) UNSIGNED DEFAULT NULL,
  `urun_id` int(10) UNSIGNED DEFAULT NULL,
  `adet` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `siparis_detay`
--

INSERT INTO `siparis_detay` (`detay_id`, `siparis_id`, `urun_id`, `adet`) VALUES
(215, NULL, 1, 16),
(216, NULL, 2, 10),
(217, NULL, 5, 10),
(218, NULL, 6, 1);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `urunler`
--

CREATE TABLE `urunler` (
  `urun_id` int(10) UNSIGNED NOT NULL,
  `urun_adi` varchar(30) DEFAULT NULL,
  `kategori_id` int(10) UNSIGNED DEFAULT NULL,
  `firma_id` int(10) UNSIGNED DEFAULT NULL,
  `alis_fiyat` decimal(13,2) DEFAULT NULL,
  `satis_fiyat` decimal(13,2) DEFAULT NULL,
  `stok_adedi` int(11) DEFAULT NULL,
  `barkod_no` int(11) DEFAULT NULL,
  `urun_foto` varchar(30) NOT NULL,
  `urun_detay` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Tablo döküm verisi `urunler`
--

INSERT INTO `urunler` (`urun_id`, `urun_adi`, `kategori_id`, `firma_id`, `alis_fiyat`, `satis_fiyat`, `stok_adedi`, `barkod_no`, `urun_foto`, `urun_detay`) VALUES
(1, 'İstikbal Koltuk', 1, NULL, '300.00', '500.00', NULL, NULL, 'koltuk1.webp', 'Ahretlik Divan'),
(2, 'İstikbal Koltuk', 1, NULL, '200.00', '400.00', NULL, NULL, 'koltuk2.webp', 'Yumuşak cennet'),
(5, 'Endo Koltuk', 1, NULL, '100.00', '190.70', NULL, NULL, 'koltuk3.jpg', 'Tropikal koltuk'),
(6, 'Borobudur koltuk', 1, NULL, '100.00', '300.00', NULL, NULL, 'koltuk4.webp', 'Güçlü ve uyumlu'),
(7, 'Sunda Halı', 1, NULL, '500.00', '700.00', NULL, NULL, 'halı1.jpg', 'İnce beyaz halı'),
(8, 'Java Halı', 1, NULL, '400.00', '600.00', NULL, NULL, 'halı2.webp', 'Tropikal halı'),
(9, 'Minang Halı', 1, NULL, '300.00', '500.00', NULL, NULL, 'halı3.webp', 'Artistik halı'),
(10, 'Suang Halı', 1, NULL, '200.00', '400.00', NULL, NULL, 'halı4.webp', 'Uygun ve güzel'),
(19, 'Osmanlı Sehpa', 1, NULL, '100.00', '300.00', NULL, NULL, 'sehpa1.jpg', 'Sağlam sehpa'),
(20, 'Osmanlı Sehpa', 1, NULL, '200.00', '400.00', NULL, NULL, 'sehpa2.webp', 'Geniş sehpa'),
(21, 'Osmanlı Sehpa', 1, NULL, '300.00', '500.00', NULL, NULL, 'sehpa3.jpg', 'Misafirlere uygun'),
(22, 'Endo Sehpa', 1, NULL, '400.00', '600.00', NULL, NULL, 'sehpa4.jpg', 'Beyaz sehpa'),
(23, 'Deniz ÇBT', 2, NULL, '100.00', '300.00', NULL, NULL, 'çbt1.webp', 'Çatal Bıçak Takımı'),
(24, 'Wessenburg ÇBT', 2, NULL, '200.00', '400.00', NULL, NULL, 'çbt2.jpg', 'Paslanmaz takım'),
(26, 'Sahra ÇBT', 2, NULL, '300.00', '500.00', NULL, NULL, 'çbt3.jpg', 'Çatal Bıçak Takımı'),
(27, 'Nehir ÇBT', 2, NULL, '400.00', '600.00', NULL, NULL, 'çbt4.jpg', 'Çatal Bıçak Takımı'),
(28, 'Karmen çaydanlık', 2, NULL, '100.00', '300.00', NULL, NULL, 'çaydanlık1.jpg', 'Orta boy Çaydanlık'),
(29, 'çaydanlık', 2, NULL, '200.00', '400.00', NULL, NULL, 'çaydanlık2.jpg', 'çaydanlık'),
(30, 'Shaffer Çaydanlık', 2, NULL, '300.00', '500.00', NULL, NULL, 'çaydanlık3.jpg', 'Buyuk çaydanlık'),
(31, 'Nehir Çaydannlık', 2, NULL, '400.00', '600.00', NULL, NULL, 'çaydanlık4.jpg', 'çaydanlık'),
(32, 'Tabak', 2, NULL, '100.00', '300.00', NULL, NULL, 'tabak1.webp', 'tabak'),
(33, 'tabak', 2, NULL, '200.00', '400.00', NULL, NULL, 'tabak2.jpg', 'tabak'),
(34, 'tabak', 2, NULL, '300.00', '500.00', NULL, NULL, 'tabak3.webp', 'tabak'),
(35, 'tabak', 2, NULL, '400.00', '600.00', NULL, NULL, 'tabak4.webp', 'tabak'),
(36, 'Endo Nevresim', 3, NULL, '100.00', '300.00', NULL, NULL, 'nevresim1.jpg', 'Yumuşak nevresim'),
(37, 'Java Nevresim', 3, NULL, '200.00', '400.00', NULL, NULL, 'nevresim2.jpg', 'Artistik nevresim'),
(38, 'Sunda Nevresim', 3, NULL, '300.00', '500.00', NULL, NULL, 'nevresim3.jpg', 'Tropik nevresim'),
(39, 'Saten nevresim', 3, NULL, '400.00', '600.00', NULL, NULL, 'nevresim4.jpg', 'Çift kişilik'),
(40, 'Endo komodin', 3, NULL, '100.00', '300.00', NULL, NULL, 'komodin1.jpg', 'Tropıkal komodin'),
(41, 'Sunda komodin', 3, NULL, '200.00', '400.00', NULL, NULL, 'komodin2.jpg', 'Artitistik komodin'),
(42, 'Osmanlı komodin', 3, NULL, '300.00', '500.00', NULL, NULL, 'komodin3.jpg', 'Uygunluk komodin'),
(43, 'Simurg komodin', 3, NULL, '400.00', '600.00', NULL, NULL, 'komodin4.jpg', '2 Cekmeçeli komodin Atlanyik cam'),
(44, 'Modabilya ayna', 3, NULL, '100.00', '300.00', NULL, NULL, 'ayna1.jpg', 'Metal duvar ayna'),
(45, 'Endo ayna', 3, NULL, '200.00', '400.00', NULL, NULL, 'ayna2.jpg', 'Tropikal ayna'),
(46, 'Sunda ayna', 3, NULL, '300.00', '500.00', NULL, NULL, 'ayna3.jpg', 'Beyaz Duvar ayna'),
(47, 'Marsah ayna', 3, NULL, '400.00', '600.00', NULL, NULL, 'ayna4.jpg', 'Oval ayaklı boy aynası'),
(48, 'Marsiele ayna', 3, NULL, '400.00', '600.00', NULL, NULL, 'ayna4.jpg', 'Artistik ayna');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `firmalar`
--
ALTER TABLE `firmalar`
  ADD PRIMARY KEY (`firma_id`);

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`kategori_id`);

--
-- Tablo için indeksler `musteriler`
--
ALTER TABLE `musteriler`
  ADD PRIMARY KEY (`musteri_id`);

--
-- Tablo için indeksler `siparisler`
--
ALTER TABLE `siparisler`
  ADD PRIMARY KEY (`siparis_id`),
  ADD KEY `musteri_id` (`musteri_id`);

--
-- Tablo için indeksler `siparis_detay`
--
ALTER TABLE `siparis_detay`
  ADD PRIMARY KEY (`detay_id`),
  ADD KEY `siparis_id` (`siparis_id`),
  ADD KEY `urun_id` (`urun_id`);

--
-- Tablo için indeksler `urunler`
--
ALTER TABLE `urunler`
  ADD PRIMARY KEY (`urun_id`),
  ADD KEY `firma_id` (`firma_id`),
  ADD KEY `FK_KategoriId` (`kategori_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `firmalar`
--
ALTER TABLE `firmalar`
  MODIFY `firma_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `kategori_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Tablo için AUTO_INCREMENT değeri `musteriler`
--
ALTER TABLE `musteriler`
  MODIFY `musteri_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Tablo için AUTO_INCREMENT değeri `siparisler`
--
ALTER TABLE `siparisler`
  MODIFY `siparis_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Tablo için AUTO_INCREMENT değeri `siparis_detay`
--
ALTER TABLE `siparis_detay`
  MODIFY `detay_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=219;

--
-- Tablo için AUTO_INCREMENT değeri `urunler`
--
ALTER TABLE `urunler`
  MODIFY `urun_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `siparisler`
--
ALTER TABLE `siparisler`
  ADD CONSTRAINT `siparisler_ibfk_1` FOREIGN KEY (`musteri_id`) REFERENCES `musteriler` (`musteri_id`);

--
-- Tablo kısıtlamaları `siparis_detay`
--
ALTER TABLE `siparis_detay`
  ADD CONSTRAINT `siparis_detay_ibfk_1` FOREIGN KEY (`siparis_id`) REFERENCES `siparisler` (`siparis_id`),
  ADD CONSTRAINT `siparis_detay_ibfk_2` FOREIGN KEY (`urun_id`) REFERENCES `urunler` (`urun_id`);

--
-- Tablo kısıtlamaları `urunler`
--
ALTER TABLE `urunler`
  ADD CONSTRAINT `FK_KategoriId` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `urunler_ibfk_1` FOREIGN KEY (`kategori_id`) REFERENCES `kategoriler` (`kategori_id`),
  ADD CONSTRAINT `urunler_ibfk_2` FOREIGN KEY (`firma_id`) REFERENCES `firmalar` (`firma_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
