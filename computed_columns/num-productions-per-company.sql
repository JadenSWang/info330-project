CREATE FUNCTION numProdPerComp(@company_id INTEGER)
RETURNS INTEGER
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM PRODUCTION
                JOIN COMPANY_PROD ON PRODUCTION.production_id = COMPANY_PROD.production_id
            WHERE COMPANY_PROD.company_id = @company_id)
END
GO

ALTER TABLE COMPANY
ADD num_productions AS (dbo.numProdPerComp(COMPANY.company_id))
