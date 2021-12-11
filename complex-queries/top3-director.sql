SELECT TOP 3 Production.production_name
FROM PRODUCTION
         JOIN CREDIT ON PRODUCTION.production_id = CREDIT.production_id
         JOIN POSITION ON CREDIT.position_id = POSITION.position_id
         JOIN PROFESSIONAL ON PROFESSIONAL.professional_id = CREDIT.professional_id
WHERE PROFESSIONAL.professional_fname = 'Steven'
  AND PROFESSIONAL.professional_lname = 'Spielberg'
  AND PROFESSIONAL.professional_dob = '1946-12-18'
ORDER BY PRODUCTION.average_stars DESC
