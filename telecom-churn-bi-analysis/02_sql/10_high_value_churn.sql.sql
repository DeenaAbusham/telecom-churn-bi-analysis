-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 10 - High-Value Churned Customers
-- ============================================

SELECT
    customer_id,
    tenure,
    contract,
    internet_service,
    payment_method,
    monthly_charges,
    total_charges
FROM telecom_churn_clean

WHERE churn = 'Yes'

ORDER BY monthly_charges DESC
LIMIT 20;