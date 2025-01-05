use karateKlubu;
-- Uyeler tablosuna veri eklenirken kontrol yapacak Trigger oluşturma
CREATE TRIGGER CheckPersonRoleForUyeler
ON Uyeler
AFTER INSERT
AS
BEGIN
    DECLARE @kisiId INT;

    -- Eklenen kisiId'yi al
    SELECT @kisiId = kisiId FROM INSERTED;

    -- Bu kisiId'nin Egitmenler tablosunda zaten olup olmadığını kontrol et
    IF EXISTS (SELECT 1 FROM Egitmenler WHERE kisiId = @kisiId)
    BEGIN
        PRINT 'Girilen kişi zaten eğitmen üye olamaz!!!';
        ROLLBACK;
        RETURN;
    END
END;
GO  -- Trigger'lar arasında ayrım yapmak için GO ekleyin

-- Egitmenler tablosuna veri eklenirken kontrol yapacak Trigger oluşturma
CREATE TRIGGER CheckPersonRoleForEgitmenler
ON Egitmenler
AFTER INSERT
AS
BEGIN
    DECLARE @kisiId INT;

    -- Eklenen kisiId'yi al
    SELECT @kisiId = kisiId FROM INSERTED;

    -- Bu kisiId'nin Uyeler tablosunda zaten olup olmadığını kontrol et
    IF EXISTS (SELECT 1 FROM Uyeler WHERE kisiId = @kisiId)
    BEGIN
       PRINT 'Girilen kişi zaten üye eğitmen olamaz!!!';
        ROLLBACK;
        RETURN;
    END
END;


-- Odemeler tablosunda genel bakiye güncelleyen Trigger oluşturma
CREATE TRIGGER UpdateGenelBakiye
ON Odemeler
AFTER INSERT
AS
BEGIN
    DECLARE @lastGenelBakiye DECIMAL(15, 2);

    -- İkinci en büyük oId'yi almak (son eklenen satırdan önceki satır)
    SELECT @lastGenelBakiye = genelBakiye
    FROM Odemeler
    WHERE oId = (
        SELECT MAX(oId) 
        FROM Odemeler
        WHERE oId < (SELECT MAX(oId) FROM Odemeler)  -- İkinci en büyük oId'yi al
    );

    -- Para miktarını ekleyerek genel bakiyeyi güncelleme
    UPDATE Odemeler
    SET genelBakiye = @lastGenelBakiye + (SELECT paraMiktari FROM INSERTED)
    WHERE oId = (SELECT oId FROM INSERTED);
END;


-- Uyelik tablosunda veri eklenirken aktifMi değerini güncelleyen Trigger oluşturma
CREATE TRIGGER trg_UpdateAktifMiOnUyelik
ON Uyelik
AFTER INSERT
AS
BEGIN
    -- Uyelik tablosuna yeni bir üye eklenince Uyeler tablosunda aktifMi'yi 1 olarak güncelleme
    UPDATE Uyeler
    SET aktifMi = 1
    WHERE kisiId IN (
        SELECT kisiId
        FROM inserted
    );
END;


-- SinavMerkezi tablosunda veri eklenmeden önce ödeme işlemi gerçekleştiren Trigger oluşturma
CREATE TRIGGER trg_PreventExamAndCreatePayment
ON SinavMerkezi
INSTEAD OF INSERT
AS
BEGIN
    DECLARE @kemerId INT;
    DECLARE @oId INT;
    DECLARE @paraMiktari FLOAT;

    -- Eklenen değerleri almak
    SELECT @kemerId = kemerId, @oId = oId FROM inserted;

    -- Eğer kemerId 8 ise
    IF @kemerId = 8
    BEGIN
        -- Kullanıcı en yüksek kemer seviyesine sahip olduğu için sınavın yapılmadığını belirten mesaj
       RAISERROR ('Sınavı geçemeyeceksiniz çünkü en yüksek kemer seviyesindesiniz.', 16, 1);


        -- Odemeler tablosunda para miktarını almak
        SELECT @paraMiktari = paraMiktari FROM Odemeler WHERE oId = @oId;

        -- Para miktarını negatif değere çevirmek, eğer zaten negatif değilse
        IF @paraMiktari > 0
            SET @paraMiktari = -@paraMiktari;

        -- Yeni bir ödeme kaydını Odemeler tablosuna eklemek
        INSERT INTO Odemeler (odemeTarihi, paraMiktari)
        VALUES (GETDATE(), @paraMiktari);
    END
    ELSE
    BEGIN
        -- Eğer kemerId 8 değilse, SinavMerkezi'ne normal veri eklenir
        INSERT INTO SinavMerkezi (kisiId, kemerId, oId, eId, sinavTarihi, sonuc)
        SELECT kisiId, kemerId, oId, eId, sinavTarihi, sonuc FROM inserted;
    END
END;


-- SinavMerkezi tablosuna veri eklenirken kemerId'yi güncelleyen Trigger oluşturma
CREATE TRIGGER trg_UpdateKemerId
ON SinavMerkezi
AFTER INSERT
AS
BEGIN
    DECLARE @kisiId INT;
    DECLARE @sonuc BIT;
    DECLARE @kemerId INT;

    -- Eklenen verilerden değerleri almak
    SELECT @kisiId = kisiId, @sonuc = sonuc, @kemerId = kemerId FROM inserted;

    -- Eğer sonuç başarılı ise (sonuc = 1)
    IF @sonuc = 1
    BEGIN
        -- Uyeler tablosunda kemerId'yi 1 artırarak güncelleme
        UPDATE Uyeler
        SET kemerId = @kemerId + 1
        WHERE kisiId = @kisiId;
    END
END;


-- YarismaKatilim tablosuna veri eklenirken ödül eklemek için Trigger oluşturma
CREATE TRIGGER trg_InsertOdul
ON YarismaKatilim
AFTER INSERT
AS
BEGIN
    -- Kazanma durumunu kontrol et
    INSERT INTO Odulleri (yId, odulAdi)
    SELECT 
        i.yId, 
        (SELECT yarismaAdi FROM Yarismalar WHERE Yarismalar.yId = i.yId)
    FROM 
        INSERTED i
    WHERE 
        i.kazandi = 1;
END;
