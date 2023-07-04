/* 
Name: Adib Kazi
Date: 6/3/2023
Personal Project: AdventureWorkBooks 2019 Intermediate Queries
*/
-- Write a SQL query to retrieve the top 5 sales orders by total due 
-- amount from the [Sales].[SalesOrderHeader] table.
SELECT TOP 5 SalesOrderID, TotalDue
FROM Sales.SalesOrderHeader
ORDER BY TotalDue DESC

--Write a SQL query to retrieve the product name, list price, and standard cost for all 
--products in the [Production].[Product] table, sorted by list price in descending order.
SELECT (Name) AS Product_Name, ListPrice, StandardCost
FROM Production.Product
ORDER BY ListPrice DESC

--Retrieve the product name, list price, and total sales quantity for each product in the [Production].[Product] table, joined with the [Sales].[SalesOrderDetail] table, sorted by total sales quantity in descending order.
SELECT PP.Name, PP.ListPrice, SUM(SOD.OrderQty) Total_Sales_Quantity
FROM Production.Product PP
INNER JOIN Sales.SalesOrderDetail SOD
ON PP.ProductID = SOD.ProductID
GROUP BY PP.Name, PP.ListPrice
ORDER BY Total_Sales_Quantity DESC


--Calculate the average order amount for each customer in the [Sales].[Customer] table, joined with the [Sales].[SalesOrderHeader] table, sorted by customer id in ascending order.
SELECT c.CustomerID, AVG(soh.TotalDue) as Avg_Total_Due
FROM Sales.Customer C 
INNER JOIN  Sales.SalesOrderHeader soh 
on c.customerID = soh.CustomerID
GROUP BY c.CustomerID
ORDER BY Avg_Total_Due ASC

--Retrieve the order date, product name, and unit price for all orders in the [Sales].[SalesOrderDetail] table that were placed in January 2018, joined with the [Sales].[SalesOrderHeader] and [Production].[Product] tables.
SELECT soh.OrderDate,
	   p.Name AS ProductName,
	   sod.UnitPrice
FROM Sales.SalesOrderDetail sod
JOIN Sales.SalesOrderHeader soh 
ON sod.SalesOrderID = soh.SalesOrderID
JOIN Production.Product p 
ON sod.ProductID = p.ProductID
WHERE YEAR(soh.OrderDate) = 2018 AND MONTH(soh.OrderDate) = 4;

--Identify the top 5 customers with the highest total sales amount, joined with the [Sales].[SalesOrderHeader] and [Sales].[Customer] tables, including their respective contact information.
SELECT * --TOP 5 c.CustomerID, c.FirstName, c.LastName, c.EmailAddress, c.Phone, SUM(sod.LineTotal) AS TotalSalesAmount
FROM Sales.SalesOrderHeader soh
JOIN Sales.Customer c 
ON soh.CustomerID = c.CustomerID
JOIN Sales.SalesOrderDetail sod 
ON soh.SalesOrderID = sod.SalesOrderID
GROUP BY c.CustomerID, c.FirstName, c.LastName, c.EmailAddress, c.Phone
ORDER BY TotalSalesAmount DESC;

--Calculate the average order processing time (in days) for each salesperson in the [Sales].[SalesPerson] table, joined with the [Sales].[SalesOrderHeader] table, considering the time difference between the order date and ship date.
SELECT  sp.BusinessEntityID, sp.FirstName, sp.LastName, AVG(DATEDIFF(day, soh.OrderDate, soh.ShipDate)) AS AverageProcessingTime
FROM Sales.SalesPerson sp
JOIN Sales.SalesOrderHeader soh ON sp.BusinessEntityID = soh.SalesPersonID
GROUP BY sp.BusinessEntityID, sp.FirstName, sp.LastName;
