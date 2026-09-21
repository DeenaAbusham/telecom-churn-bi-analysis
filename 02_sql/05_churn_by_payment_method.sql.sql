-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 05 - Churn by Payment Method
-- ============================================

SELECT
    payment_method,

    COUNT(*) AS total_customers,

    SUM(
        CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END
    ) AS churned_customers,

    ROUND(
        100.0 *
        SUM(
            CASE
                WHEN churn = 'Yes' THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS churn_rate,

    ROUND(
        AVG(monthly_charges),
        2
    ) AS avg_monthly_charge,

    ROUND(
        SUM(monthly_charges),
        2
    ) AS total_monthly_revenue

FROM telecom_churn_clean

GROUP BY payment_method

ORDER BY churn_rate DESC;