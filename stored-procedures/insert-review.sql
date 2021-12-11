-- Jaden Wang 2065677

CREATE PROCEDURE INSERT_REVIEW (@review VARCHAR(MAX), @customer_username VARCHAR(50), @rating_stars INTEGER, @production_name VARCHAR(256))
AS
DECLARE @production_id INTEGER, @review_id INTEGER, @customer_id INTEGER

BEGIN TRANSACTION T1
    SET @production_id = (SELECT production_id FROM PRODUCTION WHERE production_name = @production_name)
    SET @customer_id = (SELECT customer_id FROM CUSTOMER WHERE customer_username = @customer_username)

    INSERT INTO REVIEW (review, rating_stars)
    VALUES (@review, @rating_stars)

    SET @review_id = (SELECT SCOPE_IDENTITY())

    INSERT INTO PRODUCTION_REVIEW (review_id, production_id)
    VALUES (@review_id, @production_id)
COMMIT TRANSACTION T1
