-- Selina Dinh

CREATE FUNCTION dbo.reviewMustHaveRating()
RETURNS INTEGER
AS
    BEGIN
    DECLARE @RET = 0
IF EXISTS (
    SELECT RE.review_id
    FROM REVIEW RE
        JOIN PRODUCTION P ON P.review_id = RE.review_id
        JOIN RATING RA ON RA.rating_id = P.rating_id
    WHERE RA.rating_name = NULL
)
SET @RET = 1
RETURN @RET
END
GO;

ALTER TABLE REVIEW
ADD CONSTRAINT fnReviewAndRating
CHECK (dbo.reviewMustHaveRating() = 0)
GO;
