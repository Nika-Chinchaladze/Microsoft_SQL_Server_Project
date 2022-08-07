/*
Create Index on Orders Table, Main Columns should be: OrderID and CustomerID,
Included Column should be OrderDate.
*/

CREATE NONCLUSTERED INDEX IX_OrderID_CustomerID
ON Orders(OrderID, CustomerID)
INCLUDE(OrderDate);