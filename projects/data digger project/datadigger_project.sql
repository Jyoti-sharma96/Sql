CREATE DATABASE IF NOT EXISTS DataDiggerStore;
USE DataDiggerStore;

-- creating Customers Table
CREATE TABLE Customers (
CustomerID INT PRIMARY KEY AUTO_INCREMENT,
Name VARCHAR(100) NOT NULL,
Email VARCHAR(100) UNIQUE NOT NULL,
Address TEXT NOT NULL
);

-- Inserting Customers
INSERT INTO Customers (Name, Email, Address) VALUES
('Alice Smith', 'alice.smith@example.com', '123 Maple Street, Surat'),
('Bob Jones', 'bob.jones@example.com', '456 Oak Avenue, Surat'),
('Alice Wonderland', 'alice.w@example.com', '789 Pine Road, Bangalore'),
('Charlie Brown', 'charlie.brown@example.com', '321 Elm Street, Mumbai'),
('Diana Prince', 'diana.prince@example.com', '654 Cedar Lane, Delhi');

-- ---performing on  Customers Table ---
SELECT * FROM Customers;                                             
UPDATE Customers SET Address = '999 New Street, Surat' WHERE CustomerID = 1; 
SELECT * FROM Customers WHERE Name LIKE 'Alice%';                     
DELETE FROM Customers WHERE CustomerID = 5;                       


-- creating Products Table
CREATE TABLE Products (
ProductID INT PRIMARY KEY AUTO_INCREMENT,
ProductName VARCHAR(100) NOT NULL,
Price DECIMAL(10,2) NOT NULL,
Stock INT NOT NULL
);

-- Inserting in Products Table
INSERT INTO Products (ProductName, Price, Stock) VALUES
('Wireless Mouse', 450.00, 50),
('Mechanical Keyboard', 1800.00, 30),
('USB-C Hub', 1200.00, 0), -- Out of stock item for deletion test
('Gaming Headset', 2500.00, 15),
('Mouse Pad', 300.00, 100);

-- --- performing on Products Table  ---
SELECT * FROM Products ORDER BY Price DESC;                         
UPDATE Products SET Price = 1600.00 WHERE ProductID = 1;             
DELETE FROM Products WHERE Stock = 0;                                
SELECT * FROM Products WHERE Price BETWEEN 500 AND 2000;            
SELECT MAX(Price) AS MostExpensive, MIN(Price) AS Cheapest FROM Products; 

-- creating the Orders Table
CREATE TABLE Orders (
OrderID INT PRIMARY KEY AUTO_INCREMENT,
CustomerID INT,
OrderDate DATE NOT NULL,
TotalAmount DECIMAL(10,2) NOT NULL,
FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID) ON DELETE CASCADE
);

-- Inserting in Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-08-10', 2250.00),
(2, '2026-08-15', 1800.00),
(3, '2026-09-01', 2500.00),
(1, '2026-09-05', 450.00),
(4, '2026-09-10', 3000.00);

-- Inserting in Orders Table
INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2026-08-10', 2250.00),
(2, '2026-08-15', 1800.00),
(3, '2026-09-01', 2500.00),
(1, '2026-09-05', 450.00),
(4, '2026-09-10', 3000.00);

-- --- performing on Orders Table  ---
SELECT * FROM Orders WHERE CustomerID = 1;                           
UPDATE Orders SET TotalAmount = 2500.00 WHERE OrderID = 1;          
SELECT * FROM Orders WHERE OrderDate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY); 
SELECT MAX(TotalAmount) AS HighestOrder, MIN(TotalAmount) AS LowestOrder, AVG(TotalAmount) AS AverageOrder FROM Orders; 



-- creating the OrderDetails Table
CREATE TABLE OrderDetails (
OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
OrderID INT,
ProductID INT,
Quantity INT NOT NULL,
SubTotal DECIMAL(10,2) NOT NULL,
FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
FOREIGN KEY (ProductID) REFERENCES Products(ProductID) ON DELETE CASCADE
);


-- Inserting in Order Details
INSERT INTO OrderDetails (OrderID, ProductID, Quantity, SubTotal) VALUES
(1, 1, 5, 2250.00),
(2, 2, 1, 1800.00),
(3, 4, 1, 2500.00),
(4, 1, 1, 450.00),
(5, 2, 1, 1800.00);

-- --- Performing on OrderDetails Table  ---
SELECT * FROM OrderDetails WHERE OrderID = 1;                        
SELECT SUM(SubTotal) AS TotalRevenue FROM OrderDetails;              
SELECT ProductID, SUM(Quantity) AS TotalQuantity FROM OrderDetails GROUP BY ProductID ORDER BY TotalQuantity DESC LIMIT 3;
SELECT COUNT(*) AS TimesSold FROM OrderDetails WHERE ProductID = 1;  