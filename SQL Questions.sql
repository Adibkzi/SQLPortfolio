/* 
Name: Adib Kazi
Lesson: SQL Interview Questions
Date: 7/5/2023
*/


--Intermediate Questions:

--Retrieve all customers whose names start with 'J'.
SELECT *
FROM Customers
WHERE Name LIKE 'J%'

--Retrieve the count of orders for each customer.
SELECT c.customers_id, c.name, COUNT(O.Order_id) as Order_Count
FROM Customers C
LEFT JOIN Orders O
ON C.customer_id = O.customer_id
GROUP BY c.customers_id, c.name

--Find the total amount spent by each customer.
SELECT c.customer_id,c.name,  SUM(O.total_amount) as Total_Amount
FROM Customers c
LEFT JOIN Orders o 
ON C.Customers_id = O.Customers_id
GROUP BY C.customer_id, c.name

--Get the names of customers who have not placed any orders.
SELECT c.name
FROM Customers C
LEFT JOIN  Orderes O 
ON C.Customer_id = O.customer_id 
WHERE O.order_id IS NULL

--Fetch the top 5 customers with the highest total amount spent.
SELECT TOP 5 c.customer_id, c.name, 
			 SUM(O.total_amount) AS [Highest Total Amount Spent]
FROM Customers c 
LEFT JOIN Orders o 
ON C.customer_id = O.Customer_id
GROUP BY c.customer_id, c.name
ORDER BY [Highest Total Amount Spent] DESC

--Advanced Questions:

--Calculate the average order amount for each month.
SELECT MONTH(order_date) AS month,
		AVG(total_amount) AS average_amount
FROM Orders
GROUP BY MONTH(order_date)

--Find customers who have placed orders in all months.
SELECT c.customer_id, c.name
FROM Customers c
WHERE NOT EXISTS (
    SELECT DISTINCT MONTH(order_date)
    FROM Orders
    WHERE customer_id = c.customer_id
    EXCEPT
    SELECT DISTINCT MONTH(order_date)
    FROM Orders
	)

--Retrieve the customer with the highest total amount spent.
SELECT TOP 1 c.customer_id, c.name,
		SUM(o.total_amount) AS total_spent
FROM Customers c
JOIN Orders o 
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name
ORDER BY total_spent DESC;

--Calculate the percentage of customers who have placed orders.
SELECT COUNT(DISTINCT o.customer_id) * 100.0 / COUNT(DISTINCT c.customer_id) AS percentage
FROM Customers c
LEFT JOIN Orders o 
ON c.customer_id = o.customer_id;

--Retrieve the latest order date for each customer
SELECT c.customer_id, c.name, 
	   MAX(o.order_date) AS latest_order_date
FROM Customers c
JOIN Orders o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.name;
