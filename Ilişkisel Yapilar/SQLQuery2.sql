--select * from vw_Weight

 

--select * from ProductsWithCategory

----View: Sanal tablo olu�turmam�z� sa�lar. Karma��k ve uzun
---- sorgular� view olarak tan�mlad���m�zda, detayl�
---- sorgu bir tabloymu��as�na veri �ekebiliriz. 

----OgrenciOgretmen view'� yap�n�z, Kolonlar:
----��renci(Ad soyad biti�ik),telefon, 
----��retmen(Ad soyad biti�ik),telefon

---- Products.*, CategoryName g�steren view.
--select * from ProductsWithCategory
--select count(*) from products


----Order lardan tarihi 1998 olan kay�tlar� �al��anlar�yla
----birlikte getiren view.
--OrderDate Like '%1998%';

--select * FROM Orders WHERE 
--OrderDate BETWEEN '1998-01-01' AND '1998-12-31 23:59:59.000';
--View: USA'ya g�nderilen sipari�ler i�in: OrderID, 
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

 -- HER �LKEDE KA�AR TANE M��TER�M VAR?




