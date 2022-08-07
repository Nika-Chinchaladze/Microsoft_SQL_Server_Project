-- Query should return List of Triggers:

SELECT
	name,
	is_instead_of_trigger
FROM sys.triggers
WHERE type = 'TR';