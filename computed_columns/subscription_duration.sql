-- Patrick Liu

ALTER TABLE SUBSCRIPTION
ADD duration_days AS DATEDIFF(day, SUBSCRIPTION.subscription_date, GETDATE())