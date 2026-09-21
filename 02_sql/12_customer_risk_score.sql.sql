-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 12 - Customer Risk Score
-- ============================================

WITH customer_scoring AS (

    SELECT
        customer_id,
        tenure,
        contract,
        internet_service,
        payment_method,
        monthly_charges,
        total_charges,
        churn,

        -- Calculate risk points
        (
            CASE
                WHEN contract = 'Month-to-month' THEN 2
                ELSE 0
            END

            +

            CASE
                WHEN tenure <= 12 THEN 2
                ELSE 0
            END

            +

            CASE
                WHEN payment_method = 'Electronic check' THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN internet_service = 'Fiber optic' THEN 1
                ELSE 0
            END

            +

            CASE
                WHEN monthly_charges >= 70 THEN 1
                ELSE 0
            END
        ) AS risk_score

    FROM telecom_churn_clean
)

SELECT
    customer_id,
    tenure,
    contract,
    internet_service,
    payment_method,
    monthly_charges,
    total_charges,
    churn,
    risk_score,

    CASE
        WHEN risk_score >= 5 THEN 'High Risk'
        WHEN risk_score >= 3 THEN 'Medium Risk'
        ELSE 'Lower Risk'
    END AS risk_segment

FROM customer_scoring

ORDER BY risk_score DESC, monthly_charges DESC;