/*
Name: Adib Kazi
Lab: Adventure Works Data Exploration 
Skills used: Joins,  Case Statement, Aggregate function
*/

-- Find the Business Entity ID 1 information
SELECT		Person.PersonType, Person.FirstName, Person.LastName, Person.EmailAddress.EmailAddress,[Person].[Password].PasswordHash,[Person].[Password].PasswordSalt
FROM		Person.Person
INNER JOIN	Person.EmailAddress ON Person.BusinessEntityID = Person.EmailAddress.BusinessEntityID
INNER JOIN	Person.Password on	person.BusinessEntityID = Person.Password.BusinessEntityID
WHERE		Person.BusinessEntityID = 1


-- Find the AVG Holidays Hours spent by Job Title
SELECT		JobTitle, AVG(VacationHours) as Holidays
FROM		HumanResources.Employee
GROUP BY	JobTitle

-- Find the hourly rate for CEO
SELECT		HumanResources.Employee.BusinessEntityID, HumanResources.Employee.JobTitle, HumanResources.EmployeePayHistory.Rate
FROM		HumanResources.EmployeePayHistory
INNER JOIN	HumanResources.Employee on HumanResources.Employee.BusinessEntityID= HumanResources.EmployeePayHistory.BusinessEntityID
WHERE		HumanResources.Employee.JobTitle = 'Chief Executive Officer'

-- Find the ReferenceOrderID = 46626 where Cost > 57 and 70
SELECT	*
FROM	Production.TransactionHistoryArchive
WHERE	ActualCost between  57 and  70 
AND ReferenceOrderID = 46626


--Find all the information of ID's whose bonus where between 2000 and 6000
SELECT	*
FROM	Sales.SalesPerson
WHERE	Bonus BETWEEN 2000 AND 6000

-- Identify and Change to the correct amount of particular CTN
SELECT		CarrierTrackingNumber, PurchaseOrderNumber, OrderQty, LineTotal, TotalDue,
CASE
	WHEN	CarrierTrackingNumber = 'BE3B-4D30-A7' THEN LineTotal + (LineTotal *.10)
	WHEN	CarrierTrackingNumber = '5DF8-4C96-81' THEN LineTotal + (LineTotal *.15)
	WHEN	CarrierTrackingNumber = 'A5AF-4504-83' THEN LineTotal + (LineTotal *.03)
	ELSE	LineTotal + (LineTotal * .22)
END AS FinalChanges
FROM		Sales.SalesOrderDetail
JOIN		Sales.SalesOrderHeader
	ON		SalesOrderHeader.SalesOrderID = SalesOrderDetail.SalesOrderID


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
-- how many category of items sold 
select	SalesOrderID, count(ProductID) 
FROM	Sales.SalesOrderDetail
GROUP BY	SalesOrderID