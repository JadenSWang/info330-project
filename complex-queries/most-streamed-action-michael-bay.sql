-- Brian Park
-- [#3] production that has been streamed the most in the genre 'Action' that has been directed
-- by professional 'Michael Bay' that has also been produced by the company 'Marvel Cinematic Universe'
-- and streamed by Customer 'Brian'

SELECT A.production_id, A.production_name
FROM
(SELECT P.production_id, P.production_name
FROM PRODUCTION P
    JOIN CREDIT C on P.production_id = C.production_id
    JOIN PROFESSIONAL PR on C.professional_id = PR.professional_id
    JOIN GENRE G on P.genre_id = G.genre_id
WHERE G.genre_name = 'Action'
AND PR.professional_fname = 'Michael'
AND PR.professional_lname = 'Bay'
GROUP BY P.production_id, P.production_name) AS A,

(SELECT P.production_id, P.production_name
FROM CUSTOMER CU
    JOIN STREAM S on CU.customer_id = S.customer_id
    JOIN PRODUCTION P on S.production_id = P.production_id
    JOIN COMPANY_PROD CP on P.production_id = CP.production_id
    JOIN COMPANY COM on CP.company_id = COM.company_id
WHERE COM.company_name = 'Marvel Cinematic Universe'
AND CU.customer_username = 'Brian'
GROUP BY P.production_id, P.production_name) AS B

WHERE A.production_id = B.production_id
