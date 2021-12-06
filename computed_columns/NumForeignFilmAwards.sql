-- Number of awards won by the genre ‘foreign film’ and production type 'Movie'


CREATE FUNCTION fnForeignFilmAward(@PK VARCHAR(256))
    RETURNS VARCHAR(256)
    AS BEGIN
        DECLARE @RET VARCHAR(256) = (
            SELECT COUNT(A.award_id)
            FROM PRODUCTION P
                JOIN GENRE G on P.production_id = G.production_id
                JOIN PRODUCTION_TYPE PT on P.production_id = PT.production_id
                JOIN PRODUCTION_NOMINATION P.production_id = PN.production_id
                JOIN AWARD A on PN.award_id = A.award_id
            WHERE A.award_id = @PK
            AND G.genre_name = 'foreign film'
            AND PT.production_name = 'Movie'
        )
        RETURN @RET
    END
GO

ALTER TABLE AWARD
ADD NumForeignFilmAward AS (dbo.fnForeignFilmAward(A.award_id))