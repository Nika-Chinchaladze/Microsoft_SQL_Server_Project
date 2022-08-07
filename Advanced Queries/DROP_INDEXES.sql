ALTER TABLE Categories DROP CONSTRAINT unique_category_name;
ALTER TABLE Customers DROP CONSTRAINT unique_customer_name;
ALTER TABLE ProductCost DROP CONSTRAINT unique_products;
ALTER TABLE Products DROP CONSTRAINT unique_product_name;
ALTER TABLE Shippers DROP CONSTRAINT unique_shipper_name;
ALTER TABLE Suppliers DROP CONSTRAINT unique_supplier_name;

DROP INDEX IF EXISTS Full_Name ON dbo.Employees;
DROP INDEX IF EXISTS unique_phone ON dbo.Suppliers;