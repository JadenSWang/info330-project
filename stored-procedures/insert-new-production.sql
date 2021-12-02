CREATE PROCEDURE NEW_PROD
@production_type_name VARCHAR(50),
@genre_name VARCHAR(50),
@rating_name VARCHAR(50),
@production_name VARCHAR(256)
AS
DECLARE
@PT_ID INTEGER, @A_ID INTEGER, @G_ID INTEGER, @R_ID INTEGER
SET @PT_ID = (
    SELECT PT.production_type_id
    FROM PRODUCTION_TYPE PT
    WHERE PT.production_name = @production_type_name
)

SET @G_ID = (
    SELECT G.genre_id
    FROM GENRE G
    WHERE G.genre_name = @genre_name
)

SET @R_ID = (
    SELECT R.rating_id
    FROM RATING R
    WHERE R.rating_name = @rating_name
)

BEGIN TRANSACTION T1
INSERT INTO PRODUCTION (production_type_id, genre_id, rating_id, production_name)
VALUES
(@PT_ID, @A_ID, @G_ID, @R_ID, @production_name)
COMMIT TRANSACTION T1

-- EXECUTE NEW_PROD
-- @production_name = '',
-- @award_name = '',
-- @genre_name = '',
-- @rating_name = '',
-- @production_name = ''
