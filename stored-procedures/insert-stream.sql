-- Selina Dinh

CREATE PROCEDURE INSERT_STREAM (@customer_username VARCHAR(30), @production_name VARCHAR(256))
AS
BEGIN TRANSACTION T1
    DECLARE @customer_id INTEGER = (SELECT customer_id FROM CUSTOMER WHERE customer_username = @customer_username)
    DECLARE @production_id INTEGER = (SELECT production_id FROM PRODUCTION WHERE production_name = @production_name)

    INSERT INTO STREAM (customer_id, production_id)
    VALUES (@customer_id, @production_id)
COMMIT TRANSACTION T1
