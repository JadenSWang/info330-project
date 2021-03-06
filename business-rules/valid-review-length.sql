-- Patrick Liu
-- Business rule that makes sure that the minimun length of a review must be 10 characters

CREATE FUNCTION fnValidReviewLength()
    RETURNS INTEGER
    AS
    BEGIN
        DECLARE @RET INTEGER = 0
        IF EXISTS (
            SELECT R.review_id
            FROM REVIEW R
            WHERE LEN(R.review) < 10
        )
        SET @RET = 1
        RETURN @RET
END
GO

ALTER TABLE REVIEW
ADD CONSTRAINT checkReviewLength
CHECK (dbo.fnValidReviewLength() = 0)
