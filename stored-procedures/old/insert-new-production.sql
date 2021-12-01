CREATE PROCEDURE NEW_PROD
@role VARCHAR(30),
@com_name VARCHAR(256),
@com_type VARCHAR(50),
AS
DECLARE @CRID INT, @CID INT
SET @CRID = (
        SELECT CO.company_id
        FROM COMPANY CO
            JOIN COMPANY_TYPE CT ON CT.company_type_id = CO.company_type_id
        WHERE CT.company_type_name = @com_name
        AND CO.company_name = @com_name
    )
SET @CID = (
        SELECT CR.company_role_id
        FROM COMPANY_ROLE CR
        WHERE CR.role_name = @role
    )
INSERT INTO COMPANY_PROD (company_role_id, company_id)
VALUES
(@CRID, @CID)

EXECUTE NEW_PROD
@role = 'Streams movies on demand'
@com_name = 'Netflix'
@com_type = 'Streaming service'
GO;
