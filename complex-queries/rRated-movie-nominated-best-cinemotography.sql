-- Brian Park
-- [#9] production type 'Movie' with a rating of 'PG-13' with a genre of 'Horror" 
-- that has been nominated for the award 'Best Picture' and has an average star rating of 5 
-- and has won exactly 1 award

SELECT A.production_id, A.production_name
FROM

(SELECT P.production_id, P.production_name
FROM PRODUCTION P
    JOIN GENRE G on P.production_id = G.production_id
    JOIN RATING R on P.rating_id = R.rating_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
WHERE R.rating_name = 'PG-13'
AND PT.production_name = 'Movie'
AND G.genre_name = 'Horror') AS A,


(SELECT P.production_id, P.production_name
FROM PRODUCTION P
    JOIN PRODUCTION_NOMINATION PN on P.production_id = PN.production_id
    JOIN AWARD A on PN.award_id = A.production_id
WHERE A.award_name = 'Best Picture'
AND P.average_stars = 5
AND P.award_count = '1'
GROUP BY P.production_id, P.production_name) AS B

WHERE A.production_id = B.production_id
