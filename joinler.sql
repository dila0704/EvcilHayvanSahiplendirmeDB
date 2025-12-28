USE EvcilHayvanSahiplendirme2DB
GO 

SELECT h.isim,k.Ad,k.Soyad
FROM Hayvan h
JOIN Ilan ýl ON h.hayvan_id=ýl.hayvan_id
JOIN Sahiplendirme s ON  ýl.ilan_id=s.ilan_id
JOIN Kullanici k ON s.kullanici_id=k.kullanici_id;




SELECT *
FROM Kullanici


SELECT *
FROM Hayvan

SELECT *
FROM Mesaj

SELECT *
FROM Tur

SELECT *
FROM Sahiplendirme

SELECT *
FROM  Ilan


SELECT 
    k.Ad,
    k.Soyad,
    k.Sehir,
    i.ilan_baslik,
    i.ilan_tarihi
FROM Kullanici k
JOIN Hayvan h ON k.Kullanici_id = h.kullanici_id
JOIN Ilan i ON h.hayvan_id = i.hayvan_id
WHERE k.Sehir = 'Antalya';


SELECT 
    t.tur_adi,
    h.isim,
    h.yas,
    i.ilan_baslik
FROM Tur t
JOIN Hayvan h ON t.tur_id = h.tur_id
JOIN Ilan i ON h.hayvan_id = i.hayvan_id
WHERE t.tur_adi = 'Kedi';



SELECT 
    i.ilan_id,
    i.ilan_baslik,
    i.ilan_tarihi
FROM Ilan i
LEFT JOIN Sahiplendirme s ON i.ilan_id = s.ilan_id
WHERE s.ilan_id IS NULL;



SELECT 
    h.isim,
    h.yas,
    i.ilan_baslik
FROM Hayvan h
JOIN Ilan i ON h.hayvan_id = i.hayvan_id
WHERE h.yas > 3;

SELECT 
    g.Ad + ' ' + g.Soyad AS Gonderen,
    a.Ad + ' ' + a.Soyad AS Alici,
    m.mesaj_metni,
    m.tarih
FROM Mesaj m
JOIN Kullanici g ON m.gonderen_id = g.Kullanici_id
JOIN Kullanici a ON m.alici_id = a.Kullanici_id
WHERE g.Kullanici_id = 1;


SELECT 
    k.Ad,
    k.Soyad,
    COUNT(i.ilan_id) AS Ilan_Sayisi
FROM Kullanici k
JOIN Hayvan h ON k.Kullanici_id = h.kullanici_id
JOIN Ilan i ON h.hayvan_id = i.hayvan_id
GROUP BY k.Ad, k.Soyad
HAVING COUNT(i.ilan_id) >= 2;


SELECT 
    h.isim AS Hayvan_Adi,
    k.Ad AS Yeni_Sahip,
    s.tarih
FROM Sahiplendirme s
JOIN Ilan i ON s.ilan_id = i.ilan_id
JOIN Hayvan h ON i.hayvan_id = h.hayvan_id
JOIN Kullanici k ON s.kullanici_id = k.Kullanici_id;



SELECT 
    h.isim,
    h.saglik_durumu,
    i.ilan_baslik
FROM Hayvan h
JOIN Ilan i ON h.hayvan_id = i.hayvan_id
WHERE h.saglik_durumu IS NOT NULL;


SELECT *
FROM Ilan
WHERE ilan_tarihi = (SELECT MAX(ilan_tarihi) FROM Ilan);

SELECT 
    k.Ad,
    h.isim,
    s.tarih
FROM Sahiplendirme s
JOIN Kullanici k ON s.kullanici_id = k.Kullanici_id
JOIN Ilan i ON s.ilan_id = i.ilan_id
JOIN Hayvan h ON i.hayvan_id = h.hayvan_id
WHERE k.Kullanici_id = 2;




