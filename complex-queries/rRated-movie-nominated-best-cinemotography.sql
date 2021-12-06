-- [#9] production type 'Movie' with a rating of 'R-rated' that had been 
-- nominated for 'Best Cinemotography'

SELECT PT.production_type_id
FROM RATING R
    JOIN PRODUCTION P on R.rating_id = P.rating_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
WHERE (
    SELECT PN.award_id
    FROM AWARD A
    JOIN PRODUCTION_NOMINATION PN on A.award_id = PN.award_id
    WHERE PN.award_id = 'Best Cinemotography')
AND PT.production_name = 'Movie'
AND R.rating_name = 'R-rated'