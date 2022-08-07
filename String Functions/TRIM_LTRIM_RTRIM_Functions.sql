-- Compare: LTRIM, TRIM, RTRIM in Action

DECLARE @CHINCHO TABLE(
	Names VARCHAR(200)
);

INSERT INTO @CHINCHO VALUES
('    NIKA   '),
('LERI   '),
('  LAZVI  '),
('TAMAR'),
('  NATA'),
('   LANA   CHXOBADZE    ');

WITH BOOM AS
(
SELECT 
	Names,
	LTRIM(Names) AS Without_Blanks_LTRIM,
	TRIM(Names) AS Without_Blanks_TRIM,
	RTRIM(Names) AS Without_Blanks_RTRIM
FROM @CHINCHO
)
SELECT 
	Names,
	LEN(Names) AS LEN_Names,
	Without_Blanks_LTRIM,
	LEN(Without_Blanks_LTRIM) AS LEN_LTRIM,
	Without_Blanks_TRIM,
	LEN(Without_Blanks_TRIM) AS LEN_TRIM,
	Without_Blanks_RTRIM,
	LEN(Without_Blanks_RTRIM) AS LEN_RTRIM
FROM BOOM;