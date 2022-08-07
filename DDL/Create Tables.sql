-- Task 1: Create Tables
create table Categories
	(
	CategoryID int,
	CategoryName nvarchar(250),
	Description nvarchar(250)
	);

create table Customers
	(
	CustomerID int,
	CustomerName nvarchar(250),
	ContactName nvarchar(250),
	Address nvarchar(250),	
	City nvarchar(100),
	PostalCode nvarchar(200),
	Country nvarchar(100)
	);

create table Employees
	(
	EmployeeID int,
	LastName nvarchar(150),
	FirstName nvarchar(200),
	BirthDate date,
	Photo nvarchar(250),
	Notes nvarchar(1000)
	);

create table OrderDetails
	(
	OrderDetailID int,
	OrderID int,	
	ProductID int,
	Quantity float
	);

create table Orders
	(
	OrderID int,
	CustomerID int,
	EmployeeID int,
	OrderDate datetime,
	ShipperID int
	);

create table Products
	(
	ProductID int,
	ProductName nvarchar(250),
	SupplierID int,
	CategoryID int,
	Unit nvarchar(250),
	Price float
	);

create table Shippers
	(
	ShipperID int,
	ShipperName nvarchar(250),
	Phone nvarchar(50)
	);

create table Suppliers
	(
	SupplierID int,
	SupplierName nvarchar(250),
	ContactName nvarchar(250),
	Address nvarchar(250),
	City nvarchar(100),
	PostalCode nvarchar(250),
	Country nvarchar(100),
	Phone nvarchar(50)
	);


