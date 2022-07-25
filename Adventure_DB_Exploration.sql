-- Find the total Buyer whose occupation is "Professional"
SELECT		Education, COUNT(ProspectiveBuyerKey) AS ClientID
FROM		dbo.ProspectiveBuyer
WHERE		Occupation = 'Professional'
GROUP BY	Education

-- For each order Display lowest and highes unit price
Select	SalesOrderId, MIN(UnitPrice) AS LowestPrice
, Max(UnitPrice) as HighestPrice
FROM	Sales.SalesOrderDetail
GROUP BY SalesOrderId

-- total sales amount of sales order id
SELECT SalesOrderID, SUM(LINETOTAL) AS TotalSalesAmt
FROM	Sales.SalesOrderDetail
GROUP BY	SalesOrderID

--total quantity of items sold 
SELECT	SalesOrderID, SUM(OrderQty) as TotalOrderQtySold
FROM	Sales.SalesOrderDetail
GROUP BY	SalesOrderID



