ALTER TABLE ProductCost ADD CONSTRAINT check_price CHECK(Price > 0);
ALTER TABLE ProductCost ADD CONSTRAINT check_cost CHECK(cost < Price);

ALTER TABLE Products ADD CONSTRAINT check_product_price CHECK(Price > 0);