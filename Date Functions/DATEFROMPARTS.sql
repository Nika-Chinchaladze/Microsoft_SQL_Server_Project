DECLARE @CHINCHO TABLE(
	First_Name VARCHAR(100),
	Hire_Year INT,
	Hire_Month INT,
	Hire_Day INT
)

INSERT INTO @CHINCHO VALUES
('Nika', 2022, 8, 6),
('Lado', 2021, 7, 10),
('Leri', 2020, 6, 11),
('Tornike', 2019, 5, 16),
('Zura', 2018, 4, 19),
('Levan', 2017, 3, 26),
('Malxazi', 2016, 2, 28),
('Ucha', 2015, 1, 29),
('Tamar', 2014, 12, 7),
('Nata', 2013, 11, 15);

SELECT 
	*,
	DATEFROMPARTS(Hire_Year, Hire_Month, Hire_Day) AS Hire_Date
FROM @CHINCHO;