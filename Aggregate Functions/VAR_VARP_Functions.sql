-- CHECK STDEV, STDEVP, VAR, VARP Of Table Column:

DECLARE @Chincho TABLE(
	Ages INT
);
------------------------------------------------------------------------
INSERT INTO @Chincho VALUES (10), (11), (12), (13), (14), (15); 

SELECT 
	ROUND(STDEV(Ages), 2) AS Standard_Deviation_1,
	ROUND(STDEVP(Ages), 2) AS Standard_Deviation_2,
	ROUND(VAR(Ages), 2) AS Variance_1,
	ROUND(VARP(Ages), 2) AS Variance_2
FROM @Chincho;

-------------------------------------------------------------------------
INSERT INTO @Chincho VALUES (20), (21), (22), (23), (24), (25);

SELECT 
	ROUND(STDEV(Ages), 2) AS Standard_Deviation_1,
	ROUND(STDEVP(Ages), 2) AS Standard_Deviation_2,
	ROUND(VAR(Ages), 2) AS Variance_1,
	ROUND(VARP(Ages), 2) AS Variance_2
FROM @Chincho;