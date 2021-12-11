-- Jaden Wang 2065677
-- This function inserts a production nomination

CREATE PROCEDURE INSERT_PRODUCTION_NOMINATIONS @award_name VARCHAR(256),
                                               @production_name VARCHAR(256),
                                               @received BIT
AS
DECLARE
    @award_id INTEGER, @production_id INTEGER
BEGIN TRANSACTION T1
    SET
        @award_id = (SELECT award_id
                     FROM AWARD
                     WHERE award_name = @award_name)
    SET
        @production_id = (SELECT production_id
                          FROM PRODUCTION
                          WHERE production_name = @production_name)
    INSERT INTO PRODUCTION_NOMINATION(award_id, production_id, received)
    VALUES (@award_id, @production_id, @received)
COMMIT TRANSACTION T1
go

