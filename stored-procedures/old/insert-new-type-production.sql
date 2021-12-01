CREATE PROCEDURE NEW_PROD_NEW_TYPE
@prod_name VARCHAR(50),
@r_name VARCHAR(5)
AS
DECLARE @P_ID, @R_ID
INSERT INTO PRODUCTION_TYPE (production_name)
VALUES
(@prod_name)
SET @P_ID = (
        SELECT SCOPE_IDENTITY()
    )
SET @R_ID = (
        SELECT R.rating_id
        FROM RATING R
        WHERE R.rating_name = @r_name
    )
INSERT INTO PRODUCTION (production_type_id, rating_id)
VALUES
(@P_ID, @R_ID)

EXECUTE NEW_PROD_NEW_TYPE
@prod_name = 'New Production'
@r_name = NULL
