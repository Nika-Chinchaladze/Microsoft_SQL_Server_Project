DECLARE @CHINCHO TABLE(
	First_Name VARCHAR(100),
	Last_Name VARCHAR(100)
);

INSERT INTO @CHINCHO VALUES
('Two', 'Too'),
('High', 'Fly'),
('Sheep', 'Ship'),
('Nika', 'Lika'),
('Dear', 'Near'),
('Tommy', 'Artour'),
('Give', 'Need'),
('Coffee', 'Laptop');

SELECT 
	First_Name,
	Last_Name,
	SOUNDEX(First_Name) AS Sound_Of_First,
	SOUNDEX(Last_Name) AS Sound_Of_Last,
	DIFFERENCE(First_Name, Last_Name) AS Difference_First_Last
FROM @CHINCHO
ORDER BY Difference_First_Last DESC;