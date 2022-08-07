-- First should be executed this part alone:
ALTER TABLE Categories ALTER COLUMN CategoryID INT NOT NULL;
ALTER TABLE Customers ALTER COLUMN CustomerID INT NOT NULL;
ALTER TABLE Employees ALTER COLUMN EmployeeID INT NOT NULL;
ALTER TABLE OrderDetails ALTER COLUMN OrderDetailID INT NOT NULL;
ALTER TABLE Orders ALTER COLUMN OrderID INT NOT NULL;
ALTER TABLE ProductCost ALTER COLUMN ProductID INT NOT NULL;
ALTER TABLE Products ALTER COLUMN ProductID INT NOT NULL;
ALTER TABLE Shippers ALTER COLUMN ShipperID INT NOT NULL;
ALTER TABLE Suppliers ALTER COLUMN SupplierID INT NOT NULL;

-- after first part's execution is completed, then this part can be executed alone:
ALTER TABLE Categories ADD PRIMARY KEY(CategoryID);
ALTER TABLE Customers ADD PRIMARY KEY(CustomerID);
ALTER TABLE Employees ADD PRIMARY KEY(EmployeeID);
ALTER TABLE OrderDetails ADD PRIMARY KEY(OrderDetailID);
ALTER TABLE Orders ADD PRIMARY KEY(OrderID);
ALTER TABLE Products ADD PRIMARY KEY(ProductID);
ALTER TABLE Shippers ADD PRIMARY KEY(ShipperID);
ALTER TABLE Suppliers ADD PRIMARY KEY(SupplierID);
