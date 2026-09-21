# Telecom Customer Churn Analysis

An end-to-end customer churn analysis project using PostgreSQL, SQL and Power BI to identify churn drivers, segment customers by risk and assess the financial impact of customer churn.

## Business Problem

Customer churn can reduce recurring revenue and make it difficult for a business to understand which customers are most likely to leave.

This project analyses telecom customer data to answer questions such as:

- What is the overall customer churn rate?
- Which contract types have the highest churn?
- How does customer tenure relate to churn?
- Which internet services and payment methods are associated with higher churn?
- Which customers fall into higher-risk segments?
- How much monthly revenue is associated with customers who have churned?

## Tools & Technologies

- Python
- Jupyter Notebook
- Pandas
- PostgreSQL
- SQL
- Power BI
- DAX
- Data modelling
- Customer segmentation
- Data analysis and visualisation

## Project Workflow

CSV Dataset
     ↓
Jupyter Notebook
     ↓
Data Cleaning & Preparation
     ↓
PostgreSQL
     ↓
SQL Analysis
     ↓
Customer Risk Scoring
     ↓
BI-Ready SQL View
     ↓
Power BI Dashboard

The SQL analysis covers:

Executive KPI calculations
Churn by contract type
Churn by tenure
Churn by internet service
Churn by payment method
Contract and payment method analysis
Contract and tenure analysis
Revenue associated with churn
Revenue associated with churn by service
High-value customer churn
Customer risk segmentation
Customer risk scoring
Creation of the BI-ready view
Key Findings
Overall Churn
Total customers: 7,043
Churned customers: 1,869
Overall churn rate: 26.54%
Retention rate: 73.46%
Average monthly charge: £64.76
Total monthly charges: £456,116.60
Contract Type

Month-to-month customers had a churn rate of 42.71%, compared with:

One-year contracts: 11.27%
Two-year contracts: 2.83%
Tenure

Customers with shorter tenure showed higher churn rates:

0–12 months: 47.44%
13–24 months: 28.71%
25–48 months: 20.39%
49+ months: 9.51%
Internet Service

Churn rates by internet service were:

Fiber optic: 41.89%
DSL: 18.96%
No internet service: 7.40%
Payment Method

Electronic check customers had a churn rate of 45.29%, compared with:

Mailed check: 19.11%
Bank transfer: 16.71%
Credit card: 15.24%
Customer Risk Scoring

A customer risk score was developed using several observable characteristics:

Risk Factor	         Points
Month-to-month contract    +2
Tenure ≤ 12 months	   +2
Electronic check	   +1
Fiber optic service	   +1
Monthly charges ≥ £70	   +1

Risk segments were then created:

Score	Risk Segment
0–2	Lower Risk
3–4	Medium Risk
5–7	High Risk

The analysis showed a strong relationship between the calculated risk score and observed churn. Customers with a score of 0 had a 2.27% churn rate, while customers with a score of 7 had a 70.73% churn rate.

Revenue Impact

The analysis identified the monthly charges associated with customers who had churned.

By contract:

Month-to-month: £120,847.10
One year: £14,118.45
Two year: £4,165.30

By internet service:

Fiber optic: £114,300.05
DSL: £22,529.20
No internet service: £2,301.60

These figures represent monthly charges associated with customers who churned. They should not be interpreted as confirmed historical revenue losses because the dataset does not contain a month-by-month revenue timeline.

Power BI Dashboard

The Power BI dashboard contains four pages.

1. Executive Overview

Provides a high-level view of:

Total customers
Churn rate
Retention rate
Monthly revenue
Average monthly charge
Churn by contract
Churn by tenure
Churn by internet service
Monthly revenue by internet service
2. Churn Drivers

Examines factors associated with customer churn, including:

Contract type
Payment method
Tenure
Internet service
Contract and payment method combinations
3. Customer Risk

Provides:

Churn rate by risk segment
Customer counts by risk segment
Churn rate by risk score
Customer-level risk information
Interactive filtering by contract and internet service
4. Revenue & Retention

Focuses on the financial impact of churn, including:

Average monthly charge for churned customers
Average monthly charge for retained customers
Monthly charges associated with churn
Churn-associated monthly charges by contract
Churn-associated monthly charges by internet service
Churned versus retained customers by contract

Skills Demonstrated
SQL data analysis
PostgreSQL
Data cleaning
Data validation
Customer churn analysis
Customer segmentation
Risk scoring
Revenue impact analysis
DAX
Power BI
Data modelling
KPI development
Dashboard design
Business-focused data storytelling
