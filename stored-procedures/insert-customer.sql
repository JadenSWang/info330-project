-- Selina Dinh

CREATE PROCEDURE INSERT_CUSTOMER (@customer_username VARCHAR(50), @customer_dob DATE, @customer_country_name VARCHAR(60))
AS
DECLARE @country_id INTEGER
BEGIN TRANSACTION T1
    SET @country_id = (SELECT country_id FROM COUNTRY WHERE country_name = @customer_country_name)

    INSERT INTO CUSTOMER (customer_username, customer_dob, customer_country_id)
    VALUES (@customer_username, @customer_dob, @country_id)
COMMIT TRANSACTION T1
