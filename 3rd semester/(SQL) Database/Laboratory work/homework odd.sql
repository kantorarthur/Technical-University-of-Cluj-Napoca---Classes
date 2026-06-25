--ex_1
SELECT COUNT(*) AS Total_Produse
FROM Production.Product;

--ex_3
SELECT COUNT(*) AS Numar_Clienti
FROM Sales.Customer

--ex_5
SELECT ProductSubcategoryID, COUNT(*) AS NumarProduse
FROM Production.Product
GROUP BY ProductSubcategoryID
ORDER BY NumarProduse DESC

--ex_7
SELECT SUM(OrderQty) AS Cantitate_Totala
FROM Sales.SalesOrderDetail

--ex_9
SELECT ProductID, SUM(OrderQty) AS Cantitate_Totala
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY Cantitate_Totala

--ex_11
SELECT City, COUNT(*) AS Numar_Adrese
FROM Person.Address
GROUP BY City
ORDER BY Numar_Adrese DESC

--ex_13
SELECT ProductID, SUM(OrderQty) AS Cantitatea_Cumparata
FROM Purchasing.PurchaseOrderDetail
GROUP BY ProductID
ORDER BY Cantitatea_Cumparata DESC

--ex_15
SELECT ProductModelID, COUNT(*) AS Numar_Produse
FROM Production.Product
GROUP BY ProductModelID
ORDER BY Numar_Produse DESC;

--ex-17
SELECT p.Name AS Product_Name, SUM(sod.LineTotal) AS Valoare_Totala
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID=p.ProductID
GROUP BY p.Name
ORDER BY Valoare_Totala DESC

--ex_19
SELECT st.Name AS Teritoriu, SUM(soh.SubTotal) AS Valaoare_Totala
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
ORDER BY Valaoare_Totala

--ex_21
SELECT TOP 10 p.Name AS Nume_Produs, SUM(sod.ORDERQty) AS Cantitate_Vanduta
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID= p.ProductID
GROUP BY p.Name 
ORDER BY Cantitate_Vanduta

--ex_23
SELECT pc.Name AS Categorie, Count(p.ProductID) AS NumarProduse
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID=pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY NumarProduse DESC

--ex-25
SELECT sp.Name AS Statul, COUNT(a.AddressID) AS Adrese
FROM Person.Address AS a
JOIN Person.StateProvince AS sp ON a.StateProvinceID= sp.StateProvinceID
GROUP BY sp.Name
ORDER BY Adrese DESC;

--ex_27
SELECT c.CustomerID, AVG(soh.SubTotal) AS Media
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.Customer AS c ON soh.CustomerID = c.CustomerID
GROUP BY c.CustomerID

--ex_29
SELECT sm.Name AS ShipMethod, COUNT(*) AS Comenzi
FROM Sales.SalesOrderHeader AS soh
JOIN Purchasing.ShipMethod AS sm ON soh.ShipMethodID = sm.ShipMethodID
GROUP BY sm.Name

--ex_31
SELECT p.ProductModelID,SUM(sod.OrderQty) AS Total
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
GROUP BY p.ProductModelID

--ex_33
SELECT p.Name AS Produs, SUM(sod.OrderQty * sod.UnitPrice * sod.UnitPriceDiscount) AS Total
FROM Sales.SalesOrderDetail AS sod
JOIN Production.Product AS p ON sod.ProductID = p.ProductID
GROUP BY p.Name

--ex_35
SELECT sod.SalesOrderID, COUNT(*) AS Linii_Comanda
FROM Sales.SalesOrderDetail AS sod
GROUP BY sod.SalesOrderID

--ex_37
SELECT soh.CustomerID, COUNT(*) AS Numar_Comenzi
FROM Sales.SalesOrderHeader AS soh
GROUP BY soh.CustomerID 
HAVING COUNT(*) > 10

--ex_39
SELECT TOP 5 st.Name AS Teritoriu, AVG(soh.SubTotal) AS Media_Sub_Total
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID= st.TerritoryID
GROUP BY st.Name
ORDER BY Media_Sub_Total

--ex_41
SELECT pc.Name AS Categorie, AVG(p.ListPrice) AS Pret_Mediu,COUNT(p.ProductID) AS Numar_Produse
FROM Production.Product AS p
JOIN Production.ProductSubcategory AS ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory AS pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name

--ex_43
SELECT sm.Name AS Metoda, AVG(soh.SubTotal) AS Media,COUNT(*) AS Comenzi
FROM Sales.SalesOrderHeader AS soh
JOIN Purchasing.ShipMethod AS sm ON soh.ShipMethodID = sm.ShipMethodID
GROUP BY sm.Name

--ex_45
SELECT sp.Name AS Stat, COUNT(DISTINCT c.CustomerID) AS Numar_Clienti
FROM Sales.Customer AS c
JOIN Person.Person AS p ON c.PersonID = p.BusinessEntityID
JOIN Person.BusinessEntityAddress AS bea ON p.BusinessEntityID = bea.BusinessEntityID
JOIN Person.Address AS a ON bea.AddressID = a.AddressID
JOIN Person.StateProvince AS sp ON a.StateProvinceID = sp.StateProvinceID
GROUP BY sp.Name

--ex_47
SELECT sp.BusinessEntityID AS VanzatorID, COUNT(soh.SalesOrderID) AS Numar_Comenzi
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesPerson AS sp ON soh.SalesPersonID = sp.BusinessEntityID
GROUP BY sp.BusinessEntityID
HAVING COUNT(soh.SalesOrderID) >=20

--ex_49
SELECT st.Name AS Teritoriu,COUNT(DISTINCT soh.CustomerID) AS Numar_Clienti_Activi
FROM Sales.SalesOrderHeader AS soh
JOIN Sales.SalesTerritory AS st ON soh.TerritoryID= st.TerritoryID
GROUP BY st.Name
HAVING COUNT(DISTINCT soh.CustomerID) >100

