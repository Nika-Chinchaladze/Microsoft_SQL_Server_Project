ALTER TABLE Categories ADD CONSTRAINT unique_category_name UNIQUE(CategoryName);
ALTER TABLE Customers ADD CONSTRAINT unique_customer_name UNIQUE(CustomerName);
ALTER TABLE ProductCost ADD CONSTRAINT unique_products UNIQUE(ProductName);
ALTER TABLE Products ADD CONSTRAINT unique_product_name UNIQUE(ProductName);
ALTER TABLE Shippers ADD CONSTRAINT unique_shipper_name UNIQUE(ShipperName);
ALTER TABLE Suppliers ADD CONSTRAINT unique_supplier_name UNIQUE(SupplierName);