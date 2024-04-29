-- TASK1 --------------------------------------------------------------
use hexapractice;
-- 1) Create Table Customers --
Create Table Customers
(
   CustomerID INT Primary Key,
   Firstname varchar(20) NOT NULL,
   Lastname varchar(20),
   Email varchar(30),
   Phone varchar(15),
   Address varchar(40)
);
-- 2) Create Table Products --
Drop table if exists Products;
Create Table Products
(
   ProductID INT Primary Key,
   Productname varchar(20) NOT NULL,
   Description varchar(50),
   Price numeric(9,2)
);
Desc Products;
-- 3)create table products --
create table Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate Date,
    TotalAmount numeric(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
Desc Orders;
-- 4) create table order details --
create table Orderdetails (
    OrderdetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- 5) create table Investory --
create table Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);


-- Task1--
-- Database design --
-- 1) database techshop--
create database TechShop;
use TechShop;
-- 1) Create Table Customers --
Create Table Customers
(
   CustomerID INT Primary Key,
   Firstname varchar(20) NOT NULL,
   Lastname varchar(20),
   Email varchar(30),
   Phone varchar(15),
   Address varchar(40)
);
-- 2) Create Table Products --
Drop table if exists Products;
Create Table Products
(
   ProductID INT Primary Key,
   Productname varchar(20) NOT NULL,
   Description varchar(50),
   Price numeric(9,2)
);
Desc Products;
-- 3)create table products --
create table Orders (
    OrderID INT PRIMARY KEY,
    CustomerID INT,
    OrderDate Date,
    TotalAmount numeric(10, 2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
Desc Orders;
-- 4) create table order details --
create table Orderdetails (
    OrderdetailID INT PRIMARY KEY,
    OrderID INT,
    ProductID INT,
    Quantity INT,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- 5) create table Investory --
create table Inventory (
    InventoryID INT PRIMARY KEY,
    ProductID INT,
    QuantityInStock INT,
    LastStockUpdate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
-- 5)atleast 10 samples to each table --
INSERT INTO Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
VALUES
(1, 'Teja', 'veer', 'teja@example.com', '1234567890', 'xyz'),
(2, 'likhi', 'v', 'likh@example.com', '123', 'st'),
(3, 'mad', 'vmsdr', 'teja@example.com', '4567890', 'jkl'),
(6, 'deek', 'msdr', 'teja@example.com', '7890', 'pqr'),
(8, 'pan', 'm', 'm@example.com', '567890', 'stu'),
(4, 'lee', 'aa', 'leela@example.com', '789', 'zab'),
(9, 'sun', 'p', 'st@example.com', '90', 'xy'),
(23, 'Tej', 'veeram', 'teja@example.com', '123456', 'efg'),
(26, 'mahi', 'sak', 'mahi@example.com', '1234', 'def'),
(12, 'virat', 'anu', 'virat@example.com', '17890', 'abc');
select * from Customers;

INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES
(12345, 1, '2024-04-25', 100.00),
(1, 1, '2022-04-25', 999.99),
(2, 26, '2023-04-25', 14.99),
(3, 23, '2021-04-25', 49.98),
(4, 12, '2022-04-25', null),
(5, 9, '2024-04-25', 09.98);
select* from Orders;
 desc Products;
INSERT INTO Products (ProductID, Productname, Description, Price)
VALUES
(1, 'Tv', '15" laptop with remote', 19999.12),
(2, 'remote', '122 remote with Tv', 18999.23),
(3, 'pc', '215" laptop with drive', 19999.56),
(4, 'phn', '345 gl', 19999.76),
(5, 'doll', '345 ls', 19999.91),
(6, 'ipod', '455 st', 199999.00),
(7, 'iphn', '5stu', 700000.9),
(8, 'Tvs', '335 asd', 19999.79),
(9, 'pen', '154pqr', 19999.89),
(10, 'uv', '455 xyz', 19999.99);
delete from Products;
rollback;
desc Orderdetails;
INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity)
VALUES
(1, 1, 10, 15),
(2,  2, 4, 26),
(3, 3, 3, 18),
(4, 4, 4, 31),
(5, 5, 5, 17);
select * from Products;
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(1, 1, 5, '2024-04-25'),
(2, 2, 10, '2024-04-25'),
(3, 3, 8, '2024-04-25'),
(4, 4, 3, '2024-04-25'),
(5, 5, 6, '2024-04-25');
INSERT INTO Inventory (InventoryID, ProductID, QuantityInStock, LastStockUpdate)
VALUES
(6, 11, 15, '2020-04-26'),
(7, 12, 110, '2021-04-15'),
(8, 13, 18, '2022-04-12'),
(9, 14, 13, '2024-04-23'),
(10, 15, 16, '2023-04-2');


--------------------------------------
-- TASK2 --------------------------------------------------------------
-- 1)retrieve names and email --
select firstname, lastname, email from Customers;

-- 2)order id and corresponding customer id --
select Orders.OrderID, Orders.OrderDate, Customers.FirstName, Customers.LastName
from Orders, Customers
where Orders.CustomerID = Customers.CustomerID
order by Orders.OrderID;

desc customers;
select* from customers;

-- 3)add values into customers --
insert into Customers (CustomerID, FirstName, LastName, Email, Phone, Address)
values (99, 'naga', 'teja', 'nt@example.com', '1234','xy strt');

-- 4)increase price by 10% --
update Products
set Price = Price * 1.1;
rollback;
select *from products;

-- 5)delete a specific order in orders --
delete from Orders where orderid=4;
select * from Orders;
delete from Orderdetails where orderdetailid=4;
select * from Orderdetails;

desc orders;
-- 6) insert new order into the orders table--
INSERT INTO Orders (OrderID, CustomerID, OrderDate, TotalAmount)
VALUES (12345, 1, '2024-04-25', 100.00);
desc orderdetails;
select *from orderdetails;

-- 8) sum of orderdetailsquantity and price from orders,products and orderdetails
-- select Orders.OrderID, 
-- sum(OrderDetails.Quantity * Products.Price)
-- from Orders, OrderDetails, Products
-- group by Orders.OrderID;

desc products;

desc orderdetails;
select OrderId, sum(Products.price * orderdetails.Quantity) from Products INNER JOIN orderdetails  
ON Products.ProductId = OrderDetails.ProductId;

select orderid, products.price * orderDetails.quantity 
from products INNER JOIN OrderDetails 
ON Products.ProductId = OrderDetails.ProductId;

select orderid, Sum(products.price * orderDetails.quantity)
from products INNER JOIN OrderDetails on Products.ProductId = OrderDetails.ProductId
Group By OrderId;

Update Orders Od
INNER JOIN (
select orderid, Sum(products.price * orderDetails.quantity) TotalAmount from products INNER JOIN OrderDetails 
ON Products.ProductId = OrderDetails.ProductId Group By OrderId) AD  ON Od.OrderiD = AD.OrderId
set od.totalAmount = AD.TotalAmount;

select * from Orders;

-- 9) 
delete from OrderDetails
where OrderID IN (select OrderID from Orders where CustomerID = 1);
delete from Orders where CustomerID = 1;
rollback;
select * from orders;

-- 10) insert new gadget into products --
INSERT INTO Products (ProductID, Productname, Description, Price)
VALUES
(27, 'AC', '24' 'cool', 50000.00);

-----------------------------------
select*from products;

ALTER TABLE orders
RENAME COLUMN parameters TO Status;

ALTER TABLE orders
add COLUMN Quantity int;

select* from orders;

UPDATE orders SET quantity = 11 WHERE orderdate = '2017-06-28';
-----------------------------------
-- 11) update status of a specific order--

UPDATE orders SET status = 'Shifted' WHERE orderdate = '2023-04-25';

-- TASK4 --------------------------------------------------------------
-- 1) to retrieve list of orders along with customer information --
select Orders.OrderID,
(select FirstName from Customers where Customers.CustomerID = Orders.CustomerID),
(select LastName from Customers where Customers.CustomerID = Orders.CustomerID) from Orders order by Orders.OrderID;

select * from products;
desc products;
select* from orders;
-- 2) total revenue by each electronic produt

SELECT p.productname, SUM(o.quantity * p.price) FROM Products p JOIN Orders o ON p.productid = o.customerid
GROUP BY p.productname;

select* from customers;
select* from orders;

-- 3) list all the customers who made atleast one purchase
SELECT DISTINCT c.firstname, c.lastname, c.customerid FROM Customers c JOIN Orders o ON c.customerid != o.customerid;

-- 4) hihest quantity ordered
select * from  orders where quantity=(select Max(quantity) from orders);

-- 5) retrieve all electronic gadgets along with corresponding categories
select productname,productid from products;
use TechShop;

---------------------------------------------
-- --------------------------------------------task-4----------------------------------------------
-- 1) customers have not placed any orders
select firstname,lastname from customers where customerid <> all (select customerid from orders);
select firstname, lastname,customerid from Customers where customerid NOT IN (select distinct customerid FROM Orders);

-- 2) total no. of available products
select * from products;
select count(*) as totalproducts from products;

-- 3) calculating total revenue by techshop(tv taken)
select (select sum(o.quantity * p.price) FROM Orders o JOIN Products p 
ON o.orderid = p.productid WHERE p.productname = 'tv') AS totalrevenue;

-- 4) avg quantity ordered for quantity
select avg(quantity) from orders;
select * from orders;

-- 5) calculating total revenue by spedcific person
select (select sum(o.quantity * p.price) FROM Orders o JOIN Products p 
ON o.orderid = p.productid WHERE p.productname = 'tv') AS totalrevenueoftv;
select sum(price) as totalrevenueofphn from products where productname='phn';

-- 6) most order placed names
select* from orders;
select* from products;
select* from customers;
select count(*) from orders; -- no. of orders
select c.firstname,count(orderid) from customers c join orders o on c.customerid=o.customerid
group by c.customerid;

-- 7) highest money spent product name
select max(price) from products;
SELECT productname, price FROM products
WHERE price = (SELECT Max(price) FROM products);

-- 8) total revenue highest spent price
SELECT productname, price FROM products as totalrevenue
WHERE price = (SELECT Max(price) FROM products);

-- 10) total no. of orders with name 
select c.firstname,count(orderid) from customers c join orders o on c.customerid=o.customerid
group by c.customerid;