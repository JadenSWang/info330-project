CREATE PROCEDURE INSERT_COMPANY_TYPE (@company_type_name VARCHAR(50))
AS
BEGIN
	INSERT INTO COMPANY_TYPE (company_type_name)
    VALUES (@company_type_name)
END

-- EXEC INSERT_COMPANY_TYPE 'Parent'
-- EXEC INSERT_COMPANY_TYPE 'Streaming'
