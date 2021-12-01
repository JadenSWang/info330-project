CREATE PROCEDURE INSERT_SUBSCRIPTION
@company_name VARCHAR(256),
@role_name VARCHAR(30),
@customer_username VARCHAR(50),
@production_name VARCHAR(256),
@customer_dob DATE
AS
DECLARE @CP_ID INT, @C_ID INT
SET @CP_ID = (
    SELECT CP.company_prod_id
    FROM COMPANY_PROD CP
        JOIN COMPANY_ROLE CR ON CR.company_role_id = CP.company_role_id
        JOIN COMPANY C ON C.company_id = CP.company_id
        JOIN PRODUCTION P ON P.production_id = CP.production_id
    WHERE C.company_name = @company_name
    AND CR.role_name = @role_name
    AND P.production_name = @production_name
)
SET @C_ID = (
    SELECT C.customer_id
    FROM CUSTOMER C
    WHERE C.customer_username = @customer_username
    AND C.customer_dob = @customer_dob
)

BEGIN TRANSACTION T1
INSERT INTO SUBSCRIPTION (company_prod_id, customer_id)
VALUES
(@CP_ID, @C_ID)
COMMIT TRANSACTION T1

-- EXEC INSERT_SUBSCRIPTION
-- @company_name = '',
-- @role_name = '',
-- @customer_username = '',
-- @production_name = '',
-- @customer_dob = ''
-- GO;
