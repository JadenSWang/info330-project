-- [#6] companies with the highest number of streams for genre 'Comedy'
-- [NOT SUBMITTED, HAS SEP FILE]
SELECT C.company_name, MAX(S.production_id)
FROM COMPANY C
    JOIN COMPANY_PROD CP on C.company_id = CP.company_id
    JOIN PRODUCTION P on CP.production_id = P.production_id
    JOIN STREAM S on P.production_id = S.production_id
WHERE (
    SELECT genre_name
    FROM GENRE
    WHERE genre_name = 'Comedy')
GROUP BY C.company_name