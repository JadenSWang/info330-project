-- Patrick Liu
-- [#2] production with the lowest review for the genre ‘horror’
-- that also has been nominated for award name ‘best picture’
-- for movies
WITH PROD_MOVIE AS (
    SELECT P.production_type_id
    FROM PRODUCTION_TYPE P
    WHERE P.production_name = 'Movie'
)
SELECT TOP 1 PRODUCTION.production_name
FROM PRODUCTION
    JOIN GENRE ON PRODUCTION.genre_id = GENRE.genre_id
    JOIN PRODUCTION_NOMINATION ON PRODUCTION.production_id = PRODUCTION_NOMINATION.production_id
    JOIN PRODUCTION_TYPE PT ON PT.production_type_id = PRODUCTION.production_type_id
    JOIN PROD_MOVIE PM ON PM.production_type_id = PT.production_type_id
WHERE GENRE.genre_name = 'Horror'
    AND PRODUCTION_NOMINATION.received = 1
ORDER BY PRODUCTION.average_stars ASC
