🐾 Evcil Hayvan Sahiplendirme Sistemi – Veritabanı Projesi

Bu proje, BMÜ329 Veri Tabanı Sistemleri dersi kapsamında geliştirilmiş bir Evcil Hayvan Sahiplendirme Sistemi veritabanı uygulamasıdır.
Amaç, sahiplendirme sürecini düzenli, güvenilir ve izlenebilir hâle getiren ilişkisel bir veritabanı tasarlamak ve MSSQL üzerinde uygulamaktır.

📌 Projenin Amacı

Sokak hayvanlarının sahiplendirilmesi sürecinde yaşanan iletişim ve kayıt problemlerini çözmek amacıyla:

Kullanıcı,

Hayvan,

İlan,

Sahiplendirme

Mesajlaşma

süreçlerini kapsayan normalize edilmiş, veri bütünlüğü sağlanmış bir veritabanı sistemi geliştirilmiştir.

👥 Hedef Kullanıcılar

Hayvan sahiplendirmek isteyen kullanıcılar

Hayvan sahiplenmek isteyen kullanıcılar

İlanları sadece incelemek isteyen kullanıcılar

⚙️ Kullanılan Teknolojiler

Microsoft SQL Server

T-SQL

Stored Procedure

Trigger

Transaction (COMMIT / ROLLBACK)

🗂️ Veritabanı Yapısı

Sistem aşağıdaki tabloları içermektedir:

Kullanici

Tur

Hayvan

Ilan

Sahiplendirme

Mesaj

Tüm tablolar:

Primary Key

Foreign Key

UNIQUE

NOT NULL

CHECK

kısıtları ile veri bütünlüğü sağlanacak şekilde tasarlanmıştır.

🔄 İlişkiler

Bir kullanıcı → birden fazla hayvan

Bir hayvan → tek bir ilan

Bir ilan → tek bir sahiplendirme

Kullanıcılar arası → mesajlaşma (N:M)

Tür → hayvan (1:N)

🧩 Normalizasyon

Veritabanı tasarımı:

1NF

2NF

3NF

BCNF

kurallarına uygun olarak normalize edilmiştir.
Veri tekrarı ve güncelleme anomalileri önlenmiştir.

🛠️ Saklı Yordamlar (Stored Procedures)

Projede aşağıdaki saklı yordamlar kullanılmıştır:

Ilan_Olustur
Hayvan ve ilan bilgilerini tek işlemde sisteme ekler.

MesajGonder
Kullanıcılar arası mesajlaşmayı sağlar.

Sahiplendir
Sahiplendirme işlemini transaction yapısı ile güvenli şekilde gerçekleştirir.

🔔 Tetikleyiciler (Triggers)

AyniHayvanEngelle
Aynı hayvanın sisteme tekrar eklenmesini engeller.

Durum_Guncelleme
Sahiplendirme yapıldığında ilanın durumunu otomatik olarak “Sahiplendirildi” yapar.

🔐 Transaction Yönetimi

Sahiplendirme işlemleri:

Transaction içinde gerçekleştirilir

Hata durumunda ROLLBACK

Başarılı durumda COMMIT

ile veri tutarlılığı korunur.
