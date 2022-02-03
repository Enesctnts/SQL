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

  -- Hangi �lkede ka� m��terim var.
  SELECT Country, count(*) [M��teri Say�s�]   
  from Customers 
  GROUP BY Country ORDER BY 1 ;

  -- 5 ila 10000 aras� m��teri say�s� olan �lkeleri getir.
  SELECT Country, count(*) [M��teri Say�s�]   
  from Customers 
  GROUP BY Country 
  HAVING count(*) > 5 
  ORDER BY 1;

  -- Hangi kategoriden ka� �r�n var, �r�n fiyat� 5'ten b�y�k olup
  -- �r�n say�s� 10'dan b�y�k olanlar ?
  SELECT  a.CategoryID, a.CategoryName, 
  count(a.CategoryID) AS [�r�n Say�s�],
  (SELECT c.Description FROM Categories c WHERE c.CategoryID=a.CategoryID) Aciklama
  from categories a INNER JOIN Products b
  ON a.CategoryID = b.CategoryID
  WHERE b.UnitPrice > 5
  GROUP BY a.CategoryID, CategoryName
  HAVING count(a.CategoryID)>10;

   --select * from Products WHERE CategoryID = 7;

  -- Her kategorideki �r�nlerin toplam de�eri nedir? 
  SELECT  a.CategoryID, a.CategoryName, 
  CAST(SUM(b.UnitsInStock * b.UnitPrice) AS nvarchar(30))+'$'[�r�n Ederi]  
  from categories a INNER JOIN Products b
  ON a.CategoryID = b.CategoryID
  GROUP BY a.CategoryID, CategoryName
  ORDER BY 2
   
   select SUM(b.UnitsInStock * b.UnitPrice) from Products b
   WHERE CategoryID = 1
   --Her bir �r�nden ka� adet sipari� verilmi�? 
   --(Product ile Order Details e�le�tirilecek.)
   --�r�n ID, �r�n ismi, Sipari� adedi.
   SELECT a.ProductID, a.ProductName, SUM(Quantity) AS Miktar
   from Products a INNER JOIN [Order Details] b
   ON a.ProductID = b.ProductID 
   GROUP BY a.ProductID, a.ProductName
   ORDER BY 1 DESC

   -- Yukar�daki sorguya ek, 1998 5. ay ve sonras� 
   -- de�erleri bulunuz.
   -- Orders ile Order Details e�le�tirilecek.
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

 

  




