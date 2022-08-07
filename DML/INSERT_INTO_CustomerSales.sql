/*
Insert Extra data into CustomerSales table, Queries should be executed separatly.
*/

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, CustomerName) VALUES(518, 'Nika Chinchaladze');
SET IDENTITY_INSERT CustomerSales OFF;

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, CustomerName) VALUES(519, 'Leri Chixladze');
SET IDENTITY_INSERT CustomerSales OFF;

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, CustomerName) VALUES(520, 'Lado Quridze');
SET IDENTITY_INSERT CustomerSales OFF;

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, OrderDate, CustomerName, ProductName, Unit, Quantity) 
VALUES(521, '2022-06-27', 'Nata Komladze', '', '', 10);
SET IDENTITY_INSERT CustomerSales OFF;

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, OrderDate, CustomerName, ProductName, Unit, Quantity)  
VALUES(522, '2021-05-26', 'Lana Yipiani', '', '', 15);
SET IDENTITY_INSERT CustomerSales OFF;

SET IDENTITY_INSERT CustomerSales ON
INSERT INTO CustomerSales(ID, OrderDate, CustomerName, ProductName, Unit, Quantity)  
VALUES(523, '2020-04-25', 'Tamar Qmosteli', '', '', 20);
SET IDENTITY_INSERT CustomerSales OFF;






