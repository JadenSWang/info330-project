-- [#10] get people who played and directed the same movie
-- Jaden Wang

SELECT *
FROM PROFESSIONAL P1
WHERE 'Actor' IN (SELECT POSITION.position_name
                  FROM PRODUCTION
                           JOIN PRODUCTION_TYPE
                                ON PRODUCTION.production_type_id = PRODUCTION_TYPE.production_type_id
                           JOIN CREDIT ON CREDIT.production_id = PRODUCTION.production_id
                           JOIN PROFESSIONAL ON PROFESSIONAL.professional_id = CREDIT.professional_id
                           JOIN POSITION ON CREDIT.position_id = POSITION.position_id
                  WHERE P1.professional_id = PROFESSIONAL.professional_id)
  AND 'Director' IN (SELECT POSITION.position_name
                     FROM PRODUCTION
                              JOIN PRODUCTION_TYPE
                                   ON PRODUCTION.production_type_id = PRODUCTION_TYPE.production_type_id
                              JOIN CREDIT ON CREDIT.production_id = PRODUCTION.production_id
                              JOIN PROFESSIONAL ON PROFESSIONAL.professional_id = CREDIT.professional_id
                              JOIN POSITION ON CREDIT.position_id = POSITION.position_id
                     WHERE P1.professional_id = PROFESSIONAL.professional_id)

