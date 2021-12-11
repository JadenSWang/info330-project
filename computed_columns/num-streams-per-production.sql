-- Computed columns to find the number of streams that a production has
-- Jaden Wang

CREATE FUNCTION fnCountNumStreamed(@production_id INTEGER)
    RETURNS INTEGER
AS
BEGIN
    DECLARE
        @RET INTEGER = (
            SELECT COUNT(*)
            FROM STREAM
            WHERE production_id = @production_id)
    RETURN @RET
END
GO

ALTER TABLE PRODUCTION
ADD views AS (dbo.fnCountNumStreamed(PRODUCTION.production_id))
