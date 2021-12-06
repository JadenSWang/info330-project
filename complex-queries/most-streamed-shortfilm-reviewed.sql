-- [#7] most streamed production type ‘Short film’ that has also reviewed by more than 5 people
-- [IN PROGRESS]
SELECT TOP 1 PT.production_type_id
FROM STREAM S
    JOIN PRODUCTION P on S.production_id = P.production_id
    JOIN PRODUCTION_TYPE PT on S.production_type_id = PT.production_type_id
WHERE (
    SELECT COUNT(Review.review_id) AS num_review
    FROM REVIEW
    ORDER BY num_reviewers)
AND PRODUCTION_TYPE.production_name = 'Short film'
AND num_review > 5