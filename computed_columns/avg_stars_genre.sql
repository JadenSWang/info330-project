CREATE FUNCTION calcAvgStarsPerGenre(@genre_id INTEGER)
RETURNS DECIMAL (2,1)
AS
BEGIN
    RETURN (SELECT AVG(REVIEW.rating_stars) FROM REVIEW
        JOIN PRODUCTION_REVIEW ON REVIEW.review_id = PRODUCTION_REVIEW.review_id
        JOIN PRODUCTION ON PRODUCTION.production_id = PRODUCTION_REVIEW.production_id
        WHERE PRODUCTION.genre_id = @genre_id)
END

ALTER TABLE GENRE
ADD avg_stars AS (dbo.calcAvgStarsPerGenre(GENRE.genre_id))