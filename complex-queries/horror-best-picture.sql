-- [#2] production with the lowest review for the genre ‘horror’
-- that also has been nominated for award name ‘best picture’
SELECT TOP 1 PRODUCTION.production_name
FROM PRODUCTION
    JOIN GENRE ON PRODUCTION.genre_id = GENRE.genre_id
    JOIN PRODUCTION_NOMINATION ON PRODUCTION.production_id = PRODUCTION_NOMINATION.production_id
WHERE GENRE.genre_name = 'Horror'
    AND PRODUCTION_NOMINATION.received = 1
ORDER BY PRODUCTION.average_stars ASC

