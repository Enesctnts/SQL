--Almanya'ya (Ship Country) yap�lan sat��lardan 
-- 200 dolardan fazla olanlar� CustomerId, ShipCity, TotalPrice
--bilgilerini yazd�ran View:

CREATE OR ALTER VIEW Germany200 AS
SELECT ShipCountry,O.OrderID, 
SUM(od.UnitPrice * od.Quantity) AS Toplam
FROM Orders o, [Order Details] od
WHERE ShipCountry='Germany'
AND O.OrderID = od.OrderID
GROUP BY ShipCountry,O.OrderID
HAVING SUM(od.UnitPrice * od.Quantity) > 200 
AND ShipCountry='Germany'

-- Her bir category'de  ka� adet sipari� var ve toplam tutarlar�
--CategoryName, Count of Sipari�, SUM(UnitPrice and Quantity)
CREATE OR ALTER PROCEDURE [dbo].[CategoryOrders] 
AS
SELECT c.CategoryName, COUNT(o.OrderID) AS Sipari�Say�s�, 
SUM(od.Quantity * od.UnitPrice) AS ToplamTutar
FROM Categories c, Orders o, [Order Details] od, Products p
WHERE o.OrderID = od.OrderID AND p.CategoryID = c.CategoryID
AND  od.ProductID = p.ProductID
GROUP BY c.CategoryName

-- ProductID, ProductName baz�nda sipari� adetleri(Quantity)
SELECT p.ProductID,p.ProductName,SUM(Quantity) 
from [Order Details] od, Products p
WHERE od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName

--Sa�lama
SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=29




