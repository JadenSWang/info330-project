-- Selina Dinh
--

CREATE PROCEDURE INSERT_ALLOWED_COUNTRIES (
    @prodName VARCHAR(256),
    @country VARCHAR(50)
) 
AS 
DECLARE @prod_id, country_id INTEGER
BEGIN TRANSACTION T1
    SET @prod_id = (SELECT production_id, FROM PRODUCTION, WHERE production_name = @prodName)
    SET @country = (SELECT country_id, FROM COUNTRY, WHERE country_name = @country)

    INSERT INTO
    ALLOWED_COUNTRIES(production_id, country_id)
    VALUES (@prod_id, @country)
COMMIT TRANSACTION T1
