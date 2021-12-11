-- Selina Dinh
-- Business rule to ensure that a customer must view a production in order to rate it

CREATE FUNCTION VIEW_TO_RATE () RETURNS INTEGER AS BEGIN DECLARE @RET INTEGER = 0 IF EXISTS (
    SELECT
        *
    FROM
        REVIEW
        JOIN PRODUCTION_REVIEW ON PRODUCTION_REVIEW.review_id = REVIEW.review_id
        JOIN PRODUCTION ON PRODUCTION.production_id = PRODUCTION_REVIEW.production_id
        JOIN STREAM ON STREAM.production_id = PRODUCTION.production_id
    WHERE
        STREAM.customer_id = REVIEW.customer_id
        AND PRODUCTION_REVIEW.production_id != STREAM.production_id
)
SET
    @RET = 1 RETURN @RET
ALTER TABLE
    REVIEW
ADD
    CONSTRAINT MUST_VIEW_TO_RATE CHECK (VIEW_TO_RATE() = 0)