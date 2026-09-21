-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 06 - Contract + Payment Method Analysis
-- ============================================

SELECT
    contract,
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
    ) AS churn_rate

FROM telecom_churn_clean

GROUP BY
    contract,
    payment_method

ORDER BY
    contract,
    churn_rate DESC;