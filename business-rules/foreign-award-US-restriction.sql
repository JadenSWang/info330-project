-- Brian Park
-- creates a business rule to ensure that a movie produced by a U.S. company
-- cannot win a the award 'Best Foreign Award'

CREATE FUNCTION fnForeignAwardUSRestriction()
RETURNS INTEGER
AS
BEGIN

DECLARE @RET INTEGER = 0
IF EXISTS (
    SELECT *
    FROM COMPANY_PROD CP
        JOIN COMPANY C ON C.company_id = CP.company_id
        JOIN COUNTRY CO ON CO.country_id = C.country_id
        JOIN PRODUCTION P ON P.production_id = CP.production_id
        JOIN PRODUCTION_NOMINATION PN ON PN.production_id = P.production_id
        JOIN AWARD A ON A.award_id = PN.award_id
    WHERE A.award_name = 'Best Foreign Film'
    AND CO.country_name = 'United States'
)

SET @RET = 1
RETURN @RET
END
GO

ALTER TABLE PRODUCTION_NOMINATION
ADD CONSTRAINT noUSForeignAwards
CHECK (dbo.fnForeignAwardUSRestriction() = 0)
