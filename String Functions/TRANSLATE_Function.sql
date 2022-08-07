DECLARE @CHINCHO TABLE(
	Phone_Numbers VARCHAR(200)
);

INSERT INTO @CHINCHO
SELECT 
	Phone 
FROM Suppliers
WHERE Phone LIKE '%(%';

SELECT 
	Phone_Numbers,
	TRANSLATE(Phone_Numbers, '()', '[]') AS New_Phone_Format
FROM @CHINCHO;