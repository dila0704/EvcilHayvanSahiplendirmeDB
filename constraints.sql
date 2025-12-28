USE EvcilHayvanSahiplendirme2DB
GO

ALTER TABLE Hayvan
ADD CONSTRAINT FK_Hayvan_Tur
FOREIGN KEY (tur_id) REFERENCES Tur(tur_id),
 FOREIGN KEY (kullanici_id) REFERENCES Kullanici(Kullanici_id);

ALTER TABLE Ilan
ADD CONSTRAINT FK_Ilan_Hayvan
 FOREIGN KEY (hayvan_id) REFERENCES Hayvan(hayvan_id);

ALTER TABLE Mesaj
ADD CONSTRAINT FK_Mesaj_Gonderen
 FOREIGN KEY (gonderen_id) REFERENCES Kullanici(Kullanici_id),
    FOREIGN KEY (alici_id) REFERENCES Kullanici(Kullanici_id);


ALTER TABLE Sahiplendirme
ADD CONSTRAINT FK_Sahiplendirme_Ilan
FOREIGN KEY (ilan_id) REFERENCES Ilan(ilan_id),
    FOREIGN KEY (kullanici_id) REFERENCES Kullanici(Kullanici_id);
