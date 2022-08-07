DECLARE @CHINCHO TABLE(
	Alphabet VARCHAR(1),
	Ascii_Code INT
);

DECLARE @Counter AS INT = 65;

WHILE @Counter <= 90
BEGIN
	INSERT INTO @CHINCHO VALUES(CHAR(@Counter), ASCII(CHAR(@Counter)));
	SET @Counter = @Counter + 1
END;

SELECT * FROM @CHINCHO;