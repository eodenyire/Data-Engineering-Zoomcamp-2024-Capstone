-- models/currency_exchange_rates.sql

-- Transforming currency exchange rates
WITH cleaned_data AS (
    SELECT
        currency_code,
        date,
        exchange_rate
    FROM
        {{ ref('currency_exchange_rates_parquet') }}
)

-- Outputting cleaned currency exchange rates
SELECT
    *
FROM
    cleaned_data;

