CREATE FUNCTION fnCountNominations(@PK INT)
    RETURNS INTEGER
    AS BEGIN
        DECLARE @RET INTEGER = (
            SELECT COUNT(N.award_id)
            FROM NOMINATION N
                JOIN PROFESSIONAL P ON P.professional_id = N.professional_id
            WHERE P.professional_id = @PK
        )
        RETURN @RET
    END
GO

ALTER TABLE PROFESSIONAL
ADD nominationCount AS (dbo.fnCountNominations(professional_id))
