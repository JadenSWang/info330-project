CREATE PROCEDURE INSERT_COMPANY_PRODUCTION
    @role_name VARCHAR(30),
    @company_name VARCHAR(256),
    @production_name VARCHAR(50)
AS
DECLARE @CR_ID INT, @C_ID INT, @P_ID INT
SET @CR_ID = (
    SELECT CR.company_role_id
    FROM COMPANY_ROLE CR
    WHERE CR.role_name = @role_name
)
SET @C_ID = (
    SELECT C.company_id
    FROM COMPANY C
        JOIN COUNTRY CO ON CO.country_id = C.country_id
    WHERE C.company_name = @company_name
)
SET @P_ID = (
    SELECT P.production_id
    FROM PRODUCTION P
    WHERE P.production_name = @production_name
)
BEGIN TRANSACTION T1
    INSERT INTO COMPANY_PROD (company_role_id, company_id, production_id)
    VALUES
    (@CR_ID, @C_ID, @P_ID)
COMMIT TRANSACTION T1

-- EXECUTE INSERT_COMPANY_PRODUCTION
-- @role_name = '',
-- @company_name = '',
-- @country_name = '',
-- @production_type_name = '',
-- @genre_name = '',
-- @rating_name = '',
-- @production_name = ''
-- GO;
