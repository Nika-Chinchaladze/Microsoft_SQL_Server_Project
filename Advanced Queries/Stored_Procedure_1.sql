/* 
Procedure should return CustomerNames along with another CustomerNames and They Sould be from the same Country;
*/

CREATE PROCEDURE sp_get_Local_Citizens
AS
BEGIN
	SELECT
		c.CustomerName,
		u.CustomerName,
		c.Country
	FROM Customers AS c, Customers AS u
	WHERE c.CustomerName != u.CustomerName AND c.Country = u.Country
	ORDER BY c.Country ASC;
END;

-- EXECUTE sp_get_Local_Citizens;

-- DROP PROCEDURE sp_get_Local_Citizens;