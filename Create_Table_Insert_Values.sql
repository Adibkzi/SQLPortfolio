USE DFW_Airport_Operation_Planning

-- CREATE TABLES AND INSERT VALUES


-- Creating Flights Table
CREATE TABLE Flights (
    FlightID INT PRIMARY KEY,
    FlightNumber VARCHAR(10),
    Origin VARCHAR(50),
    Destination VARCHAR(50),
    DepartureDate DATE,
    DepartureTime TIME,
    ArrivalDate DATE,
    ArrivalTime TIME
);



-- Creating Passengers Table
CREATE TABLE Passengers (
    PassengerID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Age INT,
    FlightID INT,
    FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
);



-- Creating Revenue Table
CREATE TABLE Revenue (
    RevenueID INT PRIMARY KEY,
    FlightID INT,
    TicketSales DECIMAL(10, 2),
    AncillaryRevenue DECIMAL(10, 2),
    TotalRevenue DECIMAL(10, 2),
    FOREIGN KEY (FlightID) REFERENCES Flights (FlightID)
);


-- Inserting Values into Flights Table
INSERT INTO Flights (FlightID, FlightNumber, Origin, Destination, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime)
VALUES
    (1, 'A123', 'New York', 'Los Angeles', '2022-01-02', '08:00:00', '2022-01-02', '12:00:00'),
    (2, 'B456', 'Chicago', 'Miami', '2022-02-03', '09:30:00', '2022-02-03', '12:30:00'),
    (3, 'C789', 'Houston', 'Seattle', '2022-03-04', '10:45:00', '2022-03-04', '14:00:00'),
    (4, 'D123', 'Boston', 'San Francisco', '2022-04-05', '11:15:00', '2022-04-05', '15:45:00'),
    (5, 'E567', 'Atlanta', 'Washington', '2022-05-06', '12:30:00', '2022-05-06', '16:00:00'),
    (6, 'F890', 'Dallas', 'Chicago', '2022-06-07', '13:45:00', '2022-06-07', '17:30:00'),
    (7, 'G123', 'Los Angeles', 'New York', '2022-07-08', '14:30:00', '2022-07-08', '18:15:00'),
    (8, 'H456', 'Miami', 'Houston', '2022-08-09', '15:15:00', '2022-08-09', '19:00:00'),
    (9, 'I789', 'Seattle', 'Boston', '2022-09-10', '16:00:00', '2022-09-10', '20:00:00'),
    (10, 'J234', 'San Francisco', 'Atlanta', '2022-10-11', '16:45:00', '2022-10-11', '21:30:00'),
    (11, 'K567', 'Washington', 'Dallas', '2022-11-12', '17:30:00', '2022-11-12', '22:15:00'),
    (12, 'L890', 'Chicago', 'Los Angeles', '2022-12-13', '18:15:00', '2022-12-13', '23:00:00'),
    (13, 'M123', 'Houston', 'Miami', '2022-01-14', '08:30:00', '2022-01-14', '09:45:00'),
    (14, 'N456', 'Boston', 'Seattle', '2022-02-15', '09:45:00', '2022-02-15', '11:00:00'),
    (15, 'O789', 'Atlanta', 'San Francisco', '2022-03-16', '10:30:00', '2022-03-16', '12:15:00'),
    (16, 'P234', 'Dallas', 'Washington', '2022-04-17', '11:15:00', '2022-04-17', '13:30:00'),
    (17, 'Q567', 'Los Angeles', 'Chicago', '2022-05-18', '12:00:00', '2022-05-18', '14:45:00'),
    (18, 'R890', 'Miami', 'New York', '2022-06-19', '12:45:00', '2022-06-19', '16:00:00'),
    (19, 'S234', 'San Francisco', 'Las Vegas', '2022-07-20', '13:30:00', '2022-07-20', '17:15:00'),
    (20, 'T345', 'Dallas', 'Denver', '2022-08-21', '14:15:00', '2022-08-21', '18:30:00');


-- Inserting Values into Passengers Table
INSERT INTO Passengers (PassengerID, FirstName, LastName, Age, FlightID)
VALUES
    (1, 'John', 'Smith', 30, 1),
    (2, 'Lisa', 'Johnson', 25, 1),
    (3, 'Michael', 'Williams', 28, 2),
    (4, 'Emma', 'Jones', 22, 2),
    (5, 'Daniel', 'Brown', 35, 3),
    (6, 'Olivia', 'Davis', 29, 3),
    (7, 'Sophia', 'Miller', 31, 4),
    (8, 'James', 'Wilson', 27, 4),
    (9, 'Isabella', 'Martinez', 24, 5),
    (10, 'Ethan', 'Taylor', 33, 5),
    (11, 'Ava', 'Anderson', 26, 6),
    (12, 'Mason', 'Garcia', 29, 6),
    (13, 'Amelia', 'Lee', 28, 7),
    (14, 'Liam', 'Rodriguez', 23, 7),
    (15, 'Charlotte', 'Hernandez', 34, 8),
    (16, 'Noah', 'Lopez', 30, 8),
    (17, 'Emily', 'Turner', 27, 9),
    (18, 'Benjamin', 'Jackson', 25, 9),
    (19, 'Harper', 'White', 31, 10),
    (20, 'Ella', 'Garcia', 36, 10);


-- Inserting Values into Revenue Table
INSERT INTO Revenue (RevenueID, FlightID, TicketSales, AncillaryRevenue, TotalRevenue)
VALUES
    (1, 1, 5000.00, 1200.00, 6200.00),
    (2, 2, 4000.00, 800.00, 4800.00),
    (3, 3, 4500.00, 900.00, 5400.00),
    (4, 4, 4200.00, 750.00, 4950.00),
    (5, 5, 5200.00, 1100.00, 6300.00),
    (6, 6, 3700.00, 800.00, 4500.00),
    (7, 7, 6100.00, 1500.00, 7600.00),
    (8, 8, 4800.00, 900.00, 5700.00),
    (9, 9, 5400.00, 1000.00, 6400.00),
    (10, 10, 4700.00, 850.00, 5550.00),
    (11, 11, 4900.00, 950.00, 5850.00),
    (12, 12, 5500.00, 1200.00, 6700.00),
    (13, 13, 3200.00, 700.00, 3900.00),
    (14, 14, 4200.00, 800.00, 5000.00),
    (15, 15, 5100.00, 1100.00, 6200.00),
    (16, 16, 4400.00, 900.00, 5300.00),
    (17, 17, 5800.00, 1300.00, 7100.00),
    (18, 18, 3000.00, 600.00, 3600.00),
    (19, 19, 2800.00, 550.00, 3350.00),
    (20, 20, 3000.00, 500.00, 3500.00);

