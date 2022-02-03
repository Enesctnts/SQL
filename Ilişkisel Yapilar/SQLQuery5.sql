
begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad = 'Ezgi' 
Rollback

select * from tb_Ogretmen order by 1 desc

-- ID'si 1 olan öðretmenin adýný Hasan Can yapýn. 
Update tb_ogretmen set ad = 'Hasan Can' where ID = 1

--tb_ogretmen tablosunda, tüm kayýtlarýn alanlarýný 
--1 artýrýn. 

Update tb_ogretmen set alan = alan + 1 

select * from tb_ogretmen order by sira

-- Alan = 2 olanlarý alan = 4 yapýnýz.
UPDATE tb_ogretmen set alan = 5,sira = sira + 1  WHERE alan=4

--INSERT INTO
INSERT Into tb_alan (ad) VALUES ('Uzay Bilimleri')

select * from tb_alan

INSERT INTO tb_ogretmen(ad,soyad,telefon,alan,sira)
VALUES ('Þükrü', 'Çil', 5067191212, 7,5)

INSERT INTO tb_ogretmen(ad,soyad,telefon,alan)
VALUES ('SemaNur', 'Mutlu', 5067191212, 7)

select * from tb_ogretmen order by sira

-- 3 adet öðrenci insert edin. 
select * from tb_ogrenci

ALTER TABLE tb_ogretmen ADD takim nvarchar(20)  ;--yeni kolon
--Tip deðiþtirme:
ALTER TABLE tb_ogretmen ALTER COLUMN takim bigint NULL;
-- Drop etme
ALTER TABLE tb_ogretmen DROP Column takim; 

--JOIN
select * 
from tb_ogrenci a RIGHT JOIN tb_Ogretmen b
ON a.ogretmenID = b.ID

-- Öðrencinin bilgileri + Sýnýf Adý:
select * from tb_ogrenci 

--Öðrencinin adý soyadý Sýnýf Adý ve Öðretmeninin ad soyadý:
select a.ad [Öðrenci Ad], a.soyad [Öðrenci Ad],
b.ad [Sýnýf Ad], c.ad [Öðretmen Ad], c.soyad [Öðretmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif b
ON a.sinifID = b.ID
INNER JOIN DB_Test.[dbo].[tb_Ogretmen] c ON a.ogretmenID = c.ID

select count(*) [Öðrenci Sayýsý] from tb_ogrenci WHERE ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'
select * from tb_ogrenci WHERE ad like '_e%'




select Concat(a.ad,' ',a.soyad ) [Öðrenci AdSoyad],
b.ad [Sýnýf Ad] 
from tb_ogrenci a FULL OUTER JOIN tb_Sinif b
ON a.sinifID = b.ID
 
 select count(*) from tb_sinif WHERE kat=2

 SELECT 12*12 abc;



