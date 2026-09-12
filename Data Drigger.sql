
DROP DATABASE IF EXISTS DataDigger;

CREATE DATABASE DataDigger;

USE DataDigger;

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) NOT NULL,
    Address VARCHAR(200)
);

INSERT INTO Customers
(CustomerID, Name, Email, Address)
VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Bob', 'bob@gmail.com', 'Surat'),
(3, 'Charlie', 'charlie@gmail.com', 'Vadodara'),
(4, 'Alice', 'alice2@gmail.com', 'Rajkot'),
(5, 'David', 'david@gmail.com', 'Gandhinagar');


CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    OrderDate DATE NOT NULL,
    TotalAmount DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
(OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(101, 1, '2026-09-10', 58000.00),
(102, 2, '2026-09-08', 18000.00),
(103, 3, '2026-09-05', 9000.00),
(104, 1, '2026-08-25', 3600.00),
(105, 4, '2026-08-20', 1500.00);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100) NOT NULL,
    Price DECIMAL(10,2) NOT NULL,
    Stock INT NOT NULL
);

INSERT INTO Products
(ProductID, ProductName, Price, Stock)
VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Mobile Phone', 18000.00, 25),
(203, 'Headphones', 1500.00, 50),
(204, 'Keyboard', 1200.00, 30),
(205, 'Smart Watch', 4500.00, 15);

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NOT NULL,
    SubTotal DECIMAL(10,2) NOT NULL,

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
(OrderDetailID, OrderID, ProductID, Quantity, SubTotal)
VALUES
(1, 101, 201, 1, 55000.00),
(2, 101, 203, 2, 3000.00),
(3, 102, 202, 1, 18000.00),
(4, 103, 205, 2, 9000.00),
(5, 104, 204, 3, 3600.00),
(6, 105, 203, 1, 1500.00);

SELECT DATABASE();

SHOW TABLES;

SELECT * FROM Customers;

SELECT * FROM Orders;

SELECT * FROM Products;

SELECT * FROM OrderDetails;
