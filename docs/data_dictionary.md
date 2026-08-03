# Data Dictionary — SignalSense

| Column | Type | Description |
|---|---|---|
| customer_id | Integer | Unique identifier for each customer |
| gender | Text | Customer's gender (Male/Female) |
| senior_citizen | Integer (0/1) | Whether the customer is a senior citizen |
| tenure_months | Integer | How many months the customer has been with the company |
| contract_type | Text | Month-to-month, One year, or Two year |
| monthly_charges | Decimal | Current monthly billing amount ($) |
| total_charges | Decimal | Cumulative amount billed to date ($) |
| internet_service | Text | DSL, Fiber optic, or No internet service |
| tech_support | Text | Whether the customer has tech support add-on (Yes/No) |
| online_security | Text | Whether the customer has online security add-on (Yes/No) |
| payment_method | Text | Electronic check, Mailed check, Bank transfer, Credit card |
| churn | Text | Whether the customer has churned (Yes/No) — target variable |

## Derived Columns (added in Power Query)
| Column | Description |
|---|---|
| churn_flag | Numeric version of churn (1/0) for aggregation in DAX |
| tenure_cohort | Tenure bucketed into 5 groups for segment analysis |
| charge_tier | Monthly charges bucketed into 4 pricing tiers |

## Known Data Quality Issues Handled
- A small number of records have blank `total_charges` — these correspond
  to customers with 0 months tenure (haven't been billed yet) and are
  excluded to avoid skewing revenue calculations
- Text fields occasionally have leading/trailing whitespace, trimmed
  during transformation
