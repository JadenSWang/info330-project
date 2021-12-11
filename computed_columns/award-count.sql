-- Creates a computed column to find the number of awards for a production
-- Brian Park

CREATE FUNCTION fnAwardCount(@PK INT)
    RETURNS INTEGER
    AS BEGIN
        DECLARE @RET INTEGER = (
            SELECT COUNT(*)
            FROM PRODUCTION_NOMINATION
                WHERE PRODUCTION_ID = @PK
                AND RECEIVED = 1
        )
        RETURN @RET
    END
GO

ALTER TABLE PRODUCTION
ADD award_count AS (dbo.fnAwardCount(production_id))

SELECT * FROM COMPANY

