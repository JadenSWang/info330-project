SELECT Top 3 P.production_name
FROM PRODUCTION P
    JOIN CREDIT C on P.production_id = C.production_id
    JOIN POSITION PO on C.position_id = PO.position_id
    JOIN PROFESSIONAL PR on C.professional_id = PR.professional_id
WHERE PO.position_name = 'producer'
AND PR.professional_fname = 'Jane'
AND PR.professional_lname = 'Doe'
ORDER BY P.production_id