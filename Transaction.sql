CREATE PROCEDURE AddNewMemberToMembership
    @adi NVARCHAR(50),
    @soyadi NVARCHAR(50),
    @telefon NVARCHAR(20),
    @eposta NVARCHAR(50),
    @adres NVARCHAR(255),
    @paraMiktari FLOAT -- Ödeme Miktarı
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;  -- İşlem başlatma

        -- 1. Yeni üyeyi Kisiler tablosuna ekleme
        DECLARE @kisiId INT;
        INSERT INTO Kisiler (adi, soyadi, telefon, eposta, adres)
        VALUES (@adi, @soyadi, @telefon, @eposta, @adres);

        SET @kisiId = SCOPE_IDENTITY(); -- Eklenen üyenin id'sini alma

        -- Üye ekleme işleminin başarılı olup olmadığını kontrol etme
        IF @kisiId IS NULL
        BEGIN
            THROW 50000, 'Yeni üye eklenemedi.', 1;
        END

        -- 2. Ödeme ekleme
        DECLARE @oId INT;
        INSERT INTO Odemeler (odemeTarihi, paraMiktari)
        VALUES (GETDATE(), @paraMiktari); -- Ödeme miktarını ekleme

        SET @oId = SCOPE_IDENTITY(); -- Ödeme id'sini alma

        -- Ödeme ekleme işleminin başarılı olup olmadığını kontrol etme
        IF @oId IS NULL
        BEGIN
            THROW 50000, 'Ödeme eklenemedi.', 1;
        END

        -- 3. Üyelik ekleme
        DECLARE @baslangicTarih DATE = GETDATE();
        DECLARE @bitisTarih DATE = DATEADD(YEAR, 1, GETDATE()); -- Üyelik süresi 1 yıl
        INSERT INTO Uyelik (kisiId, oId, baslangicTarih, bitisTarih)
        VALUES (@kisiId, @oId, @baslangicTarih, @bitisTarih);

        -- Üyelik ekleme işleminin başarılı olup olmadığını kontrol etme
        IF NOT EXISTS (SELECT 1 FROM Uyelik WHERE kisiId = @kisiId AND oId = @oId)
        BEGIN
            THROW 50000, 'Üyelik eklenemedi.', 1;
        END

        -- Tüm işlemler başarılıysa, işlemi onaylama
        COMMIT TRANSACTION;

    END TRY
    BEGIN CATCH
        -- Hata durumunda işlemi geri alma
        ROLLBACK TRANSACTION;

        -- Hata mesajını gösterme
        DECLARE @ErrorMessage NVARCHAR(4000);
        DECLARE @ErrorSeverity INT;
        DECLARE @ErrorState INT;

        SELECT 
            @ErrorMessage = ERROR_MESSAGE(),
            @ErrorSeverity = ERROR_SEVERITY(),
            @ErrorState = ERROR_STATE();

        RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END;





EXEC AddNewMemberToMembership
    @adi = 'beshar',
    @soyadi = 'elhatib',
    @telefon = '05011234567',
    @eposta = 'biso.veli@example.com',
    @adres = 'suriye ', 
    @paraMiktari = 16000.00;


