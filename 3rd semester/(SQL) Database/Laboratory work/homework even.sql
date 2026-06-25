--ex2
SELECT COUNT(*) AS Ex2
FROM Sales.SalesOrderHeader

--ex4
SELECT 
       MIN(ListPrice),
       MAX(ListPrice),
       AVG(ListPrice)
FROM Production.Product

--ex6
SELECT 
    SalesOrderID,
    Count(*) AS NumarLiniiDetalii
FROM Sales.SalesOrderDetail
GROUP BY SalesOrderID

--ex8

SELECT Sum(LineTotal) AS SumaTotala
FROM Sales.SalesOrderDetail

--ex10
SELECT ProductID,
       (COUNT(DISTINCT SalesOrderID)) AS NrComenziDistincte
FROM Sales.SalesOrderDetail
GROUP BY ProductID
ORDER BY ProductID

--ex 12

SELECT
    MIN(StandardCost) AS min,
    MAX(StandardCost) AS max,
    AVG(StandardCost) AS avg
FROM Production.ProductCostHistory
GROUP BY ProductID

--ex14

SELECT VendorID, Count(PurchaseOrderID) AS nrComenzi
FROM Purchasing.PurchaseOrderHeader
GROUP BY VendorID

--ex16
SELECT 
    p.Name AS numeProdus,
    SUM(sales.OrderQty) AS cantitateVanduta
FROM Sales.SalesOrderDetail sales
JOIN Production.Product p ON sales.ProductID = p.ProductID
GROUP BY p.Name
ORDER BY cantitateVanduta DESC

--ex18
SELECT
    t.Name as NumeTeritoriu,
    Count(*) AS nrComenzi
FROM Sales.SalesOrderHeader salesHeader
JOIN Sales.SalesTerritory t ON salesHeader.TerritoryID = t.TerritoryID
GROUP BY t.name
ORDER BY nrComenzi DESC

--EX 20

SELECT
    c.CustomerID AS idClient,
    Count(*) AS nrComenzi
FROM Sales.SalesOrderHeader salesHeader
JOIN Sales.Customer c ON salesHeader.CustomerID = c.CustomerID
GROUP BY c.CustomerID
ORDER BY nrComenzi DESC

--EX 22

SELECT
    p.ProductSubcategoryID,
    SUM(salesDet.LineTotal) AS valoareTotala
FROM Sales.SalesOrderDetail salesDet
JOIN Production.Product p on salesDet.ProductID = p.ProductID
GROUP BY p.ProductSubcategoryID
ORDER BY valoareTotala DESC

--EX 24
SELECT
    pc.Name AS categorieProdus,
    SUM(prodDetail.OrderQty) AS cantitateTotalaCumparata
FROM Purchasing.PurchaseOrderDetail prodDetail
JOIN Production.Product p ON prodDetail.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name, pc.ProductCategoryID

--EX 26

SELECT
    t.Name as numeTeritoriu,
    Count(CustomerID) AS nrClienti
FROM Sales.Customer c
JOIN Sales.SalesTerritory t ON c.TerritoryID = t.TerritoryID
GROUP BY t.name
ORDER BY nrClienti DESC

--EX 28
SELECT  
    sp.BusinessEntityID,
    p.FirstName,
    p.LastName,
    SUM(soh.SubTotal) AS ValoareTotalaVanduta
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName
ORDER BY ValoareTotalaVanduta DESC;

-- EX 30
SELECT 
    CultureID,
    COUNT(*) AS NumarProduse
FROM Production.ProductModelProductDescriptionCulture
GROUP BY CultureID
ORDER BY NumarProduse DESC;

-- EX 32
SELECT 
    p.ProductID,
    p.Name AS NumeProdus,
    AVG(sod.UnitPrice) AS PretMediuVanzare
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
ORDER BY PretMediuVanzare DESC;

-- EX 34
SELECT 
    st.Name AS NumeTeritoriu,
    soh.CustomerID,
    COUNT(*) AS NumarComenzi
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c ON soh.CustomerID = c.CustomerID
JOIN Sales.SalesTerritory st ON c.TerritoryID = st.TerritoryID
GROUP BY st.Name, soh.CustomerID
ORDER BY NumeTeritoriu, NumarComenzi DESC;

-- EX 36
SELECT 
    p.Name AS NumeProdus,
    SUM(sod.OrderQty) AS CantitateTotalaVanduta
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.Name
HAVING SUM(sod.OrderQty) > 1000
ORDER BY CantitateTotalaVanduta DESC;

-- EX 38
SELECT 
    st.Name AS NumeTeritoriu,
    SUM(soh.SubTotal) AS ValoareTotalaVanduta
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesTerritory st ON soh.TerritoryID = st.TerritoryID
GROUP BY st.Name
HAVING SUM(soh.SubTotal) > 1000000
ORDER BY ValoareTotalaVanduta DESC;

-- EX 40
SELECT 
    sp.BusinessEntityID,
    p.FirstName,
    p.LastName,
    COUNT(DISTINCT soh.CustomerID) AS NumarClientiDiferiti
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesPerson sp ON soh.SalesPersonID = sp.BusinessEntityID
JOIN Person.Person p ON sp.BusinessEntityID = p.BusinessEntityID
GROUP BY sp.BusinessEntityID, p.FirstName, p.LastName
ORDER BY NumarClientiDiferiti DESC;

-- EX 42
SELECT 
    p.ProductID,
    p.Name AS NumeProdus,
    SUM(sod.LineTotal) AS ValoareTotalaVanduta,
    COUNT(*) AS NumarliniiVandute
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
GROUP BY p.ProductID, p.Name
HAVING SUM(sod.LineTotal) > 50000 AND COUNT(*) >= 100
ORDER BY ValoareTotalaVanduta DESC;

-- EX 44
SELECT 
    soh.CustomerID,
    sm.Name AS MetodaExpediere,
    COUNT(*) AS NumarComenzi,
    SUM(soh.SubTotal) AS ValoareTotala
FROM Sales.SalesOrderHeader soh
JOIN Purchasing.ShipMethod sm ON soh.ShipMethodID = sm.ShipMethodID
GROUP BY soh.CustomerID, sm.Name
ORDER BY soh.CustomerID, NumarComenzi DESC;

-- EX 46
SELECT 
    p.ProductSubcategoryID,
    ps.Name AS NumeSubcategorie,
    AVG(p.StandardCost) AS CostStandardMediu,
    MIN(p.StandardCost) AS CostStandardMinim,
    MAX(p.StandardCost) AS CostStandardMaxim
FROM Production.Product p
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
WHERE p.StandardCost > 0
GROUP BY p.ProductSubcategoryID, ps.Name
ORDER BY CostStandardMediu DESC;

-- EX 48
SELECT 
    soh.CustomerID,
    COUNT(sod.ProductID) AS NumarLiniiComanda,
    SUM(sod.OrderQty) AS CantitateTotala
FROM Sales.SalesOrderHeader soh
JOIN Sales.SalesOrderDetail sod ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY soh.CustomerID
ORDER BY CantitateTotala DESC;

-- EX 50
SELECT 
    pc.Name AS CategorieProdus,
    COUNT(sod.SalesOrderDetailID) AS NumarProduseVandute,
    SUM(sod.OrderQty) AS CantitateTotala
FROM Sales.SalesOrderDetail sod
JOIN Production.Product p ON sod.ProductID = p.ProductID
JOIN Production.ProductSubcategory ps ON p.ProductSubcategoryID = ps.ProductSubcategoryID
JOIN Production.ProductCategory pc ON ps.ProductCategoryID = pc.ProductCategoryID
GROUP BY pc.Name
ORDER BY CantitateTotala DESC;
