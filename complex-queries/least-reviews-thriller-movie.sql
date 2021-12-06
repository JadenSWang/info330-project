-- [#8] least reviews for production type ‘Movie’ of genre ‘Thriller’

SELECT COUNT(review_id) AS num_review
FROM REVIEW R
    JOIN PRODUCTION_REVIEW PR on R.review_id = PR.review_id
    JOIN PRODUCTION P on PR.production_id = P.production_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
WHERE (
    SELECT genre_name
    FROM GENRE
    WHERE genre_name = 'Thriller')
AND PT.production_name = 'Movie'
ORDER BY num_review DESC