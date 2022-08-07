-- CHECKSUM_AGG Function: Check the difference when data is changed in the Table(Column)

DECLARE @CHINCHO TABLE(
	Numbers INT
);

INSERT INTO @CHINCHO VALUEs (1), (2), (3), (4), (5), (6);

SELECT
	CHECKSUM_AGG(Numbers) AS First_CHECKSUM_AGG
FROM @CHINCHO;

INSERT INTO @CHINCHO VALUEs (7), (8), (9), (10), (11), (12);

SELECT
	CHECKSUM_AGG(Numbers) AS Second_CHECKSUM_AGG
FROM @CHINCHO;