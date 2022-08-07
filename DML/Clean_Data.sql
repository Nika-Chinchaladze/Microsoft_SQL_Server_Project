----------------------------------- Lets make some corrections in Customers table: ----------------------------------------------------
-- update wrong data:
update Customers
set PostalCode = '01101'
where PostalCode = 'WA1 1DP';

update Customers
set PostalCode = '95822'
where PostalCode = 'S-958 22';

update Customers
set PostalCode = CONCAT(PostalCode, '0')
where LEN(PostalCode) = 4;


-- alter PostalCode column, change data type:
alter table Customers
alter column PostalCode numeric(20, 0);

-- remove extra spaces from columns:
update Customers
set CustomerName = TRIM(CustomerName),
	ContactName = TRIM(ContactName),
	Address = TRIM(Address),
	City = TRIM(City),
	Country = TRIM(Country);


----------------------------------- Lets make some corrections in Categories table: ----------------------------------------------------
-- remove extra spaces from columns:
update Categories
set CategoryName = TRIM(CategoryName), Description = TRIM(Description);

-- remove commas before "and" in Description column:
update Categories
set Description = REPLACE(Description, ', and', ' and')
where Description like '%, and%';


----------------------------------- Lets make some corrections in Employees table: ----------------------------------------------------
-- remove extra spaces from columns:
UPDATE Employees
SET LastName = TRIM(LastName),
	FirstName = TRIM(FirstName),
	Photo = TRIM(Photo),
	Notes = TRIM(Notes);


----------------------------------- Lets make some corrections in OrderDetails table: ----------------------------------------------------
-- update wrong data:
update OrderDetails
set Quantity = 10
where OrderDetailID = 103;

update OrderDetails
set Quantity = 12
where OrderDetailID = 401;


----------------------------------- Lets make some corrections in Orders table: ----------------------------------------------------
-- Change data type of OrderDate column, from datetime into date:
ALTER TABLE Orders
ALTER COLUMN OrderDate Date;


----------------------------------- Lets make some corrections in Products table: ----------------------------------------------------
-- remove extra spaces from columns:
UPDATE Products
SET ProductName = TRIM(ProductName), Unit = TRIM(Unit);

-- Update wrong data:
UPDATE Products
SET ProductName = 'Original Frankfurter grune Some'
WHERE ProductID = 77;


----------------------------------- Lets make some corrections in Shippers table: ----------------------------------------------------
-- remove extra spaces from columns:
UPDATE Shippers
SET ShipperName = TRIM(ShipperName), Phone = TRIM(Phone);


----------------------------------- Lets make some corrections in Suppliers table: ----------------------------------------------------
-- remove extra spaces from columns:
UPDATE Suppliers
SET SupplierName = TRIM(SupplierName),
	ContactName = TRIM(ContactName),
	Address = TRIM(Address),
	City = TRIM(City),
	PostalCode = TRIM(PostalCode),
	Country = TRIM(Country),
	Phone = TRIM(Phone);

-- remove extra commas inside SupplierName column:
update Suppliers
set SupplierName = REPLACE(SupplierName, ', ', ' ')
where SupplierName like '%,%';

-- update wrong data:
update Suppliers
set SupplierName = 'Heli Suwaren GmbH & Co. KG'
where SupplierID = 11;

update Suppliers
set SupplierName = 'Plutzer Lebensmittelgro marketer AG'
where SupplierID = 12;