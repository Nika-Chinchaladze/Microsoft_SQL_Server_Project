/*
Query should show effectivness of NULLIF Function.
*/

SELECT * FROM CustomerSales
WHERE NULLIF(ProductName, '') IS NULL;

SELECT * FROM CustomerSales
WHERE ProductName IS NULL;

SELECT * FROM CustomerSales
WHERE ProductName = ' ';

