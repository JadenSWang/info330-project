-- Selina Dinh
-- [#7] Production type ‘Short film’ that has also reviewed by 3 people
-- With the genre 'Comedy' that has also been produced in the United States
-- by company name 'Netflix'

SELECT A.production_id, A.production_name
FROM
(SELECT P.production_id, P.production_name
FROM PRODUCTION P
    JOIN PRODUCTION_REVIEW PR on P.production_id = PR.production_id
    JOIN REVIEW R on PR.review_id = R.review_id
    JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
    JOIN GENRE G on P.genre_id = G.genre_id
WHERE PT.production_name = 'Short Film'
GROUP BY P.production_id, P.production_name
HAVING COUNT(R.review) = 3) AS A,

(SELECT P.production_id, P.production_name
FROM PRODUCTION P
    JOIN COMPANY_PROD CP on P.production_id = CP.production_id
    JOIN COMPANY C on CP.company_id = C.company_id
    JOIN COUNTRY CO on C.country_id = CO.country_id
WHERE C.company_name = 'Netflix'
AND CO.country_name = 'United States'
GROUP BY P.production_id, P.production_name) AS B

WHERE A.production_id = B.production_id
