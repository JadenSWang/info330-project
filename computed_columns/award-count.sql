CREATE FUNCTION fnAwardCount(@PK INT)
    RETURNS INTEGER
    AS BEGIN
        DECLARE @RET INTEGER = (
            SELECT COUNT(A.award_id)
            FROM PRODUCTION P
                JOIN AWARD A ON A.award_id = P.award_id
            WHERE P.production_id = @PK
        )
        RETURN @RET
    END
GO

ALTER TABLE PRODUCTION
ADD productionAwardCount AS (dbo.fnAwardCount(production_id))
