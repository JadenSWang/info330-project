CREATE FUNCTION dbo.fnNAReviewsForNewProd()
RETURNS INTEGER
AS
    BEGIN
    DECLARE @RET = 0
IF EXISTS (
    SELECT R.rating_name
    FROM PRODUCTION P
        JOIN RATING R ON R.rating_id = P.rating_id
    WHERE r.rating_name != NULL
)
SET @RET = 1
RETURN @RET
END
GO;

ALTER TABLE PRODUCTION
ADD CONSTRAINT fnNoReviewsInNewProd
CHECK (dbo.fnNAReviewsForNewProd() = 0)
GO;
