/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT TOP (1000) [OrderID]
--      ,[ProductID]
--      ,[UnitPrice]
--      ,[Quantity]
--      ,[Discount]
--  FROM [Northwind].[dbo].[Order Details]

--  select sum(UnitPrice * Quantity) from [Order Details]
--  WHERE OrderID=10248

 -- DECLARE @kategoriSayisi int;
 -- SELECT  @kategoriSayisi = COUNT(*) FROM Categories;
 -- PRINT @kategoriSayisi;

 -- --DECLARE @sayi int;
 -- --SET @sayi = 111111;
 -- PRINT CONVERT(nvarchar(6), @sayi);

 -- PRINT GETDATE();

 -- DECLARE @sayi int;
 -- DECLARE @s nvarchar(4);
 -- SET @s =  TRY_CONVERT(nvarchar(4), 493);
 -- PRINT @s;

 -- SELECT @sayi = CAST(@s AS INT);
 -- PRINT @sayi;

 -- --DECLARE @hece nvarchar(20);
 -- SELECT @hece = RIGHT('Veysel',3);
 -- --PRINT @hece;
 -- SELECT @hece = LEFT('Veysel',3);
 -- --PRINT @hece;

 -- DECLARE @hece nvarchar(20);
 -- SELECT @hece = SUBSTRING('Kad�k�y',1,5);
 -- PRINT @hece;

 -- PRINT REPLICATE('*', 20);

 -- -- DATE Fonksiyonlar�
 -- PRINT DATEDIFF(DD,'01.01.2021', GETDATE() );
 -- PRINT DATEDIFF(MM,'01.01.2021', GETDATE() );
 -- PRINT DATEDIFF(YY,'01.01.1969', GETDATE() );

 -- PRINT DAY(GETDATE());
 --  PRINT MONTH(GETDATE());
 --   PRINT YEAR(GETDATE());

	--PRINT EOMONTH(GETDATE());

	--PRINT UPPER('Veysel');
	--PRINT LOWER('Veysel');

	--PRINT ROUND(3.5,2);
	--PRINT ROUND(2.5,0);

	--PRINT ASCII('Z');
	--PRINT CHAR(90);

	--PRINT STR(123456.12328,7,2);

	--PRINT CHARINDEX('DAN', 'KADIK�Y MEYDANI');

	--PRINT LTRIM('               KADIK�Y     5')
	--PRINT RTRIM('               KADIK�Y     ')+'-'

	--DECLARE @durum nvarchar(10);
	--SET @durum = 'hay�r';
	--SELECT CASE @durum 
	--WHEN 'evet' THEN 'Durum Evet' ELSE 'Durum Hay�r' END abc ;

	--select ad,soyad,
	-- CASE cinsiyet 
	--WHEN 1 THEN 'Erkek' ELSE 'Kad�n' END cinsiyet 
	--from DB_Test.dbo.tb_ogrenci;

	--select ad,soyad,
	--IIF(cinsiyet = 1, 'Erkek','Kad�n') cinsiyet 
	--from DB_Test.dbo.tb_ogrenci;

	----dogumY�l� 1985'dan k���kse orta ya�l�, de�ilse gen� yazal�m.
	--select ad + ' ' + soyad,
	--IIF(dogumYili < 1985,'Orta Ya�l�','Gen�')
	--from DB_Test.dbo.tb_ogrenci

	--Say� 100'den b�y�kt�r, k���kt�r
	--DECLARE @sayi2 int;
	--SET @sayi2 = 122;
	--if (@sayi2<100)	
	--PRINT 'Say� 100''den k���kt�r.';
	--ELSE
	--PRINT 'Say� 100''den b�y�kt�r.';
	 
	-- D�ng�ler:
	--DECLARE @sayac int;
	--SET @sayac = 15;
	--WHILE (@sayac > 0)
	--BEGIN
	--   PRINT @sayac;
	--   Set @sayac = @sayac -1;
 --   END;

	-- 1'den 10'a kadar says�n.
	-- Say�n�n karesi 26'dan b�y�kse kessin.
	-- Say�lar� yazd�rs�n.
	--DECLARE @sayac int;
	--Set @sayac = 0;
	--WHILE (@sayac < 10)
	--BEGIN
	--SELECT @sayac = @sayac + 1;
	
	--  IF(@sayac * @sayac > 26)
	--    BEGIN 
	--      PRINT 'Say�n�n karesi 26''y� ge�ti.';
	--      BREAK; --
	--    END;
	--  PRINT @sayac;
 --    END;

	-- IF EXISTS(SELECT * 
	-- FROM DB_Test.dbo.tb_ogrenci WHERE ad='Emine')
	-- PRINT 'Bu ��renci mevcut.'
	-- ELSE
	-- PRINT 'B�yle bir ��renci yok.'

	 SELECT * from tb_ogrenci a 
	 WHERE NOT EXISTS(SELECT ad FROM tb_sinif b 
	 WHERE a.sinifID = b.ID);











  




