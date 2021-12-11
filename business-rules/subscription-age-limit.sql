-- Jaden Wang
-- To be compliant with child internet safety act, no child 13 and under can have a subscription

CREATE FUNCTION subscriptionAgeLimit()
RETURNS INTEGER
AS
BEGIN
    DECLARE @RET INTEGER = 0
    IF EXISTS (SELECT * FROM SUBSCRIPTION JOIN CUSTOMER ON SUBSCRIPTION.customer_id = CUSTOMER.customer_id WHERE DATEDIFF(year, customer_dob, GETDATE()) < 14)
        SET @RET = 1
    RETURN @RET
END
GO

ALTER TABLE SUBSCRIPTION
ADD CONSTRAINT NO_UNDERAGE_SUBSCRIBERS
CHECK (dbo.subscriptionAgeLimit() = 0)
