--select * from vw_Weight

 

--select * from ProductsWithCategory

----View: Sanal tablo oluþturmamýzý saðlar. Karmaþýk ve uzun
---- sorgularý view olarak tanýmladýðýmýzda, detaylý
---- sorgu bir tabloymuþçasýna veri çekebiliriz. 

----OgrenciOgretmen view'ý yapýnýz, Kolonlar:
----Öðrenci(Ad soyad bitiþik),telefon, 
----Öðretmen(Ad soyad bitiþik),telefon

---- Products.*, CategoryName gösteren view.
--select * from ProductsWithCategory
--select count(*) from products


----Order lardan tarihi 1998 olan kayýtlarý çalýþanlarýyla
----birlikte getiren view.
--OrderDate Like '%1998%';

--select * FROM Orders WHERE 
--OrderDate BETWEEN '1998-01-01' AND '1998-12-31 23:59:59.000';
--View: USA'ya gönderilen sipariþler için: OrderID, 
--CuompanyName, Employee bilgileri. 
--CREATE VIEW vw_USA AS
SELECT  OrderID, a.CustomerID, a.EmployeeID, OrderDate, 
RequiredDate, ShippedDate, ShipVia, Freight, ShipName, 
ShipAddress, ShipCity, ShipRegion, ShipPostalCode, 
ShipCountry
 from Orders a INNER JOIN Customers b 
 ON a.CustomerID = b.CustomerID
 INNER JOIN Employees c on a.EmployeeID = c.EmployeeID 
 WHERE ShipCountry='USA'

 -- HER ÜLKEDE KAÇAR TANE MÜÞTERÝM VAR?




