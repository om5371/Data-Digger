CREATE DATABASE DataDigger;

USE DataDigger;


-- =========================================
-- CUSTOMERS TABLE
-- =========================================

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(100),
    Email VARCHAR(100),
    Address VARCHAR(200)
);

INSERT INTO Customers
VALUES
(1, 'Alice', 'alice@gmail.com', 'Ahmedabad'),
(2, 'Bob', 'bob@gmail.com', 'Surat'),
(3, 'Charlie', 'charlie@gmail.com', 'Vadodara'),
(4, 'Alice', 'alice2@gmail.com', 'Rajkot'),
(5, 'David', 'david@gmail.com', 'Gandhinagar');


-- =========================================
-- ORDERS TABLE
-- =========================================

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate DATE,
    TotalAmount DECIMAL(10,2),

    FOREIGN KEY (CustomerID)
    REFERENCES Customers(CustomerID)
);

INSERT INTO Orders
VALUES
(101, 1, '2026-09-10', 2500.00),
(102, 2, '2026-09-08', 1500.00),
(103, 3, '2026-09-05', 3200.00),
(104, 1, '2026-08-25', 4500.00),
(105, 4, '2026-08-20', 1800.00);


-- =========================================
-- PRODUCTS TABLE
-- =========================================

CREATE TABLE Products (
    ProductID INT PRIMARY KEY,
    ProductName VARCHAR(100),
    Price DECIMAL(10,2),
    Stock INT
);

INSERT INTO Products
VALUES
(201, 'Laptop', 55000.00, 10),
(202, 'Mobile Phone', 18000.00, 25),
(203, 'Headphones', 1500.00, 50),
(204, 'Keyboard', 1200.00, 30),
(205, 'Smart Watch', 4500.00, 15);


-- =========================================
-- ORDER DETAILS TABLE
-- =========================================

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    SubTotal DECIMAL(10,2),

    FOREIGN KEY (OrderID)
    REFERENCES Orders(OrderID),

    FOREIGN KEY (ProductID)
    REFERENCES Products(ProductID)
);

INSERT INTO OrderDetails
VALUES
(1, 101, 201, 1, 55000.00),
(2, 101, 203, 2, 3000.00),
(3, 102, 202, 1, 18000.00),
(4, 103, 205, 2, 9000.00),
(5, 104, 204, 3, 3600.00);