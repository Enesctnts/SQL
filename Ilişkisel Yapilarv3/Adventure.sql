select * from [Person].[Person]
--Tablonun i�inde bulunan t�m alanlar� getirir.
SELECT
BusinessEntityID,
PersonType,
FirstName,
LastName  from [Person].[Person]
--Production.Product
--Name
--ProductNumber
--Color
--ProductID
SELECT ProductID,Name,ProductNumber,Color
FROM Production.Product
--WHERE
-- Person tablosunda PersonType de�eri EM olan kay�tlar�
--getir. 
select * from [Person].[Person] where PersonType='EM'
--WHERE
--Select * FROM tablo_ad� WHERE �art veya �artlar.
SELECT count(*) FROM Person.Person 
WHERE PersonType='EM'
SELECT * FROM Person.Person WHERE FirstName= 'Ken'
SELECT * FROM Person.Person WHERE FirstName= 'Ken' 
OR FirstName= 'Michael' 
SELECT * FROM Production.Product 
--Color kolonunun de�eri Black olan kay�tlar�n 
--name, productnumber,color de�erlerini getirin. 
SELECT Name,ProductNumber,Color 
from Production.Product 
WHERE Color = 'Black'
-- C# &&-- SQL'de AND yani VE operat�r�
-- C# ||-- SQL'de OR yani VEYA operat�r�
SELECT Name,ProductNumber,Color,SafetyStockLevel
from Production.Product 
WHERE Color = 'Black' OR SafetyStockLevel = 500

SELECT * from Production.Product
WHERE SafetyStockLevel > 500 

SELECT * from Production.Product
WHERE Color = 'Black' AND SafetyStockLevel != 500 

-- Renk de�eri Black veya Yellow olan kay�tlar�n
-- ilk 10 tanesini g�steren SQL sorgusunu yaz�n�z.
select top 50 * FROM Production.Product
WHERE Color = 'Black' OR Color = 'Yellow' 

-- Union All
select top 10 * FROM Production.Product
WHERE Color = 'Black' 
UNION ALL
select top 10 * FROM Production.Product
WHERE Color = 'Yellow' 
--Renk de�eri Multi olan kay�tlar�n ve StandardCost de�eri
--6'dan b�y�k olanlar�n�n ProductId, Color, Name ve ProductNumber
--de�erlerini birle�tirerek getirin.
SELECT ProductID,Color,Name + '-' + ProductNumber AS Name,
Name , ProductNumber 
FROM Production.Product
WHERE Color='Multi' AND StandardCost>6
--ListPrice de�eri 0'dan b�y�k olan kay�tlar�n toplam adedinin 
--%10 oran�na denk gelen kay�tlar� getirin. 
select TOP 10 percent * from  Production.Product
WHERE ListPrice>0
--LIKE
select * from HumanResources.Employee
--HumanResources.Employee tablosunda
--NatinalIDNumber kolonu i�erisinde 96 ge�en
-- JobTitle de�eri Research ile ba�layan
-- Cinsiyeti Gender (M) olan
-- �al��anlar�n listesini getirin. 
SELECT * FROM HumanResources.Employee
WHERE NationalIDNumber like '%96%' AND JobTitle LIKE 'Research%'
and Gender = 'M'
-- ProductID de�eri 100 den b�y�k ve 1000 den k���k olan
-- CarrierTrackingNumber son iki de�eri AE olan 
-- Sat�� detaylar�n� listeleyiniz. 
-- Sales.SalesOrderDetail tablosu.
select * from Sales.SalesOrderDetail
WHERE ProductID>100 and ProductID<1000
AND CarrierTrackingNumber like '%AE'
select * from Sales.SalesOrderDetail
WHERE ProductID BETWEEN 100 and 1000
AND CarrierTrackingNumber like '%AE'
-- IN , NOT IN
SELECT * FROM Production.Product
WHERE ProductNumber IN ('AR-5381','BA-8327')
SELECT * FROM Production.Product
WHERE ProductNumber NOT IN ('AR-5381','BA-8327')
--�r�nlerin renklerini bulunuz distinct ile. 
SELECT distinct color from Production.Product
--Sat��� olan �r�nler
select * from Production.Product
WHERE ProductID in 
(SELECT distinct ProductID From Sales.SalesOrderDetail)
--Renklerin toplam sat�� fiyatlari(ListPrice)
SELECT Color, SUM(ListPrice)
FROM Production.Product WHERE ProductID IN
(SELECT distinct ProductID From Sales.SalesOrderDetail)
AND Color is not null --AND Color = 'Black'
GROUP BY Color
HAVING Color = 'Black'
--
--Databse olu�turma
CREATE database Store 

--DROP database Store 
Create Table Musteri
(id int primary key,
musteriNumara int,
tckn nvarchar(15),
vkn nvarchar(15),
isim nvarchar(50),
soyisim nvarchar(50),
olusturmaTarihi DateTime)

Create Table MusteriIletisimBilgileri(
id int primary key,
musteriID int,
iletisimTip int,  -- 1:GSM 2:Acik adres 3:Sabit Telefon
deger nvarchar(500),
olusturmaTarih datetime,
foreign key (musteriID) references Musteri(id)
)
--Tabloya kay�t eklemek
INSERT INTO Musteri 
(id, musteriNumara, tckn,vkn,isim,soyisim,olusturmaTarihi)
VALUES (1,1500,1234567890,98765,'Ahmet','Temiz',GETDATE())
INSERT INTO Musteri 
(id, musteriNumara, tckn,vkn,isim,soyisim,olusturmaTarihi)
VALUES (2,1501,676767,575757,'Mehmet','T�rk',GETDATE())
INSERT INTO MusteriIletisimBilgileri
(id, musteriID, iletisimTip,deger,olusturmaTarih) VALUES
(2,2,1,05554569090, GETDATE())
select * from MusteriIletisimBilgileri
--Var olan bir tabloya yeni  kolon eklemek:
ALTER table Musteri Add DenemeKolon int null 
select * from Musteri
ALTER table Musteri Add maas int not null default 4250
--Var olan bir tablodaki bir kolonu silmek
ALTER TABLE Musteri DROP column DenemeKolon
UPDATE Musteri SET maas=10000 WHERE Soyisim = 'T�rk'
--Var olan bir tablodaki varolan bir kolonda de�i�iklik
ALTER TABLE Musteri ALTER column maas int null









--










