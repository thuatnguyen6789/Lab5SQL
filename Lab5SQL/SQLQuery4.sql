CREATE DATABASE OrderInfo
GO

USE OrderInfo
GO

CREATE TABLE Orders(
OrderID int IDENTITY,
CustomerName nvarchar(50),
Address nvarchar(100),
PhoneNumber bigint,
OrderDate datetime,
CONSTRAINT PK_ORDERS PRIMARY KEY (OrderID)
)
GO

DROP TABLE Orders
GO

INSERT INTO Orders(OrderID, CustomerName, Address, PhoneNumber, OrderDate) VALUES (123, N'NGUYỄN HUY THUẬT', N'159 PHÙNG KHOANG HÀ NỘI', 987995271, '1-1-2021');
INSERT INTO Orders(OrderID, CustomerName, Address, PhoneNumber, OrderDate) VALUES (124, N'NGÔ THỊ THẢO', N'CẨM VĂN HẢI DƯƠNG', 961770326, '2-1-2021');
INSERT INTO Orders(OrderID, CustomerName, Address, PhoneNumber, OrderDate) VALUES (125, N'MYLA NGUYỄN', N'TÂN HƯNG HẢI DƯƠNG', 9696969696, '3-1-2021');
GO

SELECT * FROM Orders
GO

USE OrderInfo
GO

CREATE TABLE Products(
ProductID varchar(10),
Description nvarchar(50),
Unit nvarchar(10),
Price money,
Qty int,
Amount money,
CONSTRAINT PK_PRODUCTS PRIMARY KEY (ProductID)
)
GO

DROP TABLE Products
GO

INSERT INTO Products(ProductID, Description, Unit, Price, Qty, Amount) VALUES ('T450', N'MÁY NHẬP MỚI', N'CHIẾC', 1000, 1, 1000);
INSERT INTO Products(ProductID, Description, Unit, Price, Qty, Amount) VALUES('NOKIA5670', N'ĐIỆN THOẠI ĐANG HOT', N'CHIẾC', 200, 2, 400);
INSERT INTO Products(ProductID, Description, Unit, Price, Qty, Amount) VALUES('SAMSUMG450', N'MÁY IN ĐANG Ế', N'CHIẾC', 100, 1, 100);
GO

SELECT * FROM Products
GO

USE OrderInfo
GO

CREATE TABLE Customers(
CustomerID int PRIMARY KEY,
CustomerName nvarchar(50),
Address nvarchar(50),
PhoneNumber bigint,
CONSTRAINT fk FOREIGN KEY (CustomerName) REFERENCES Orders(CustomerName)
)
GO


DROP TABLE Customers
GO

INSERT INTO Customers(CustomerID, CustomerName, Address, PhoneNumber) VALUES (1, N'NGUYỄN HUY THUẬT', N'159 PHÙNG KHOANG HÀ NỘI', 987995271);
INSERT INTO Customers(CustomerID, CustomerName, Address, PhoneNumber) VALUES (2, N'NGÔ THỊ THẢO', N'CẨM VĂN HẢI DƯƠNG', 961770326);
INSERT INTO Customers(CustomerID, CustomerName, Address, PhoneNumber) VALUES (3, N'MYLA NGUYỄN', N'TÂN HƯNG HẢI DƯƠNG', 9696969696);
GO

SELECT * FROM Customers
GO

CREATE TABLE OrderDetail(
OrderID int,
OrderDate datetime,
ProductID varchar(10),
Qty int
)
GO

INSERT INTO OrderDetail (OrderID, OrderDate, ProductID, Qty) VALUES (123, '1-1-2021', 'T450', 1);
INSERT INTO OrderDetail (OrderID, OrderDate, ProductID, Qty) VALUES (124, '2-1-2021', 'NOKIA5670', 2);
INSERT INTO OrderDetail (OrderID, OrderDate, ProductID, Qty) VALUES (125, '3-1-2021', 'SAMSUNG450', 1);
GO

DROP TABLE OrderDetail
GO

SELECT * FROM OrderDetail
GO

ALTER TABLE OrderDetail ADD CONSTRAINT mk FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
GO
