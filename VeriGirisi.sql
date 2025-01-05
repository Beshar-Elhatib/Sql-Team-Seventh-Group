INSERT INTO Kisiler (adi, soyadi, telefon, eposta, adres)
VALUES
('Ahmet', 'Yılmaz', '5551000000', 'ahmet1@example.com', 'İstanbul, Türkiye'),
('Mehmet', 'Kaya', '5551000001', 'mehmet1@example.com', 'Ankara, Türkiye'),
('Ali', 'Şahin', '5551000002', 'ali1@example.com', 'Bursa, Türkiye'),
('Hasan', 'Öztürk', '5551000003', 'hasan1@example.com', 'Adana, Türkiye'),
('Kemal', 'Çelik', '5551000004', 'kemal1@example.com', 'Eskişehir, Türkiye'),
('Hüseyin', 'Demir', '5551000005', 'huseyin1@example.com', 'Konya, Türkiye'),
('Murat', 'Koç', '5551000006', 'murat1@example.com', 'Gaziantep, Türkiye'),
('İsmail', 'Yıldız', '5551000007', 'ismail1@example.com', 'Samsun, Türkiye'),
('Mehmet', 'Arslan', '5551000008', 'mehmet2@example.com', 'Bolu, Türkiye'),
('Cem', 'Güney', '5551000009', 'cem1@example.com', 'Kayseri, Türkiye'),
('Selim', 'Uysal', '5551000010', 'selim1@example.com', 'Mersin, Türkiye'),
('Fatih', 'Aydın', '5551000011', 'fatih1@example.com', 'Malatya, Türkiye'),
('Ömer', 'Kara', '5551000012', 'omer1@example.com', 'Denizli, Türkiye'),
('Veli', 'Günay', '5551000013', 'veli1@example.com', 'Sakarya, Türkiye'),
('Sefa', 'Özdemir', '5551000014', 'sefa1@example.com', 'Ordu, Türkiye'),
('Tuncay', 'Gündoğdu', '5551000015', 'tuncay1@example.com', 'Trabzon, Türkiye'),
('Serkan', 'Kılıç', '5551000016', 'serkan1@example.com', 'Burdur, Türkiye'),
('Hikmet', 'Aslan', '5551000017', 'hikmet1@example.com', 'Çorum, Türkiye'),
('Rıza', 'Demirtaş', '5551000018', 'riza1@example.com', 'Zonguldak, Türkiye'),
('Yusuf', 'Karaaslan', '5551000019', 'yusuf1@example.com', 'Tekirdağ, Türkiye'),
('Ahmet', 'Yılmaz', '5551000020', 'ahmet2@example.com', 'İzmir, Türkiye'),
('Mehmet', 'Kaya', '5551000021', 'mehmet2@example.com', 'Antalya, Türkiye'),
('Ali', 'Şahin', '5551000022', 'ali2@example.com', 'Eskişehir, Türkiye'),
('Hasan', 'Öztürk', '5551000023', 'hasan2@example.com', 'Trabzon, Türkiye'),
('Kemal', 'Çelik', '5551000024', 'kemal2@example.com', 'Adana, Türkiye'),
('Hüseyin', 'Demir', '5551000025', 'huseyin2@example.com', 'Bursa, Türkiye'),
('Murat', 'Koç', '5551000026', 'murat2@example.com', 'Samsun, Türkiye'),
('İsmail', 'Yıldız', '5551000027', 'ismail2@example.com', 'Mersin, Türkiye'),
('Mehmet', 'Arslan', '5551000028', 'mehmet3@example.com', 'Kocaeli, Türkiye'),
('Cem', 'Güney', '5551000029', 'cem2@example.com', 'Şanlıurfa, Türkiye'),
('Selim', 'Uysal', '5551000030', 'selim2@example.com', 'Kayseri, Türkiye'),
('Fatih', 'Aydın', '5551000031', 'fatih2@example.com', 'Ankara, Türkiye'),
('Ömer', 'Kara', '5551000032', 'omer2@example.com', 'Bolu, Türkiye'),
('Veli', 'Günay', '5551000033', 'veli2@example.com', 'Gaziantep, Türkiye'),
('Sefa', 'Özdemir', '5551000034', 'sefa2@example.com', 'İzmir, Türkiye'),
('Tuncay', 'Gündoğdu', '5551000035', 'tuncay2@example.com', 'Aydın, Türkiye'),
('Serkan', 'Kılıç', '5551000036', 'serkan2@example.com', 'Manisa, Türkiye'),
('Hikmet', 'Aslan', '5551000037', 'hikmet2@example.com', 'Denizli, Türkiye'),
('Rıza', 'Demirtaş', '5551000038', 'riza2@example.com', 'Konya, Türkiye'),
('Yusuf', 'Karaaslan', '5551000039', 'yusuf2@example.com', 'Bursa, Türkiye');


-- Kemer seviyelerinin tabloya eklenmesi
INSERT INTO KemerSeviyesi (kemerRengi)
VALUES
('Beyaz Kemer'),  -- Beyaz kemer seviyesi
('Sarı Kemer'),   -- Sarı kemer seviyesi
('Turuncu Kemer'), -- Turuncu kemer seviyesi
('Yeşil Kemer'),  -- Yeşil kemer seviyesi
('Mavi Kemer'),   -- Mavi kemer seviyesi
('Mor Kemer'),    -- Mor kemer seviyesi
('Kahverengi Kemer'), -- Kahverengi kemer seviyesi
('Siyah Kemer');  -- Siyah kemer seviyesi



-- 7 Eğitmenin Karate ile ilgili becerileri ile eklenmesi
INSERT INTO Egitmenler (kisiId, yetenekleri)
VALUES
(1, 'Savaş teknikleri , geleneksel dövüş sanatları'),
(2, 'Temel hareketler eğitimi, savunma teknikleri, hareket analizi'),
(3, 'Savunma taktiği, dövüş analizi'),
(22, 'Fiziksel eğitim, hızlı tepki teknikleri, ileri dövüş teknikleri'),
(32, 'Hücum taktiği, karmaşık hareket eğitimi'),
(33, 'Denge çalışması, hareket koordinasyonu, ileri kata teknikleri'),
(38, 'Hızlı hareket eğitimi,  kas gücü geliştirme');


-- 33 Üyenin Uyeler tablosuna eklenmesi
INSERT INTO Uyeler (kisiId, aktifMi, kemerId)
VALUES
(4, 0, 4),
(5, 0, 5),
(6, 0, 6),
(7, 0, 7),
(8, 0, 1),
(9, 0, 2),
(10, 0, 3),
(11, 0, 4),
(12, 0, 5),
(13, 0, 6),
(14, 0, 7),
(15, 0, 1),
(16, 0, 2),
(17, 0, 3),
(18, 0, 4),
(19, 0, 5),
(20, 0, 6),
(21, 0, 7),
(23, 0, 2),
(24, 0, 3),
(25, 0, 4),
(26, 0, 5),
(27, 0, 6),
(28, 0, 7),
(29, 0, 1),
(30, 0, 2),
(31, 0, 3),
(34, 0, 4),
(35, 0, 5),
(36, 0, 1),
(37, 0, 1),
(39, 0, 2),
(40, 0, 3);





INSERT INTO Odemeler (odemeTarihi, paraMiktari)
VALUES 
('2026-01-03', 2000);




INSERT INTO EgitmenKontrati (egitmenId, oId, kontratBaslangicTarihi, kontratBitisTarihi)
VALUES
(38, 52, '2026-01-03', '2028-01-03'),
(33, 47, '2026-02-01', '2029-02-01'),
(3, 5, '2024-03-01', '2028-03-01'),
(22, 27, '2024-01-01', '2028-01-01');




INSERT INTO Uyelik (kisiId, oId, baslangicTarih, bitisTarih)
VALUES
(5, 6, '2024-01-01', '2026-01-01'),
(6, 7, '2024-02-01', '2026-02-01'),
(7, 8, '2024-03-01', '2025-03-01'),
(8, 9, '2024-04-01', '2025-04-01'),
(9, 10, '2024-05-01', '2025-05-01'),
(10, 11, '2024-06-01', '2025-06-01'),
(11, 12, '2024-07-01', '2025-07-01'),
(12, 13, '2024-08-01', '2027-08-01'),
(19, 14, '2024-09-01', '2028-09-01'),
(20, 15, '2024-10-01', '2025-10-01'),
(21, 16, '2024-11-01', '2026-11-01'),
(4, 17, '2024-12-01', '2026-12-01'),
(13, 18, '2024-01-01', '2026-01-01'),
(14, 19, '2024-02-01', '2025-02-01'),
(15, 24, '2024-03-01', '2025-03-01'),
(16, 21, '2024-04-01', '2025-04-01'),
(17, 25, '2024-05-01', '2025-05-01'),
(18, 26, '2024-06-01', '2025-06-01');



INSERT INTO Uyelik (kisiId, oId, baslangicTarih, bitisTarih)
VALUES
(23, 37, '2024-01-01', '2026-01-01'),
(24, 38, '2024-02-01', '2026-02-01'),
(25, 39, '2024-03-01', '2025-03-01'),
(26, 40, '2024-04-01', '2025-04-01'),
(27, 41, '2024-05-01', '2025-05-01'),
(28, 42, '2024-06-01', '2025-06-01'),
(29, 43, '2024-07-01', '2025-07-01'),
(30, 44, '2024-08-01', '2027-08-01'),
(31, 45, '2024-08-01', '2027-08-01');




INSERT INTO Uyelik (kisiId, oId, baslangicTarih, bitisTarih)
VALUES
(34, 48, '2026-01-01', '2027-01-01'),
(35, 49, '2026-02-01', '2027-02-01'),
(36, 50, '2026-03-01', '2027-03-01'),
(37, 51, '2026-04-01', '2027-04-01');



INSERT INTO Uyelik (kisiId, oId, baslangicTarih, bitisTarih)
VALUES
(39, 53, '2026-01-01', '2027-01-01'),
(40, 54, '2026-02-01', '2027-02-01'),
(36, 50, '2026-03-01', '2027-03-01'),
(37, 51, '2026-04-01', '2027-04-01');

   
 INSERT INTO Antrenman (kisiId, eId)
VALUES
(4, 1),
(5, 2),
(6, 3),
(7, 22),
(8, 32),
(9, 33),
(10, 38),
(11, 1),
(12, 2),
(13, 3),
(14, 22),
(15, 32),
(16, 33),
(17, 38),
(18, 1),
(19, 2),
(20, 3),
(21, 22),
(23, 32),
(24, 33),
(25, 38),
(26, 1),
(27, 2),
(28, 3),
(29, 22),
(30, 32),
(31, 33),
(34, 38),
(35, 1),
(36, 2),
(37, 3),
(39, 22),
(40, 32),
(4, 33),
(5, 38),
(6, 1),
(7, 2),
(8, 3),
(9, 22),
(10, 32);


INSERT INTO Antrenman (kisiId, eId)
VALUES
(11, 33),
(12, 38),
(13, 1),
(14, 2),
(15, 3),
(16, 22),
(17, 32),
(18, 33),
(19, 38),
(20, 1),
(21, 2),
(23, 3),
(24, 22),
(25, 32),
(26, 33),
(27, 38),
(28, 1),
(29, 2),
(30, 3),
(31, 22),
(34, 32),
(35, 33),
(36, 38),
(37, 1),
(39, 2),
(40, 3),
(4, 22),
(5, 32),
(6, 33),
(7, 38),
(8, 1),
(9, 2),
(10, 3),
(11, 22),
(12, 32),
(13, 33),
(14, 38),
(15, 1),
(16, 2),
(17, 3),
(18, 22);


INSERT INTO Antrenman (kisiId, eId)
VALUES
(4, 38),
(5, 1),
(6, 2),
(7, 3),
(8, 22),
(9, 32),
(10, 33),
(11, 38),
(12, 1),
(13, 2),
(14, 3),
(15, 22),
(16, 32),
(17, 33),
(18, 38),
(19, 1),
(20, 2),
(21, 3),
(23, 22),
(24, 32),
(25, 33),
(26, 38),
(27, 1),
(28, 2),
(29, 3),
(30, 22),
(31, 32),
(34, 33),
(35, 38),
(36, 1),
(37, 2),
(39, 3),
(40, 22),
(4, 32),
(5, 33),
(6, 38),
(7, 1),
(8, 2),
(9, 3);






INSERT INTO SinavMerkezi (kisiId, kemerId, oId, eId, sinavTarihi, sonuc)
VALUES (39,3 ,1095 , 38, '2026-03-05', 0);




INSERT INTO Odemeler (odemeTarihi, paraMiktari)
VALUES 
('2026-02-05', 12000);




INSERT INTO Yarismalar (yarismaAdi, yarismaTarihi)
VALUES
('Gaziantep Olimpiyatları', '2025-01-10'),
('Kilis Olimpiyatları', '2025-01-15'),
('Şanlıurfa Olimpiyatları', '2025-01-20'),
('Adana Olimpiyatları', '2025-01-25'),
('Hatay Olimpiyatları', '2025-02-01'),
('Mersin Olimpiyatları', '2025-02-10'),
('Antalya Olimpiyatları', '2025-02-15'),
('İzmir Olimpiyatları', '2025-02-20'),
('Bursa Olimpiyatları', '2025-03-01'),
('Konya Olimpiyatları', '2025-03-10'),
('Ankara Olimpiyatları', '2025-03-15'),
('İstanbul Olimpiyatları', '2025-03-20'),
('Trabzon Olimpiyatları', '2025-03-25'),
('Diyarbakır Olimpiyatları', '2025-04-01'),
('Van Olimpiyatları', '2025-04-10');


select * from Yarismalar;
select * from  Uyeler;
select * from  KemerSeviyesi;
select * from  Odemeler;
select * from  SinavMerkezi;
select * from Egitmenler;
select * from Odulleri;
select * from YarismaKatilim;




INSERT INTO YarismaKatilim (yId, kisiId, kazandi)
VALUES 
(2, 8, 0),
(3, 9, 0),
(4, 10,1),
(5, 11, 0),
(6, 12, 0),
(7, 13, 0),
(8, 14, 0),
(9, 15, 0),
(10, 16, 1),
(11, 17, 0),
(12, 18, 0),
(13, 19, 0),
(14, 20, 0),
(15, 21, 1);