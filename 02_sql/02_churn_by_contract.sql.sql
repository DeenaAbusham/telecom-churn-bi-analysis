-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 02 - Churn by Contract Type
-- ============================================

SELECT
    contract,

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
    ) AS avg_monthly_charge

FROM telecom_churn_clean

GROUP BY contract

ORDER BY churn_rate DESC;