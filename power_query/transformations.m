// SignalSense — Power Query Transformation Steps
// Documented M code showing the transformation pipeline applied to the
// raw telecom churn dataset before loading into the data model.

let
    Source = Csv.Document(File.Contents("telecom_churn_sample.csv"),
        [Delimiter=",", Columns=12, Encoding=65001, QuoteStyle=QuoteStyle.None]),
    PromotedHeaders = Table.PromoteHeaders(Source, [PromoteAllScalars=true]),

    // Step 1: Set correct data types for each column
    ChangedTypes = Table.TransformColumnTypes(PromotedHeaders, {
        {"customer_id", Int64.Type},
        {"gender", type text},
        {"senior_citizen", Int64.Type},
        {"tenure_months", Int64.Type},
        {"contract_type", type text},
        {"monthly_charges", type number},
        {"total_charges", type number},
        {"internet_service", type text},
        {"tech_support", type text},
        {"online_security", type text},
        {"payment_method", type text},
        {"churn", type text}
    }),

    // Step 2: Remove rows with blank/null total_charges (common data quality issue
    // in this dataset — occurs for customers with 0 tenure)
    RemovedBlankCharges = Table.SelectRows(ChangedTypes, each [total_charges] <> null),

    // Step 3: Create a Churn Flag as a number for easier aggregation in DAX
    AddedChurnFlag = Table.AddColumn(RemovedBlankCharges, "churn_flag",
        each if [churn] = "Yes" then 1 else 0, Int64.Type),

    // Step 4: Bucket tenure into cohorts for segment-level analysis
    AddedTenureCohort = Table.AddColumn(AddedChurnFlag, "tenure_cohort",
        each if [tenure_months] <= 6 then "0-6 months"
        else if [tenure_months] <= 12 then "7-12 months"
        else if [tenure_months] <= 24 then "13-24 months"
        else if [tenure_months] <= 48 then "25-48 months"
        else "49+ months", type text),

    // Step 5: Bucket monthly charges into pricing tiers
    AddedChargeTier = Table.AddColumn(AddedTenureCohort, "charge_tier",
        each if [monthly_charges] < 35 then "Low ($0-35)"
        else if [monthly_charges] < 70 then "Medium ($35-70)"
        else if [monthly_charges] < 100 then "High ($70-100)"
        else "Premium ($100+)", type text),

    // Step 6: Standardize text casing for consistent grouping/filtering
    CleanedText = Table.TransformColumns(AddedChargeTier, {
        {"contract_type", Text.Trim, type text},
        {"internet_service", Text.Trim, type text},
        {"payment_method", Text.Trim, type text}
    }),

    // Step 7: Remove exact duplicate customer records
    RemovedDuplicates = Table.Distinct(CleanedText, {"customer_id"})

in
    RemovedDuplicates
