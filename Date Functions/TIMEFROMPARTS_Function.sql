DECLARE @CHINCHO TABLE(
	First_Name VARCHAR(200),
	Leave_Hour INT,
	Leave_Minute INT,
	Leave_Second INT
)

INSERT INTO @CHINCHO VALUES 
('Nika', 4, 12, 30),
('Lado', 16, 5, 20),
('Leri', 19, 7, 15),
('Tornike', 13, 11, 10),
('Zura', 15, 10, 25),
('Levan', 3, 3, 35),
('Malxazi', 11, 10, 30),
('Ucha', 7, 8, 29),
('Tamar', 5, 10, 30),
('Nata', 6, 9, 20);


SELECT *,
	TIMEFROMPARTS
				(
					Leave_Hour,
					Leave_Minute,
					Leave_Second,
					0,
					0
				) AS Leave_Time
FROM @CHINCHO;
