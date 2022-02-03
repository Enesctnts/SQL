
begin transaction -- Commit Rollback
UPDATE tb_Ogretmen set ad = 'Ezgi' 
Rollback

select * from tb_Ogretmen order by 1 desc

-- ID'si 1 olan ��retmenin ad�n� Hasan Can yap�n. 
Update tb_ogretmen set ad = 'Hasan Can' where ID = 1

--tb_ogretmen tablosunda, t�m kay�tlar�n alanlar�n� 
--1 art�r�n. 

Update tb_ogretmen set alan = alan + 1 

select * from tb_ogretmen order by sira

-- Alan = 2 olanlar� alan = 4 yap�n�z.
UPDATE tb_ogretmen set alan = 5,sira = sira + 1  WHERE alan=4

--INSERT INTO
INSERT Into tb_alan (ad) VALUES ('Uzay Bilimleri')

select * from tb_alan

INSERT INTO tb_ogretmen(ad,soyad,telefon,alan,sira)
VALUES ('��kr�', '�il', 5067191212, 7,5)

INSERT INTO tb_ogretmen(ad,soyad,telefon,alan)
VALUES ('SemaNur', 'Mutlu', 5067191212, 7)

select * from tb_ogretmen order by sira

-- 3 adet ��renci insert edin. 
select * from tb_ogrenci

ALTER TABLE tb_ogretmen ADD takim nvarchar(20)  ;--yeni kolon
--Tip de�i�tirme:
ALTER TABLE tb_ogretmen ALTER COLUMN takim bigint NULL;
-- Drop etme
ALTER TABLE tb_ogretmen DROP Column takim; 

--JOIN
select * 
from tb_ogrenci a RIGHT JOIN tb_Ogretmen b
ON a.ogretmenID = b.ID

-- ��rencinin bilgileri + S�n�f Ad�:
select * from tb_ogrenci 

--��rencinin ad� soyad� S�n�f Ad� ve ��retmeninin ad soyad�:
select a.ad [��renci Ad], a.soyad [��renci Ad],
b.ad [S�n�f Ad], c.ad [��retmen Ad], c.soyad [��retmen Soyad]
from tb_ogrenci a INNER JOIN tb_Sinif b
ON a.sinifID = b.ID
INNER JOIN DB_Test.[dbo].[tb_Ogretmen] c ON a.ogretmenID = c.ID

select count(*) [��renci Say�s�] from tb_ogrenci WHERE ad like '_e%'
select * from tb_ogrenci WHERE ad like 'V%'
select * from tb_ogrenci WHERE ad like '_e%'




select Concat(a.ad,' ',a.soyad ) [��renci AdSoyad],
b.ad [S�n�f Ad] 
from tb_ogrenci a FULL OUTER JOIN tb_Sinif b
ON a.sinifID = b.ID
 
 select count(*) from tb_sinif WHERE kat=2

 SELECT 12*12 abc;



