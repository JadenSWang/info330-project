-- [#2] production with the lowest review for the genre ‘horror’
-- that also has been nominated for award name ‘best picture’
SELECT P.production_name
FROM GENRE G
    JOIN PRODUCTION P on G.genre_id = P.genre_id
    JOIN PRODUCTION_NOMINATION PN on P.production_id = PN.production_id
    JOIN AWARD A on PN.award_id = A.award_name
WHERE IN (
    SELECT MIN(review_id) AS num_review
    FROM REVIEW
    ORDER BY num_review)
AND G.genre_name = 'Horror'
AND A.award_name = 'Best Picture'