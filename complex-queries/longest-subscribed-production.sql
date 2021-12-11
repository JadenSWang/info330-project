-- Patrick Liu
-- Selects the distinct production names where the subscription
-- days of that production is greater than 5
SELECT DISTINCT P.production_name
FROM SUBSCRIPTION S
    JOIN COMPANY_PROD CP ON CP.company_prod_id = S.company_prod_id
    JOIN PRODUCTION P ON P.production_id = CP.production_id
WHERE S.duration_days >= ALL (
    SELECT S1.duration_days
    FROM SUBSCRIPTION S1
    WHERE S1.duration_days > 5
)
