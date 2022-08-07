
ALTER INDEX unique_category_name ON dbo.Categories REBUILD;
ALTER INDEX unique_customer_name ON dbo.Customers REBUILD;
ALTER INDEX unique_products ON dbo.ProductCost REBUILD;
ALTER INDEX unique_product_name ON dbo.Products REBUILD;
ALTER INDEX unique_shipper_name ON dbo.Shippers REBUILD;
ALTER INDEX unique_supplier_name ON dbo.Suppliers REBUILD;