CREATE DATABASE DataTransformer;
USE DataTransformer;

create table Customers (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100),
    RegistrationDate DATE
);

INSERT INTO Customers (CustomerID, FirstName, LastName, Email, RegistrationDate) VALUES
(1, 'John', 'Doe', 'john.doe@email.com', '2022-03-15'),
(2, 'Jane', 'Smith', 'jane.smith@email.com', '2021-11-02'),
(3, 'Alice', 'Johnson', 'alice.j@email.com', '2022-01-10'),
(4, 'Bob', 'Brown', 'bob.brown@email.com', '2023-05-22'),
(5, 'Charlie', 'Davis', 'charlie.d@email.com', '2021-08-14'),
(6, 'Diana', 'Miller', 'diana.m@email.com', '2023-02-19'),
(7, 'Ethan', 'Wilson', 'ethan.w@email.com', '2022-07-30'),
(8, 'Fiona', 'Moore', 'fiona.moore@email.com', '2023-01-05'),
(9, 'George', 'Taylor', 'george.t@email.com', '2021-10-11'),
(10, 'Hannah', 'Anderson', 'hannah.a@email.com', '2022-09-18'),
(11, 'Ian', 'Thomas', 'ian.thomas@email.com', '2023-04-12'),
(12, 'Julia', 'Jackson', 'julia.j@email.com', '2021-12-25'),
(13, 'Kevin', 'White', 'kevin.white@email.com', '2022-06-07'),
(14, 'Laura', 'Harris', 'laura.h@email.com', '2023-03-29'),
(15, 'Michael', 'Martin', 'michael.m@email.com', '2021-09-03'),
(16, 'Nora', 'Thompson', 'nora.t@email.com', '2022-08-21'),
(17, 'Oliver', 'Garcia', 'oliver.g@email.com', '2023-06-15'),
(18, 'Paula', 'Martinez', 'paula.m@email.com', '2021-07-19'),
(19, 'Quinn', 'Robinson', 'quinn.r@email.com', '2022-10-31'),
(20, 'Rachel', 'Clark', 'rachel.clark@email.com', '2023-01-20');

Create table  Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount) VALUES
(101, 1, '2023-07-01', 150.50),
(102, 2, '2023-07-03', 200.75),
(103, 3, '2023-07-04', 550.00),
(104, 4, '2023-07-05', 1200.25),
(105, 5, '2023-07-06', 45.00),
(106, 6, '2023-07-08', 850.50),
(107, 7, '2023-07-10', 320.00),
(108, 8, '2023-07-12', 1100.00),
(109, 9, '2023-07-15', 75.25),
(110, 10, '2023-07-18', 620.40),
(111, 11, '2023-07-20', 95.00),
(112, 12, '2023-07-22', 1350.80),
(113, 13, '2023-07-25', 480.00),
(114, 14, '2023-07-26', 300.00),
(115, 15, '2023-07-28', 525.60),
(116, 16, '2023-07-30', 99.99),
(117, 17, '2023-08-01', 1450.00),
(118, 18, '2023-08-02', 410.20),
(119, 19, '2023-08-05', 630.00),
(120, 20, '2023-08-06', 89.50);


CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Department VARCHAR(50),
    HireDate DATE,
    Salary DECIMAL(10, 2)
);

INSERT INTO Employees (EmployeeID, FirstName, LastName, Department, HireDate, Salary) VALUES
(1, 'Marcus', 'Vance', 'Engineering', '2019-03-12', 85000.00),
(2, 'Elena', 'Rostova', 'Product', '2021-06-18', 78000.00),
(3, 'Liam', 'O Connor', 'Engineering', '2018-09-23', 95000.00),
(4, 'Sofia', 'Patel', 'Operations', '2022-01-15', 52000.00),
(5, 'Carlos', 'Mendez', 'Sales', '2020-11-05', 61000.00),
(6, 'Aisha', 'Khan', 'Marketing', '2021-04-10', 58000.00),
(7, 'Benjamin', 'Foster', 'Legal', '2017-07-30', 110000.00),
(8, 'Chloe', 'Martin', 'HR', '2023-02-14', 49000.00),
(9, 'Devin', 'Brooks', 'Engineering', '2022-08-01', 82000.00),
(10, 'Hannah', 'Wong', 'Product', '2020-05-19', 76000.00),
(11, 'Gabriel', 'Santos', 'Finance', '2019-10-11', 89000.00),
(12, 'Zoya', 'Malik', 'Operations', '2023-01-09', 54000.00),
(13, 'Lucas', 'Berg', 'Sales', '2021-12-04', 63000.00),
(14, 'Maya', 'Sharma', 'Marketing', '2020-08-22', 67000.00),
(15, 'Nathan', 'Cole', 'Engineering', '2016-04-17', 120000.00),
(16, 'Zoe', 'Dubois', 'HR', '2022-07-11', 51000.00),
(17, 'Oliver', 'Twain', 'Legal', '2021-02-28', 94000.00),
(18, 'Priya', 'Nair', 'Finance', '2023-03-01', 72000.00),
(19, 'Tyler', 'Durden', 'Operations', '2018-12-19', 59000.00),
(20, 'Grace', 'Hopper', 'Engineering', '2015-06-01', 135000.00);