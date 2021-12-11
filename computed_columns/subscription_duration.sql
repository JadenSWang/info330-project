-- alters the table SUBSCRIPTION to add the duration in days that a customer has 
--  been a subscriber for
-- Patrick Liu

ALTER TABLE SUBSCRIPTION
ADD duration_days AS DATEDIFF(day, SUBSCRIPTION.subscription_date, GETDATE())