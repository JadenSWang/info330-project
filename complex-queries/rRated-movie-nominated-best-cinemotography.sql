SELECT PRODUCTION.production_name
FROM PRODUCTION
         JOIN RATING ON PRODUCTION.rating_id = RATING.rating_id
         JOIN PRODUCTION_NOMINATION ON PRODUCTION_NOMINATION.production_id = PRODUCTION.production_id
         JOIN AWARD ON PRODUCTION_NOMINATION.award_id = AWARD.award_id
         JOIN (
            SELECT P.production_id
            FROM PRODUCTION P
                JOIN STREAM S ON S.production_id = P.production_id
            GROUP BY P.production_id
            HAVING COUNT(S.production_id) >= 1
         ) PC ON PC.production_id = PRODUCTION.production_id
WHERE AWARD.award_name = 'Best Picture'
    AND RATING.rating_name = 'R'
