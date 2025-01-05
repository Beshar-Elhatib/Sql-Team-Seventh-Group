
--Create database 
create database karateKlubu


use karateKlubu

-- Kişiler Tablosu (Kisiler)
CREATE TABLE Kisiler (
    kisiId INT PRIMARY KEY IDENTITY(1,1),
    adi NVARCHAR(50),
    soyadi NVARCHAR(50),
    telefon NVARCHAR(20),
    eposta NVARCHAR(50),
    adres NVARCHAR(255)
);

-- Ödemeler Tablosu (Odemeler)
CREATE TABLE Odemeler (
    oId INT PRIMARY KEY IDENTITY(1,1),
    odemeTarihi DATE,
    paraMiktari FLOAT,
    genelBakiye decimal(15,2)
);

-- Eğitmenler Tablosu (Egitmenler)
CREATE TABLE Egitmenler (
    kisiId INT PRIMARY KEY,
    yetenekleri NVARCHAR(255),
    CONSTRAINT fk_egitmenler_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId)
);

-- Kemer Seviyesi Tablosu (KemerSeviyesi)
CREATE TABLE KemerSeviyesi (
    kemerId INT PRIMARY KEY IDENTITY(1,1),
    kemerRengi NVARCHAR(50)
);

-- Üyeler Tablosu (Uyeler)
CREATE TABLE Uyeler (
    kisiId INT PRIMARY KEY,
    aktifMi BIT,
    kemerId INT,
    CONSTRAINT fk_uyeler_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId),
    CONSTRAINT fk_uyeler_kemer FOREIGN KEY (kemerId) REFERENCES KemerSeviyesi(kemerId)
);

CREATE TABLE EgitmenKontrati (
    egitmenId INT NOT NULL,
    oId INT NOT NULL,
    kontratBaslangicTarihi DATE NULL,
    kontratBitisTarihi DATE NOT NULL,
    PRIMARY KEY (egitmenId, oId),
    CONSTRAINT fk_egitmenkontrati_egitmenler FOREIGN KEY (egitmenId) REFERENCES Egitmenler(kisiId),
    CONSTRAINT fk_egitmenkontrati_odemeler FOREIGN KEY (oId) REFERENCES Odemeler(oId)
);


-- Üyelik Tablosu (Uyelik)
CREATE TABLE Uyelik (
    uyelikId INT PRIMARY KEY IDENTITY(1,1),
    kisiId INT NOT NULL,
    oId INT,
    baslangicTarih DATE,
    bitisTarih DATE,
    CONSTRAINT fk_uyelik_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId),
    CONSTRAINT fk_uyelik_odemeler FOREIGN KEY (oId) REFERENCES Odemeler(oId)
);


-- Antrenman Tablosu (Antrenman)
CREATE TABLE Antrenman (
    kisiId INT NOT NULL,
    eId INT NOT NULL,
    atmaTarihi DATE,
    PRIMARY KEY (kisiId, eId),
    CONSTRAINT fk_antrenman_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId),
    CONSTRAINT fk_antrenman_egitmenler FOREIGN KEY (eId) REFERENCES Egitmenler(kisiId)
);


CREATE TABLE SinavMerkezi (
    sinavId INT PRIMARY KEY IDENTITY(1,1),
    kisiId INT NOT NULL,
    kemerId INT NOT NULL,
    oId INT,
    eId INT, -- eId sütununu ekleyin
    sinavTarihi DATE,
    sonuc NVARCHAR(50),
    CONSTRAINT fk_sinavmerkezi_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId),
    CONSTRAINT fk_sinavmerkezi_kemer FOREIGN KEY (kemerId) REFERENCES KemerSeviyesi(kemerId),
    CONSTRAINT fk_sinavmerkezi_odemeler FOREIGN KEY (oId) REFERENCES Odemeler(oId),
    CONSTRAINT fk_sinavmerkezi_eId FOREIGN KEY (eId) REFERENCES SomeTable(eId) -- eId sütunu olan bir tablo olduğundan emin olun
);


-- Yarışmalar Tablosu (Yarismalar)
CREATE TABLE Yarismalar (
    yId INT PRIMARY KEY IDENTITY(1,1),
    yarismaAdi NVARCHAR(100),
    yarismaTarihi DATE
);

-- Yarışma Katılım Tablosu (Yarismakatilim)
CREATE TABLE YarismaKatilim (
    yId INT NOT NULL,
    kisiId INT NOT NULL,
    kazandi bit NOT NULL,
    PRIMARY KEY (yId, kisiId),
    CONSTRAINT fk_yarismakatilim_yarismalar FOREIGN KEY (yId) REFERENCES Yarismalar(yId),
    CONSTRAINT fk_yarismakatilim_kisiler FOREIGN KEY (kisiId) REFERENCES Kisiler(kisiId)
);

-- Ödüller Tablosu (Odulleri)
CREATE TABLE Odulleri (
    odulId INT PRIMARY KEY IDENTITY(1,1),
    yId INT NOT NULL,
    odulAdi NVARCHAR(100),
    CONSTRAINT fk_odulleri_yarismalar FOREIGN KEY (yId) REFERENCES Yarismalar(yId)
);


