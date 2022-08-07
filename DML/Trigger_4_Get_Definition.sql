-- EXTRACT INFORMATION ABOUT TRIGGERS:

-- 1)
SELECT
	definition
FROM sys.sql_modules
WHERE object_id = OBJECT_ID('tg_Shippers');

-- 2)
SELECT OBJECT_DEFINITION(OBJECT_ID('tg_Shippers')) AS Definition_Of_Trigger;

-- 3)
EXECUTE sp_helptext 'dbo.tg_Shippers';