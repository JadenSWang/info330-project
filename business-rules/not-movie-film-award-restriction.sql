-- Brian Park
-- Creates a business rule to ensure tha production_type 'movie' and 'short-film' 
-- can only be nominated for award type ‘film’

CREATE FUNCTION FilmAwardRestriction()
RETURNS INTEGER
AS
BEGIN

DECLARE @RET INTEGER = 0
IF EXISTS (SELECT *
            FROM PRODUCTION_TYPE PT
                JOIN PRODUCTION P on PT.production_type_id = P.production_type_id
                JOIN PRODUCTION_NOMINATION PN on P.production_id = PN.production_id
                JOIN AWARD A on PN.award_id = A.award_id
                JOIN AWARD_TYPE AWT on A.award_type_id = AWT.award_type_id
            WHERE (PT.production_name != 'Movie' AND PT.production_name != 'Short Film')
            AND AWT.award_type_name = 'Film')
SET @RET = 1
RETURN @RET
END
GO

ALTER TABLE PRODUCTION_NOMINATION
ADD CONSTRAINT noNotMovieFilmAward
CHECK (dbo.FilmAwardRestriction() = 0)