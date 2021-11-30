CREATE FUNCTION rRatedRestrictions()
RETURNS INTEGER
AS
BEGIN
	DECLARE @RET INTEGER = 0
    IF EXISTS (
    	SELECT * FROM STREAM
      		JOIN CUSTOMER ON STREAM.customer_id = CUSTOMER.customer_id
      		JOIN PRODUCTION ON STREAM.production_id = PRODUCTION.production_id
      		JOIN RATING ON PRODUCTION.rating_id = RATING.rating_id
      	WHERE
      		DATEDIFF(year, CUSTOMER.customer_dob, GETDATE()) < 17
      		AND RATING.rating_name != 'R'
    )
    SET @RET = 1
    RETURN @RET
END
GO

ALTER TABLE STREAM
ADD CONSTRAINT No_Underage_R_Rated_Streams
CHECK (dbo.rRatedRestrictions() = 0)
