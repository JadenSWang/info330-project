CREATE FUNCTION fnMaxStreamedProduction(@PK VARCHAR(50))
    RETURNS VARCHAR(256)
    AS BEGIN
        DECLARE @RET VARCHAR(256) = (
            SELECT TOP 1 P.production_name
            FROM SUBSCRIPTION S
                JOIN COMPANY_PROD CP ON CP.company_prod_id = S.company_prod_id
                JOIN COMPANY C ON C.company_id = CP.company_id
                JOIN CUSTOMER CU ON CU.customer_id = S.customer_id
                JOIN STREAM S ON S.customer_id = CU.customer_id
                JOIN PRODUCTION P ON P.production_id = S.production_id
            WHERE CO.company_id = @PK
            ORDER BY COUNT(S.customer_id)
        )
        RETURN @RET
    END
GO

ALTER TABLE COMPANY
ADD bestProduction AS (dbo.fnMaxStreamedProduction(company_id))
