CREATE FUNCTION fnAverageStars(@PK INT)
    RETURNS INTEGER
    AS BEGIN
        DECLARE @RET INTEGER = (
            SELECT AVG(R.rating_stars)
            FROM PRODUCTION_REVIEW PR
                JOIN PRODUCTION P ON P.production_id = PR.production_id
                JOIN REVIEW R ON R.review_id = PR.review_id
            WHERE P.production_id = @PK
        )
        RETURN @RET
    END
GO

ALTER TABLE PRODUCTION
ADD average_stars AS (dbo.fnAverageStars(production_id))
