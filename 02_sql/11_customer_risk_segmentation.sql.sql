-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 11 - Customer Risk Segmentation
-- ============================================

WITH customer_risk AS (

    SELECT
        customer_id,
        tenure,
        contract,
        internet_service,
        payment_method,
        monthly_charges,
        total_charges,
        churn,

        CASE
            WHEN contract = 'Month-to-month'
                 AND tenure <= 12
                 AND monthly_charges >= 70
                THEN 'High Risk'

            WHEN contract = 'Month-to-month'
                 OR tenure <= 12
                 OR monthly_charges >= 70
                THEN 'Medium Risk'

            ELSE 'Lower Risk'
        END AS risk_segment

    FROM telecom_churn_clean
)

SELECT
    risk_segment,

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
    ) AS monthly_revenue

FROM customer_risk

GROUP BY risk_segment

ORDER BY
    CASE
        WHEN risk_segment = 'High Risk' THEN 1
        WHEN risk_segment = 'Medium Risk' THEN 2
        ELSE 3
    END;