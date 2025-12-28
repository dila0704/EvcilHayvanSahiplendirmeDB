USE EvcilHayvanSahiplendirme2DB
GO
CREATE TABLE Kullanici (
    Kullanici_id INT IDENTITY PRIMARY KEY,
    Ad NVARCHAR(50) NOT NULL,
    Soyad NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) UNIQUE NOT NULL,
   Sifre NVARCHAR(100) NOT NULL,
   Telefon NVARCHAR(15),
    Sehir NVARCHAR(100),
    Uye_Tarihi DATETIME NOT NULL DEFAULT GETDATE()
);


CREATE TABLE Tur (
    tur_id INT IDENTITY PRIMARY KEY,
    tur_adi NVARCHAR(50) NOT NULL UNIQUE
);


CREATE TABLE Hayvan (
    hayvan_id INT IDENTITY PRIMARY KEY,
    isim NVARCHAR(50),
    yas INT CHECK (yas >= 0),
    cinsiyet NVARCHAR(10),
    aciklama NVARCHAR(255),
    saglik_durumu NVARCHAR(100),
    tur_id INT NOT NULL,
    kullanici_id INT NOT NULL);

    CREATE TABLE Ilan (
    ilan_id INT IDENTITY PRIMARY KEY,
    ilan_baslik NVARCHAR(100) NOT NULL,
    ilan_tarihi DATETIME NOT NULL DEFAULT GETDATE(),
    aciklama NVARCHAR(255),
    durum NVARCHAR(30),
    hayvan_id INT NOT NULL UNIQUE);


    CREATE TABLE Sahiplendirme (
    kayit_id INT IDENTITY PRIMARY KEY,
    ilan_id INT NOT NULL UNIQUE,
    kullanici_id INT NOT NULL,
    tarih DATETIME NOT NULL);

    CREATE TABLE Mesaj (
    mesaj_id INT IDENTITY PRIMARY KEY,
    gonderen_id INT NOT NULL,
    alici_id INT NOT NULL,
    tarih DATETIME NOT NULL DEFAULT GETDATE(),
    mesaj_metni NVARCHAR(500) NOT NULL);

