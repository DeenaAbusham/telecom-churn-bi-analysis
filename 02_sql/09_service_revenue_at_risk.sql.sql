-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 09 - Revenue at Risk by Internet Service
-- ============================================

SELECT
    internet_service,

    COUNT(*) AS churned_customers,

    ROUND(
        SUM(monthly_charges),
        2
    ) AS monthly_revenue_at_risk,

    ROUND(
        AVG(monthly_charges),
        2
    ) AS avg_monthly_charge_churned,

    ROUND(
        100.0 *
        SUM(monthly_charges) /
        (
            SELECT SUM(monthly_charges)
            FROM telecom_churn_clean
        ),
        2
    ) AS percentage_of_total_revenue

FROM telecom_churn_clean

WHERE churn = 'Yes'

GROUP BY internet_service

ORDER BY monthly_revenue_at_risk DESC;