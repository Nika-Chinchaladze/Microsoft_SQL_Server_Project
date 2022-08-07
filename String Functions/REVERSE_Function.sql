-- Find Palindromes;
DECLARE @CHINCHO TABLE(
	Names VARCHAR(100)
);

INSERT INTO @CHINCHO VALUES
('kayak'),
('deified'),
('NIKA'),
('repaper'),
('deed'),
('LERI'),
('wow'),
('NATA'),
('civic'),
('TAMAR');

SELECT 
	*,
	CASE
		WHEN Names = REVERSE(Names) THEN 'Is_Palindrom'
		ELSE 'Not_Palindrom'
	END Check_Palindrom
FROM @CHINCHO
ORDER BY Check_Palindrom ASC;