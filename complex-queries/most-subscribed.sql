SELECT
    COMPANY.company_name, COUNT(SUBSCRIPTION.subscription_id) AS num_subscribers
FROM
    COMPANY
    JOIN COMPANY_PROD ON COMPANY_PROD.company_id = COMPANY.company_id
    JOIN COMPANY_ROLE ON COMPANY_ROLE.company_role_id = COMPANY_PROD.company_role_id
    JOIN SUBSCRIPTION ON SUBSCRIPTION.company_prod_id = COMPANY_PROD.company_prod_id
WHERE COMPANY_ROLE.role_name = 'Streaming'
GROUP BY COMPANY.company_name
ORDER BY num_subscribers DESC
