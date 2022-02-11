select * from [Person].[Person]
--Tablonun içinde bulunan tüm alanlarý getirir.
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
-- Person tablosunda PersonType deðeri EM olan kayýtlarý
--getir. 
select * from [Person].[Person] where PersonType='EM'
--WHERE
--Select * FROM tablo_adý WHERE þart veya þartlar.
SELECT count(*) FROM Person.Person 
WHERE PersonType='EM'
SELECT * FROM Person.Person WHERE FirstName= 'Ken'
SELECT * FROM Person.Person WHERE FirstName= 'Ken' 
OR FirstName= 'Michael' 
SELECT * FROM Production.Product 
--Color kolonunun deðeri Black olan kayýtlarýn 
--name, productnumber,color deðerlerini getirin. 
SELECT Name,ProductNumber,Color 
from Production.Product 
WHERE Color = 'Black'
-- C# &&-- SQL'de AND yani VE operatörü
-- C# ||-- SQL'de OR yani VEYA operatörü
SELECT Name,ProductNumber,Color,SafetyStockLevel
from Production.Product 
WHERE Color = 'Black' OR SafetyStockLevel = 500

SELECT * from Production.Product
WHERE SafetyStockLevel > 500 

SELECT * from Production.Product
WHERE Color = 'Black' AND SafetyStockLevel != 500 

-- Renk deðeri Black veya Yellow olan kayýtlarýn
-- ilk 10 tanesini gösteren SQL sorgusunu yazýnýz.
select top 50 * FROM Production.Product
WHERE Color = 'Black' OR Color = 'Yellow' 

-- Union All
select top 10 * FROM Production.Product
WHERE Color = 'Black' 
UNION ALL
select top 10 * FROM Production.Product
WHERE Color = 'Yellow' 
--Renk deðeri Multi olan kayýtlarýn ve StandardCost deðeri
--6'dan büyük olanlarýnýn ProductId, Color, Name ve ProductNumber
--deðerlerini birleþtirerek getirin.
SELECT ProductID,Color,Name + '-' + ProductNumber AS Name,
Name , ProductNumber 
FROM Production.Product
WHERE Color='Multi' AND StandardCost>6
--ListPrice deðeri 0'dan büyük olan kayýtlarýn toplam adedinin 
--%10 oranýna denk gelen kayýtlarý getirin. 
select TOP 10 percent * from  Production.Product
WHERE ListPrice>0
--LIKE
select * from HumanResources.Employee
--HumanResources.Employee tablosunda
--NatinalIDNumber kolonu içerisinde 96 geçen
-- JobTitle deðeri Research ile baþlayan
-- Cinsiyeti Gender (M) olan
-- Çalýþanlarýn listesini getirin. 
SELECT * FROM HumanResources.Employee
WHERE NationalIDNumber like '%96%' AND JobTitle LIKE 'Research%'
and Gender = 'M'
-- ProductID deðeri 100 den büyük ve 1000 den küçük olan
-- CarrierTrackingNumber son iki deðeri AE olan 
-- Satýþ detaylarýný listeleyiniz. 
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
--Ürünlerin renklerini bulunuz distinct ile. 
SELECT distinct color from Production.Product
--Satýþý olan ürünler
select * from Production.Product
WHERE ProductID in 
(SELECT distinct ProductID From Sales.SalesOrderDetail)
--Renklerin toplam satýþ fiyatlari(ListPrice)
SELECT Color, SUM(ListPrice)
FROM Production.Product WHERE ProductID IN
(SELECT distinct ProductID From Sales.SalesOrderDetail)
AND Color is not null --AND Color = 'Black'
GROUP BY Color
HAVING Color = 'Black'
--
--Databse oluþturma
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
--Tabloya kayýt eklemek
INSERT INTO Musteri 
(id, musteriNumara, tckn,vkn,isim,soyisim,olusturmaTarihi)
VALUES (1,1500,1234567890,98765,'Ahmet','Temiz',GETDATE())
INSERT INTO Musteri 
(id, musteriNumara, tckn,vkn,isim,soyisim,olusturmaTarihi)
VALUES (2,1501,676767,575757,'Mehmet','Türk',GETDATE())
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
UPDATE Musteri SET maas=10000 WHERE Soyisim = 'Türk'
--Var olan bir tablodaki varolan bir kolonda deðiþiklik
ALTER TABLE Musteri ALTER column maas int null









--










