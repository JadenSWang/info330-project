CREATE PROCEDURE INSERT_COUNTRY (@country_name VARCHAR(60))
AS
BEGIN
	INSERT INTO COUNTRY (country_name)
    VALUES (@country_name)
END

-- EXEC INSERT_COUNTRY 'United States'
-- EXEC INSERT_COUNTRY 'China'