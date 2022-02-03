-- CREATE DATABASE OKUL_VT; -- OKUL_VT isminde bir veritaban� olu�turduk.

-- DROP DATABASE OKUL_VT; -- OKUL_VT veritaban�n� siler.

USE OKUL_VT; -- OKUL_VT veritaban�n� kullan.

-- Tablo olu�turuyoruz.

--CREATE TABLE tb_Ogrenci 
--(
--	numara int,
--	ad nvarchar(50),
--	soyad nvarchar(50),
--	dogumYili smallint,
--	sinif varchar(5)
--);

-- Tabloyu d�zenliyoruz.
-- nuamra y� primary key yapt�k.
ALTER TABLE tb_Ogrenci ALTER COLUMN ad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN soyad nvarchar(50) NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN dogumYili smallint NOT NULL;
ALTER TABLE tb_Ogrenci  ALTER COLUMN sinif varchar(5) NOT NULL;

ALTER TABLE tb_Ogrenci DROP CONSTRAINT  PK__tb_Ogren__FD77822034462A74;
ALTER TABLE tb_Ogrenci DROP numara;
ALTER TABLE tb_Ogrenci ADD numara int NOT NULL IDENTITY(1,1) PRIMARY KEY;
ALTER TABLE tb_Ogrenci DROP numara;



