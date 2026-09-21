-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 07 - Contract + Tenure Analysis
-- ============================================

WITH customer_groups AS (
    SELECT
        contract,

        CASE
            WHEN tenure <= 12 THEN '0-12 Months'
            WHEN tenure <= 24 THEN '13-24 Months'
            WHEN tenure <= 48 THEN '25-48 Months'
            ELSE '49+ Months'
        END AS tenure_group,

        churn,
        monthly_charges

    FROM telecom_churn_clean
)

SELECT
    contract,
    tenure_group,

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

FROM customer_groups

GROUP BY
    contract,
    tenure_group

ORDER BY
    contract,
    MIN(
        CASE
            WHEN tenure_group = '0-12 Months' THEN 1
            WHEN tenure_group = '13-24 Months' THEN 2
            WHEN tenure_group = '25-48 Months' THEN 3
            ELSE 4
        END
    );