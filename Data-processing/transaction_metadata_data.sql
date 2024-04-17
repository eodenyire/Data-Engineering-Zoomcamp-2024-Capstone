-- models/transaction_metadata_data.sql

-- Transforming transaction metadata
WITH cleaned_data AS (
    SELECT
        transaction_id,
        date,
        transaction_type,
        status,
        COALESCE(amount, 0) AS amount
    FROM
        {{ ref('transaction_metadata_data_parquet') }}
)

-- Outputting cleaned transaction metadata
SELECT
    *
FROM
    cleaned_data;

