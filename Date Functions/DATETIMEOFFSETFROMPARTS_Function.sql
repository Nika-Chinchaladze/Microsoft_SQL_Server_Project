DECLARE @CHINCHO TABLE(
	First_Name VARCHAR(200),
	Hire_Year INT,
	Hire_Month INT,
	Hire_Day INT,
	Hire_Hour INT,
	Hire_Minute INT,
	Hire_Second INT,
	Hour_Offset INT,
	Minute_Offset INT
)

INSERT INTO @CHINCHO VALUES 
('Nika', 2022, 8, 6, 3, 2, 4, 12, 30),
('Lado', 2021, 7, 10, 11, 12, 56, 5, 20),
('Leri', 2020, 6, 11, 1, 17, 29, 7, 15),
('Tornike', 2019, 5, 4, 8, 12, 23, 11, 10),
('Zura', 2018, 4, 19, 5, 10, 15, 10, 25),
('Levan', 2017, 3, 26, 8, 25, 30, 3, 35),
('Malxazi', 2016, 2, 28, 3, 7, 11, 10, 30),
('Ucha', 2015, 1, 29, 2, 45, 50, 8, 29),
('Tamar', 2014, 12, 7, 9, 32, 55, 10, 30),
('Nata', 2013, 11, 15, 1, 34, 7, 9, 20);


SELECT *,
	DATETIMEOFFSETFROMPARTS
					(
						Hire_Year, 
						Hire_Month, 
						Hire_Day,
						Hire_Hour,
						Hire_Minute,
						Hire_Second,
						0,
						Hour_Offset,
						Minute_Offset,
						0
					  ) AS Hire_Date
FROM @CHINCHO;
