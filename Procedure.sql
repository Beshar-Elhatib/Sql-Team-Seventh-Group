-- Eğitmenleri Getir  
CREATE PROCEDURE EgitmenleriGetir  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        E.yetenekleri AS Yetenekleri  
    FROM   
        Egitmenler E  
    INNER JOIN   
        Kisiler K ON E.kisiId = K.kisiId;  
END;  


-- Pasif Üyeleri Getir  
CREATE PROCEDURE PasifUyeleriGetir  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        KS.kemerRengi AS KemerSeviyesi  
    FROM   
        Uyeler U  
    INNER JOIN   
        Kisiler K ON U.kisiId = K.kisiId  
    LEFT JOIN   
        KemerSeviyesi KS ON U.kemerId = KS.kemerId  
    WHERE   
        U.aktifMi = 0 OR U.aktifMi IS NULL; -- Pasif üyeler veya durumu belirli olmayan üyeler  
END;  


-- Aktif Öğrencileri Getir  
CREATE PROCEDURE AktifOgrencilerGetir  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        U.aktifMi AS AktifDurumu,  
        KS.kemerRengi AS KemerSeviyesi  
    FROM   
        Uyeler U  
    INNER JOIN   
        Kisiler K ON U.kisiId = K.kisiId  
    LEFT JOIN   
        KemerSeviyesi KS ON U.kemerId = KS.kemerId  
    WHERE   
        U.aktifMi = 1; -- Sadece aktif üyeler  
END;  


-- Belirli kemer numarasına göre üyeleri getir  
CREATE PROCEDURE KemerIdIleUyeleriGetir  
    @kemerId INT  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        U.aktifMi AS AktifDurumu,  
        KS.kemerRengi AS KemerRengi  
    FROM   
        Uyeler U  
    INNER JOIN   
        Kisiler K ON U.kisiId = K.kisiId  
    INNER JOIN   
        KemerSeviyesi KS ON U.kemerId = KS.kemerId  
    WHERE   
        U.kemerId = @kemerId; -- Belirli bir kemerId'ye sahip üyeler  
END;  

  

-- Tüm yarışmalardaki katılımcıları getir  
CREATE PROCEDURE GetAllYarismalarParticipants  
AS  
BEGIN  
    SELECT   
        YK.yId,   
        Y.yarismaAdi AS YarismaAdi,   
        Y.yarismaTarihi AS YarismaTarihi,   
        K.kisiId,   
        K.adi AS Adi,   
        K.soyadi AS Soyadi,   
        K.telefon AS Telefon,   
        K.eposta AS Eposta,   
        K.adres AS Adres,   
        YK.kazandi AS Kazandi  
    FROM   
        YarismaKatilim YK  
    INNER JOIN   
        Yarismalar Y ON YK.yId = Y.yId  
    INNER JOIN   
        Kisiler K ON YK.kisiId = K.kisiId;  
END;  
 

-- Belirli bir eğitmenin öğrencilerini getir  
CREATE PROCEDURE EgitmeninOgrencileriGetir  
    @egitmenId INT -- Eğitmenin ID'sini içeren değişken  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        KS.kemerRengi AS KemerSeviyesi  
    FROM   
        Antrenman A  
    INNER JOIN   
        Kisiler K ON A.kisiId = K.kisiId  
    LEFT JOIN   
        Uyeler U ON K.kisiId = U.kisiId -- Kisiler tablosunu Uyeler ile birleştir  
    LEFT JOIN   
        KemerSeviyesi KS ON U.kemerId = KS.kemerId -- Uyeler tablosunu KemerSeviyesi ile birleştir  
    WHERE   
        A.eId = @egitmenId; -- Eğitmenin eId değerine göre seçim yap  
END;  


-- Belirli bir eğitmenin sınavdan başarılı öğrencilerini getir  
CREATE PROCEDURE EgitmeninBasariliOgrencileriGetir  
    @egitmenId INT -- Eğitmenin ID'sini içeren değişken  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        KS.kemerRengi AS KemerSeviyesi  
    FROM   
        SinavMerkezi SM  
    INNER JOIN   
        Kisiler K ON SM.kisiId = K.kisiId  
    LEFT JOIN   
        KemerSeviyesi KS ON SM.kemerId = KS.kemerId  
    WHERE   
        SM.eId = @egitmenId  -- Eğitmenin eId değerine göre seçim yap  
        AND SM.sonuc = 1; -- Sadece başarılı öğrenciler (sonuc = 1)  
END;  

 

-- Yarışmayı kazananların ve aldıkları ödüllerin bilgilerini getir  
CREATE PROCEDURE GetWinnersAndAwards  
AS  
BEGIN  
    SELECT   
        K.kisiId,  
        K.adi AS Adi,  
        K.soyadi AS Soyadi,  
        K.telefon AS Telefon,  
        K.eposta AS Eposta,  
        K.adres AS Adres,  
        Y.yarismaAdi AS YarismaAdi,  
        Y.yarismaTarihi AS YarismaTarihi,  
        O.odulAdi AS OdulAdi  
    FROM   
        YarismaKatilim YK  
    INNER JOIN   
        Yarismalar Y ON YK.yId = Y.yId  
    INNER JOIN   
        Kisiler K ON YK.kisiId = K.kisiId  
    LEFT JOIN   
        Odulleri O ON Y.yId = O.yId  
    WHERE   
        YK.kazandi = 1; -- Yarışmayı kazanan kişileri getir  
END;  


