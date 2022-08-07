-- 1) DISABLE TRIGGER, THEN INSERT AND DELETE ONE ROW, CHANGES WON'T BE CAUGHT:
DISABLE TRIGGER dbo.tg_Shippers ON dbo.Shippers;

INSERT INTO Shippers VALUES(4, 'Tommy Shelby', '10101010');
DELETE FROM Shippers WHERE ShipperID = 4;

-- Changes won't be displayed in Table_For_Shippers_trigger TABLE, becouse TRIGGER was DISABLED:
SELECT * FROM Table_For_Shippers_trigger;


-- 2) ENABLE TRIGGER, THEN INSERT AND DELETE ONE ROW, CHANGES WILL BE CAUGHT:
ENABLE TRIGGER dbo.tg_Shippers ON dbo.Shippers;

INSERT INTO Shippers VALUES(4, 'Artour Shelby', '555555');
DELETE FROM Shippers WHERE ShipperID = 4;

-- Changes will be displayed in Table_For_Shippers_trigger TABLE, becouse TRIGGER was ENABLED:
SELECT * FROM Table_For_Shippers_trigger;


