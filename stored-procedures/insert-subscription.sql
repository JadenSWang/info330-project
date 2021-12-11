-- Patrick Liu

CREATE PROCEDURE INSERT_SUBSCRIPTION
@company_name VARCHAR(256),
@customer_username VARCHAR(50)
AS
DECLARE @CP_ID INT, @C_ID INT
SET @CP_ID = (
    SELECT company_prod_id
    FROM COMPANY_PROD
        JOIN COMPANY ON COMPANY_PROD.company_id = COMPANY.company_id
    WHERE COMPANY.company_name = @company_name
)
SET @C_ID = (
    SELECT C.customer_id
    FROM CUSTOMER C
    WHERE C.customer_username = @customer_username
)

BEGIN TRANSACTION T1
INSERT INTO SUBSCRIPTION (company_prod_id, customer_id, subscription_date)
VALUES
(@CP_ID, @C_ID, GETDATE())
COMMIT TRANSACTION T1
go

