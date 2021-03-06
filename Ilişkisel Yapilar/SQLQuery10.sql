USE [Northwind]
GO
/****** Object:  StoredProcedure [dbo].[CustOrdersOrders]    Script Date: 21.01.2022 09:51:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[CustOrdersOrders] @CustomerID nchar(5)
AS
SELECT OrderID, 
	OrderDate,
	RequiredDate,
	ShippedDate
FROM Orders
WHERE CustomerID = @CustomerID
ORDER BY OrderID

--EXEC CustOrdersOrders 'VINET'

--Elimizdeki tüm ürünlerin toplam değeri nedir? 
SELECT SUM (p.UnitsInStock * p.UnitPrice) AS ToplamTutar
FROM Products p 

-- Hangi şehirden kaç sipariş geldi? 
--INNER JOIN'li bir de INNER Join'siz.
SELECT c.City ,Count(*) SiparişSayısı
FROM Customers c INNER JOIN Orders o
ON c.CustomerID = o.CustomerID
GROUP BY c.City;

SELECT c.City ,Count(*) SiparişSayısı
FROM Customers c, Orders o
WHERE c.CustomerID = o.CustomerID
GROUP BY c.City;
-- Müşteri başına 10'dan fazla sipariş olan müşteriler(CompanyName)
-- ve Sipariş adetleri:
SELECT c.CompanyName, count(*) 
FROM Orders o, Customers c
WHERE o.CustomerID = c.CustomerID
GROUP BY c.CompanyName
HAVING count(o.OrderID) > 10
ORDER BY 2 desc;

--  "Save-a-lot Markets" müşterisinin 31 Order'ını listeleyin. 
select CustomerID FROM Customers WHERE CompanyName = 'Save-a-lot Markets'
SELECT * FROM Orders where CustomerID = 'SAVEA'

--  Herbir order'ın kalem sayıları 
SELECT o.OrderID, Count(*) AS Sayi 
FROM Orders o, [Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID
--  Tüm orderlar'ın kalem sayıları ortalaması 
SELECT SUM(Sayi) , 
Count(*), ROUND(SUM(Sayi) / CAST(Count(*) AS float),3) 
FROM 
(
SELECT o.OrderID, Count(*) AS Sayi 
FROM Orders o, [Order Details] od
WHERE o.OrderID = od.OrderID
GROUP BY o.OrderID
) k


 








