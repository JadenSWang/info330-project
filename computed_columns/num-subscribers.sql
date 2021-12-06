CREATE FUNCTION fnNumSubscribers(@company_id INTEGER)
    RETURNS INTEGER
AS
BEGIN
    DECLARE @RET INTEGER = (
        SELECT COUNT(*)
        FROM SUBSCRIPTION
                 JOIN COMPANY_PROD ON COMPANY_PROD.company_prod_id = SUBSCRIPTION.company_prod_id
                 JOIN COMPANY ON COMPANY.company_id = COMPANY_PROD.company_id
        WHERE COMPANY.company_id = @company_id
    )

    RETURN @RET
END

ALTER TABLE COMPANY
ADD num_subscribers AS (dbo.fnNumSubscribers(COMPANY.company_id))
