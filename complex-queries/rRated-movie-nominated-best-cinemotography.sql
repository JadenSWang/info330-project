-- [#9] production type 'Movie' with a rating of 'R-rated' that had been
-- nominated for 'Best Cinemotography'
SELECT *
FROM PRODUCTION
         JOIN RATING ON PRODUCTION.rating_id = RATING.rating_id
         JOIN PRODUCTION_NOMINATION ON PRODUCTION_NOMINATION.production_id = PRODUCTION.production_id
         JOIN AWARD ON PRODUCTION_NOMINATION.award_id = AWARD.award_id
WHERE AWARD.award_name = 'Best Picture'
    AND RATING.rating_name = 'R'

