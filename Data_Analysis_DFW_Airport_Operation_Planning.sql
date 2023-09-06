/* 
DFW_Airport_Operation_Planning Data Analysis
Date: 9/5/2023
*/

--Average Age of Passengers:
--Calculate the average age of passengers on all flights.
SELECT  AVG(Age) AS Average_Age
FROM [dbo].[Passengers]

--Total Revenue per Origin:
--Calculate the total revenue (TicketSales + AncillaryRevenue) for each origin city.
SELECT F.Origin,
	   SUM(R.TicketSales + R.AncillaryRevenue) AS [Total Revenue]
FROM Flights F
LEFT JOIN Revenue R ON F.FlightID = R.FlightID
GROUP BY F.Origin
ORDER BY [Total Revenue] DESC


--Busiest Month by Flight Count:
--Determine the month with the highest number of flights.
SELECT TOP 1 MONTH(DepartureDate) AS [Months_Date], 
       COUNT(*) AS [Number of Flights]
FROM Flights
GROUP BY MONTH(DepartureDate) 
ORDER BY [Number of Flights] DESC

--Average Ticket Sales by Destination:
--Calculate the average TicketSales for each destination city.
SELECT
    F.Destination,
    CAST(AVG(R.TicketSales) AS DECIMAL(10, 2)) AS AverageTicketSales
FROM Flights F
INNER JOIN Revenue R  ON F.FlightID = R.FlightID
GROUP BY F.Destination;


--Passenger Count on High-Revenue Flights:
--Find the total number of passengers on flights with TotalRevenue exceeding $5000.
SELECT  COUNT(P.PassengerID) AS [Total Passengers]
FROM Passengers P
INNER JOIN Revenue R
ON P.FlightID = R.FlightID
WHERE R.TotalRevenue > 5000.00

--Top Destinations by Ancillary Revenue:
--List the top three destination cities by the highest AncillaryRevenue.
SELECT TOP 3 F.Destination, 
    SUM(R.[AncillaryRevenue]) as [Highest Ancillary Revenue]
FROM Flights F 
LEFT JOIN Revenue R
ON F.FlightID = R.FlightID
GROUP BY F.Destination
ORDER BY [Highest Ancillary Revenue] DESC;

--COUNT  Delayed Flights:
--Count the flights that were delayed (ArrivalTime > DepartureTime).
SELECT COUNT(P.FlightID) AS [Flights Delayed]
FROM Passengers P 
INNER JOIN Flights F
ON P.FlightID = F.FlightID
WHERE F.ArrivalTime > F.DepartureTime

--Average Ancillary Revenue per Flight:
--Calculate the average AncillaryRevenue per flight and display it alongside FlightNumber.
SELECT F.FlightNumber,  CAST(AVG(R.AncillaryRevenue) AS DECIMAL(10,2)) AS Avg_Ancillary_Revenue
FROM Flights F
LEFT JOIN Revenue R
ON F.FlightID = R.FlightID
GROUP BY F.FlightNumber
ORDER BY Avg_Ancillary_Revenue DESC

--Top Passengers by Total Revenue:
--Identify the top three passengers by the highest TotalRevenue.
;WITH CTE_PAX_REVENUE(PASSENGERID, FIRSTNAME,LASTNAME,TOTALREVENUE)
AS (SELECT TOP 3 P.PassengerID, P.FirstName, P.LastName,
			R.TotalRevenue
FROM Passengers P
INNER JOIN Revenue R
ON P.FlightID = R.FlightID
ORDER BY R.TotalRevenue DESC
)
SELECT * FROM CTE_PAX_REVENUE


