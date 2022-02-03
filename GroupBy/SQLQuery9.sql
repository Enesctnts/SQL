USE Northwind;
SELECT count(*) from Customers;
SELECT SUM(p.UnitsInStock * p.UnitPrice) AS ToplamTutar
FROM Products p; 

select count(*) from Products p;
SELECT AVG(UnitPrice) ,
  MIN(UnitPrice) ,
  MAX(UnitPrice) FROM Products;

  select UnitPrice from Products order by 1;

  -- GROUP BY --
  SELECT a.CompanyName, a.Country 
  from Customers a ORDER BY 2;

  -- Hangi ülkede kaç müþterim var.
  SELECT Country, count(*) [Müþteri Sayýsý]   
  from Customers 
  GROUP BY Country ORDER BY 1 ;

  -- 5 ila 10000 arasý müþteri sayýsý olan ülkeleri getir.
  SELECT Country, count(*) [Müþteri Sayýsý]   
  from Customers 
  GROUP BY Country 
  HAVING count(*) > 5 
  ORDER BY 1;

  -- Hangi kategoriden kaç ürün var, ürün fiyatý 5'ten büyük olup
  -- Ürün sayýsý 10'dan büyük olanlar ?
  SELECT  a.CategoryID, a.CategoryName, 
  count(a.CategoryID) AS [Ürün Sayýsý],
  (SELECT c.Description FROM Categories c WHERE c.CategoryID=a.CategoryID) Aciklama
  from categories a INNER JOIN Products b
  ON a.CategoryID = b.CategoryID
  WHERE b.UnitPrice > 5
  GROUP BY a.CategoryID, CategoryName
  HAVING count(a.CategoryID)>10;

   --select * from Products WHERE CategoryID = 7;

  -- Her kategorideki ürünlerin toplam deðeri nedir? 
  SELECT  a.CategoryID, a.CategoryName, 
  CAST(SUM(b.UnitsInStock * b.UnitPrice) AS nvarchar(30))+'$'[Ürün Ederi]  
  from categories a INNER JOIN Products b
  ON a.CategoryID = b.CategoryID
  GROUP BY a.CategoryID, CategoryName
  ORDER BY 2
   
   select SUM(b.UnitsInStock * b.UnitPrice) from Products b
   WHERE CategoryID = 1
   --Her bir üründen kaç adet sipariþ verilmiþ? 
   --(Product ile Order Details eþleþtirilecek.)
   --Ürün ID, Ürün ismi, Sipariþ adedi.
   SELECT a.ProductID, a.ProductName, SUM(Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   GROUP BY a.ProductID, a.ProductName
   ORDER BY 1 DESC

   -- Yukarýdaki sorguya ek, 1998 5. ay ve sonrasý 
   -- deðerleri bulunuz.
   -- Orders ile Order Details eþleþtirilecek.
   -- CategoryName de olsun. 
   SELECT a.ProductID, a.ProductName, d.CategoryName,
   SUM(b.Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   INNER JOIN [Orders] c
   ON b.OrderID = c.OrderID
   INNER JOIN Categories d
   ON a.CategoryID = d.CategoryID
   WHERE c.OrderDate > '1998-05-01' --'1998-05-01 00:00:00.000'
   GROUP BY a.ProductID, a.ProductName, d.CategoryName
   ORDER BY 1 DESC

   select * from [Order Details] where 
   ProductID = 39 AND
   OrderID IN (
   SELECT OrderID FROM Orders a 
   where a.OrderDate > '1998-05-01 00:00:00.000')

 

  




