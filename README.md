# SignalSense — Telecom Churn Insights Dashboard

A Power BI dashboard analyzing churn patterns across 7,000+ telecom
customers, providing segment-level KPI reporting on retention risk and
churn drivers for business stakeholders.

## Tech Stack
- Power BI Desktop
- Power Query (M language) for data transformation
- DAX for behavioral churn indicators and KPIs

## What This Dashboard Answers
- Which customer segments have the highest churn risk?
- What behavioral and account factors correlate most with churn?
- How does churn vary by contract type, tenure, and monthly charges?
- Which retention strategies should be prioritized, and for which cohorts?

## Repository Structure
- `data/` — sample/anonymized dataset schema used to build the model
- `power_query/` — M code documenting all data transformation steps
- `dax/` — all DAX measures used across the dashboard
- `docs/` — data dictionary and a breakdown of each dashboard page
- `screenshots/` — exported dashboard views (since the .pbix binary itself
  isn't practical to diff/review on GitHub, screenshots + this
  documentation serve as the portable record of the finished dashboard)

## How to Rebuild This Dashboard
1. Open Power BI Desktop → Get Data → import `data/telecom_churn_sample.csv`
2. Open Power Query Editor → apply the steps documented in
   `power_query/transformations.m`
3. Load the data, then go to Modeling → New Measure → add each measure
   from `dax/measures.dax`
4. Reference `docs/dashboard_pages.md` for how visuals were laid out and
   which fields power each one

## Key Findings (example — replace with your actual analysis)
- Month-to-month contract customers churn at a significantly higher rate
  than 1- or 2-year contract holders
- Customers with tenure under 6 months represent the highest-risk cohort
- Higher monthly charges combined with low tenure is the strongest
  compound churn indicator identified in this dataset
