-- Selina Dinh
-- [#8] least reviews for production type ‘Movie’ of genre ‘Thriller’

SELECT P.production_name, COUNT(R.review_id) AS num_review
FROM REVIEW R
    JOIN PRODUCTION_REVIEW PR on R.review_id = PR.review_id
    JOIN PRODUCTION P on PR.production_id = P.production_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
    JOIN GENRE ON GENRE.genre_id = P.genre_id
    JOIN (
        SELECT G.genre_id
        FROM GENRE G
        WHERE G.genre_name = 'Sci-Fi'
    ) GSF ON GSF.genre_id = GENRE.genre_id
WHERE PT.production_name = 'Movie'
GROUP BY P.production_name
ORDER BY num_review DESC
