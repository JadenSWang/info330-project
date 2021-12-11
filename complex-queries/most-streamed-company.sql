-- [#6] company with the highest number of streams
-- [NOT SUBMITTED, HAS SEP FILE]
SELECT TOP 1 COMPANY.company_name, COUNT(*) AS num_streams  FROM COMPANY
    JOIN COMPANY_PROD ON COMPANY.company_id = COMPANY_PROD.company_id
    JOIN SUBSCRIPTION ON SUBSCRIPTION.company_prod_id = COMPANY_PROD.company_prod_id
    JOIN CUSTOMER ON CUSTOMER.customer_id = SUBSCRIPTION.customer_id
    JOIN STREAM ON STREAM.customer_id = CUSTOMER.customer_id
GROUP BY COMPANY.company_name
ORDER BY num_streams DESC