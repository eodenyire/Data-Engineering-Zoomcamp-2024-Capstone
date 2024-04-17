-- models/customer_support_interactions.sql

-- Transforming customer support interactions data
WITH cleaned_data AS (
    SELECT
        interaction_id,
        LOWER(customer_name) AS customer_name,
        interaction_type,
        interaction_timestamp,
        LOWER(interaction_details) AS interaction_details
    FROM
        {{ ref('customer_support_interactions_parquet') }}
)

-- Outputting cleaned customer support interactions data
SELECT
    *
FROM
    cleaned_data;

