CREATE FUNCTION fnValidRating()
    RETURNS INTEGER
AS
BEGIN
    DECLARE @RET INTEGER = 0
    IF EXISTS (
        SELECT R.review_id
        FROM REVIEW R
        WHERE R.rating_stars < 1
        OR R.rating_stars > 5
    )
    SET @RET = 1
RETURN @RET
END
GO

ALTER TABLE REVIEW
ADD CONSTRAINT correctRating
CHECK (dbo.fnValidRating() = 0);
