CREATE PROCEDURE INSERT_COMPANY (@name VARCHAR(256), @company_type_name VARCHAR(50), @country_name VARCHAR(60))
AS 
BEGIN
	DECLARE @company_type_id INTEGER = (SELECT company_type_id
                                       FROM COMPANY_TYPE
                                       WHERE company_type_name = @company_type_name)
	DECLARE @country_id INTEGER = (SELECT country_id
                                   FROM COUNTRY
                                   WHERE country_name = @country_name)
	INSERT INTO COMPANY (name, company_type_id, country_id)
	VALUES (@name, @company_type_id, @country_id)
END

-- EXEC INSERT_COMPANY 'Disney', 'Parent', 'United States'
