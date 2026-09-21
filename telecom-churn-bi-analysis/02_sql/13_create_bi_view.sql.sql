-- ============================================
-- TELECOM CUSTOMER CHURN BI PROJECT
-- 13 - BI-Ready Analytical View
-- ============================================

CREATE OR REPLACE VIEW vw_telecom_churn_bi AS

WITH customer_scoring AS (

    SELECT
        customer_id,
        gender,
        senior_citizen,
        partner,
        dependents,
        tenure,
        phone_service,
        multiple_lines,
        internet_service,
        online_security,
        online_backup,
        device_protection,
        tech_support,
        streaming_tv,
        streaming_movies,
        contract,
        paperless_billing,
        payment_method,
        monthly_charges,
        total_charges,
        churn,

        -- Tenure group
        CASE
            WHEN tenure <= 12 THEN '0-12 Months'
            WHEN tenure <= 24 THEN '13-24 Months'
            WHEN tenure <= 48 THEN '25-48 Months'
            ELSE '49+ Months'
        END AS tenure_group,

        -- Customer risk score
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
    gender,
    senior_citizen,
    partner,
    dependents,

    tenure,
    tenure_group,

    contract,

    phone_service,
    multiple_lines,
    internet_service,

    online_security,
    online_backup,
    device_protection,
    tech_support,
    streaming_tv,
    streaming_movies,

    paperless_billing,
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

FROM customer_scoring;