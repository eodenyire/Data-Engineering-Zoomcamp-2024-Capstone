-- models/fraud_indicators.sql

-- Transforming fraud indicators data
WITH cleaned_data AS (
    SELECT
        transaction_id,
        LOWER(fraud_indicator_type) AS fraud_indicator_type,
        COALESCE(fraud_score, 0) AS fraud_score
    FROM
        {{ ref('fraud_indicators_parquet') }}
)

-- Outputting cleaned fraud indicators data
SELECT
    *
FROM
    cleaned_data;

