-- [#8] least reviews for production type ‘Movie’ of genre ‘Thriller’

SELECT COUNT(R.review_id) AS num_review
FROM REVIEW R
    JOIN PRODUCTION_REVIEW PR on R.review_id = PR.review_id
    JOIN PRODUCTION P on PR.production_id = P.production_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
    JOIN GENRE ON GENRE.genre_id = P.genre_id
WHERE GENRE.genre_name = 'Sci-Fi'
    AND PT.production_name = 'Movie'
ORDER BY num_review DESC

