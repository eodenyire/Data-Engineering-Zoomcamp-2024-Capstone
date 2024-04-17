-- models/merchant_data.sql

-- Transforming merchant data
WITH cleaned_data AS (
    SELECT
        merchant_id,
        LOWER(merchant_name) AS merchant_name,
        COALESCE(merchant_location, 'Unknown') AS merchant_location,
        LOWER(merchant_category) AS merchant_category,
        COALESCE(transaction_volume, 0) AS transaction_volume
    FROM
        {{ ref('merchant_data_parquet') }}
)

-- Outputting cleaned merchant data
SELECT
    *
FROM
    cleaned_data;

