-- Data Analysis 

--Show all customer records whose customer name has  Elec in their name 
SELECT * 
FROM dbo.Customers
WHERE custmer_name LIKE '%Ele%'


--Show total number of customers for e commerce and Brick & Mortar 
SELECT Customer_Type, COUNT(*) AS Total_Customers
FROM customers
WHERE customer_type = 'Brick & Mortar' OR customer_type = 'E-Commerce'
GROUP BY customer_type
ORDER BY Total_Customers ASC

--Show transactions for Own Brand in Delhi for USD Dollars
SELECT T.product_code, T.customer_code, T.market_code, T.order_date,
	   T.sales_amount, T.currency,
	   P.product_type,
	   M.market_name
FROM dbo.[transaction] t
INNER JOIN [dbo].[products] p
ON T.product_code = P.product_code
INNER JOIN  [dbo].[market] m
ON t.market_code = m.market_code
 WHERE m.market_code = 'Mark004' AND t.currency = 'USD'

--Show distrinct product codes that were sold in chennai
SELECT P.product_code,M.market_name, M.[zone]
FROM dbo.[transaction] t
INNER JOIN [dbo].[products] p
ON T.product_code = P.product_code
INNER JOIN  [dbo].[market] m
ON t.market_code = m.market_code
WHERE m.market_code = 'Mark001' 

--Show transactions where currency is US dollars
SELECT * FROM [dbo].[transaction]
WHERE currency = 'USD'

--Show total revenue in year 2020,
SELECT T.product_code,t.order_date, SUM(T.Sales_Amount) AS Total_revenue
FROM [dbo].[transaction] T 
WHERE t.order_date LIKE '%2017%'
GROUP BY T.product_code, T.order_date
ORDER BY Total_revenue ASC




