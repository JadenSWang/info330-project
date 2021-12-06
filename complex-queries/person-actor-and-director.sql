-- [#10] person who has directed AND acted in production type 'Movie'

SELECT P.professional_fname, P.professional_lname
FROM PROFESSIONAL P
    JOIN CREDIT C on P.professional_id = C.professional_id
    JOIN POSITION PN on C.position_id = PN.position_id
WHERE IN (
    SELECT P.production_name
    FROM PRODUCTION P
        JOIN PRODUCTION_TYPE PT on P.production_type_id = PT.production_type_id
    WHERE P.production_name = 'Movie'
    )
AND PN.position_name = 'Director'
AND PN.position_name = 'Actor'