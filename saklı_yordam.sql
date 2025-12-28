USE EvcilHayvanSahiplendirme2DB
GO

CREATE PROCEDURE Ilan_Olustur
    @isim NVARCHAR(50),
    @yas INT,
    @cinsiyet NVARCHAR(10),
    @aciklama NVARCHAR(255),
    @saglik_durumu NVARCHAR(100),
    @tur_id INT,
    @Kullanici_id INT,
    @ilan_baslik NVARCHAR(100),
    @ilan_aciklama NVARCHAR(255)
AS
BEGIN
    DECLARE @hayvan_id INT;

   
    INSERT INTO Hayvan (isim, yas, cinsiyet, aciklama, saglik_durumu, tur_id, kullanici_id)
    VALUES (@isim, @yas, @cinsiyet, @aciklama, @saglik_durumu, @tur_id, @Kullanici_id);

    SET @hayvan_id = SCOPE_IDENTITY();

   
    INSERT INTO Ilan (ilan_baslik, aciklama, durum, hayvan_id)
    VALUES (@ilan_baslik, @ilan_aciklama, 'Aktif', @hayvan_id);
END;

GO
    EXEC Ilan_Olustur
    'Cookie', 1, 'Erkek', 'Enerjik köpek', 'Saðlýklý',1,  1,'Sahiplendirme Ýlaný', 'Sýcak yuva aranýyor';
    EXEC Ilan_Olustur
    'Boncuk', 5, 'Diþi', 'Uysal Kedi', 'Saðlýklý',2,  3,'Kedi Sahiplendirme Ýlaný', 'Aile  aranýyor';
    EXEC Ilan_Olustur
    'Fýstýk', 2, 'Erkek', 'Oyuncu Kuþ', 'Saðlýklý',3,  2,' Kuþ Sahiplendirme Ýlaný', 'Ýlgili sahip bekleniyor';
    EXEC Ilan_Olustur
    'Karabaþ', 3, 'Erkek', 'Sadýk köpek', 'Yaralý',1,  4,'Sahiplendirme Ýlaný', 'Ýyilþetirecek bir yuva arýyor';
    EXEC Ilan_Olustur
    'Cikcik', 1, 'Diþi', 'Konuþkan Kuþ', 'Saðlýklý',3,  8,' Sahiplendirme Ýlaný', ' Sýcak Aile  aranýyor';
    EXEC Ilan_Olustur
    'Nuri',7, 'Erkek', 'Uysal Sürüngen', 'Saðlýklý',5,  7,'  Sahiplendirme Ýlaný', 'Ýlgili sahip bekleniyor';
    EXEC Ilan_Olustur
'Sami',7, 'Erkek', 'Uysal Sürüngen', 'Saðlýklý',5,  7,'  Sahiplendirme Ýlaný', 'Ýlgili sahip bekleniyor';


GO
CREATE PROCEDURE MesajGonder
    @gonderen_id INT,
    @alici_id INT,
    @mesaj_metni NVARCHAR(500)
AS
BEGIN
    INSERT INTO Mesaj (gonderen_id, alici_id, mesaj_metni)
    VALUES (@gonderen_id, @alici_id, @mesaj_metni);
END;

GO
EXEC MesajGonder
3,1,'Cookie ilanýnýz için iletiþime geçmek istedim.';
GO

CREATE PROCEDURE Sahiplendir
    @ilan_id INT,
    @kullanici_id INT
AS
BEGIN
    BEGIN TRY
        BEGIN TRANSACTION;

        INSERT INTO Sahiplendirme (ilan_id, kullanici_id, tarih)
        VALUES (@ilan_id, @kullanici_id, GETDATE());

        COMMIT TRANSACTION;
        PRINT 'Sahiplendirme baþarýyla yapýldý';

    END TRY
    BEGIN CATCH
        ROLLBACK TRANSACTION;
        PRINT 'Hata oluþtu! Sahiplendirme yapýlamadý';
    END CATCH;
    END;

GO
EXEC Sahiplendir
40,3;

GO
EXEC Sahiplendir
41,2;
