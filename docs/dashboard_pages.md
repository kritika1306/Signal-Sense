# Dashboard Page Breakdown — SignalSense

## Page 1: Executive Overview
- KPI Cards: Total Customers, Churn Rate %, Retention Rate %, Total Revenue at Risk
- Donut Chart: Churn split by contract type
- Bar Chart: Churn rate by tenure cohort
- Slicer: Contract Type, Payment Method

## Page 2: Segment Deep-Dive
- Matrix: Contract Type × Tenure Cohort, showing Churn Rate %
- Clustered Column: Avg Monthly Charges — Churned vs Retained
- Scatter Chart: Tenure (months) vs Monthly Charges, colored by churn status
- Slicer: Charge Tier

## Page 3: Retention Risk Drivers
- Bar Chart: Churn Rate % by presence/absence of Tech Support
- Bar Chart: Churn Rate % by presence/absence of Online Security
- KPI Card: High Risk Customer Count
- KPI Card: High Risk Churn Rate %
- Table: List of high-risk customers (tenure < 6mo, month-to-month, no tech support)

## Design Notes
- Consistent color coding: red/orange for churned, blue/green for retained,
  used across all pages for quick visual pattern recognition
- All pages share the same Contract Type and Payment Method slicers via
  Power BI's sync slicers feature, so filtering stays consistent across
  the whole report
