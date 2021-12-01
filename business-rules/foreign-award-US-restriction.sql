CREATE FUNCTION ForeignAwardUSRestriction()
RETURNS INTEGER
AS
BEGIN

DECLARE @RET INTEGER = 0
IF EXISTS (
    SELECT *
    FROM NOMINATION N
        JOIN AWARD A on N.award_id = A.award_id
        JOIN PRODUCTION P on A.award_id = P.award_id
        JOIN COMPANY_PROD CP on P.production_id = CP.production_id
        JOIN COMPANY C on CP.company_id = C.company_id
        JOIN COUNTRY CO on C.country_id = CO.country_id
    WHERE A.award_name = 'Best Foreign Film'
    AND CO.country_name = 'United States'
)

SET @RET = 1
RETURN @RET
END
GO

ALTER TABLE NOMINATION
ADD CONSTRAINT noUSForeignAward
CHECK (dbo.ForeignAwardUSRestriction() = 0)
