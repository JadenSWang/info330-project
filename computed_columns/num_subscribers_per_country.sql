-- Patrick Liu

CREATE FUNCTION numSubscribersByCountry(@country_id INTEGER)
RETURNS INTEGER
AS
BEGIN
    RETURN (SELECT COUNT(*) FROM CUSTOMER WHERE customer_country_id = @country_id)
END
GO

ALTER TABLE COUNTRY
ADD subscriber_count AS (dbo.numSubscribersByCountry(COUNTRY.country_id))

