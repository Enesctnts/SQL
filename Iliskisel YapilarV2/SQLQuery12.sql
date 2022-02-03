--Almanya'ya (Ship Country) yapýlan satýþlardan 
-- 200 dolardan fazla olanlarý CustomerId, ShipCity, TotalPrice
--bilgilerini yazdýran View:

CREATE OR ALTER VIEW Germany200 AS
SELECT ShipCountry,O.OrderID, 
SUM(od.UnitPrice * od.Quantity) AS Toplam
FROM Orders o, [Order Details] od
WHERE ShipCountry='Germany'
AND O.OrderID = od.OrderID
GROUP BY ShipCountry,O.OrderID
HAVING SUM(od.UnitPrice * od.Quantity) > 200 
AND ShipCountry='Germany'

-- Her bir category'de  kaç adet sipariþ var ve toplam tutarlarý
--CategoryName, Count of Sipariþ, SUM(UnitPrice and Quantity)
CREATE OR ALTER PROCEDURE [dbo].[CategoryOrders] 
AS
SELECT c.CategoryName, COUNT(o.OrderID) AS SipariþSayýsý, 
SUM(od.Quantity * od.UnitPrice) AS ToplamTutar
FROM Categories c, Orders o, [Order Details] od, Products p
WHERE o.OrderID = od.OrderID AND p.CategoryID = c.CategoryID
AND  od.ProductID = p.ProductID
GROUP BY c.CategoryName

-- ProductID, ProductName bazýnda sipariþ adetleri(Quantity)
SELECT p.ProductID,p.ProductName,SUM(Quantity) 
from [Order Details] od, Products p
WHERE od.ProductID = p.ProductID
GROUP BY p.ProductID, p.ProductName

--Saðlama
SELECT SUM(Quantity) FROM [Order Details] WHERE ProductID=29




