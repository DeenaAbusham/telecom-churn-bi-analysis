-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 01 - Executive KPIs
-- ============================================

SELECT
    COUNT(*) AS total_customers,

    SUM(CASE
        WHEN churn = 'Yes' THEN 1
        ELSE 0
    END) AS churned_customers,

    SUM(CASE
        WHEN churn = 'No' THEN 1
        ELSE 0
    END) AS retained_customers,

    ROUND(
        100.0 * SUM(CASE
            WHEN churn = 'Yes' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS churn_rate,

    ROUND(
        100.0 * SUM(CASE
            WHEN churn = 'No' THEN 1
            ELSE 0
        END) / COUNT(*),
        2
    ) AS retention_rate,

    ROUND(AVG(monthly_charges), 2) AS avg_monthly_charge,

    ROUND(SUM(monthly_charges), 2) AS total_monthly_revenue

FROM telecom_customers_clean;

