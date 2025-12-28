USE EvcilHayvanSahiplendirme2DB
GO


CREATE TRIGGER AyniHayvanEngelle
ON Hayvan
AFTER INSERT
AS
BEGIN
    IF EXISTS (
        SELECT 1
        FROM Hayvan h
        JOIN inserted i
            ON h.isim = i.isim
           AND h.yas = i.yas
           AND h.cinsiyet = i.cinsiyet
           AND h.tur_id = i.tur_id
           AND h.hayvan_id <> i.hayvan_id
    )
    BEGIN
        RAISERROR('Bu hayvan zaten sistemde kayýtlýdýr', 16, 1);
        ROLLBACK TRANSACTION;
        RETURN;
    END
END;


GO
CREATE TRIGGER Durum_Guncelleme
ON Sahiplendirme
AFTER INSERT
AS
BEGIN
    UPDATE Ilan
    SET durum = 'Sahiplendirildi'
    WHERE ilan_id IN (
        SELECT ilan_id FROM inserted
    );
END;


