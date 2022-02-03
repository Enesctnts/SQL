USE DB_Test; --  Veritaban�n� se�tik.

-- SELECT * FROM tb_ogrenci;  -- T�m ��rencilerin t�m 
-- kolonlar�n� getirir.

--SELECT ad,soyad FROM tb_ogrenci; -- T�m ��rencilerin ad soyad 
---- kolonlar�n� getir.

--SELECT ID,ad,soyad FROM DB_Test.dbo.tb_ogrenci;
--SELECT ID,ad,soyad FROM [DB_Test].[dbo].[tb_ogrenci];

SELECT ID,ad,soyad FROM tb_ogrenci WHERE ad = '�mer Ali';
-- ad � �mer Ali olanlar�n ID ad soyad bilgisini getir.

SELECT *  FROM tb_ogrenci WHERE ID>2;
-- ID si 2 den b�y�k olan kay�tlar� getir.

SELECT TOP 2 * FROM tb_ogrenci WITH(NOLOCK);
-- en �stteki 2 kayd� getir. NOLOCK ile veri taban�n�n kilitlenmesini �nleriz. 
-- Bizim sorgumuz sunucuyu uzunca me�gul etse de di�er kullan�c�lar sorgu yapabilir.

SELECT * FROM tb_ogrenci ORDER BY ID ASC;
-- ID ye g�re artan s�ra ile yaz.


SELECT * FROM tb_ogrenci ORDER BY ID DESC;
-- ID ye g�re artan s�ra ile yaz.

SELECT TOP 2 * FROM tb_ogrenci WITH(NOLOCK) ORDER BY ID DESC ;
-- ID ye g�re azalan s�rala ve ilk 2 de�eri al.

SELECT * FROM tb_ogrenci WHERE ID BETWEEN 2 and 5;
-- ID si 2 ve 5 aras�nda olanlar� getir.

SELECT * FROM tb_ogrenci WHERE ID IN(3,4,5);
-- ID si 3,4 veya 5 olanlar� getir.

SELECT * FROM tb_ogrenci WHERE ID NOT IN(3,4,5);
-- ID si 3,4 veya 5 olmayanlar� getir.

SELECT * FROM tb_ogrenci WHERE ID=1 OR ID=4; 
-- ID si 1 veya 4 olanlar� getir.

SELECT * FROM tb_ogrenci WHERE ID=1 AND ad = '�mer'; 
-- ID si 1 ve ad� �mer olanlar� getir.

--SELECT * FROM tb_ogrenci WHERE CONTAINS(ad,'�mer');
SELECT * FROM tb_ogrenci WHERE ad LIKE '%�mer%';
--��erisinde �mer Olanlar� getir.

--WHERE CustomerName LIKE 'a%' 	Finds any values that start with "a"
--WHERE CustomerName LIKE '%a' 	Finds any values that end with "a"
--WHERE CustomerName LIKE '%or%' 	Finds any values that have "or" in any position
--WHERE CustomerName LIKE '_r%' 	Finds any values that have "r" in the second position
--WHERE CustomerName LIKE 'a_%' 	Finds any values that start with "a" and are at least 2 characters in length
--WHERE CustomerName LIKE 'a__%' 	Finds any values that start with "a" and are at least 3 characters in length
--WHERE ContactName LIKE 'a%o' 	Finds any values that start with "a" and ends with "o"
-