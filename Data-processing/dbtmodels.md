# dbt Models

In this section, we define dbt (data build tool) models for each of the Parquet files mentioned. These models include transformations such as replacing NULL values with zeros and converting all letters to lowercase where necessary.

### merchant_data.sql
```sql
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

#currency_exchange_rates.sql

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

#user_profile_data.sql

-- models/user_profile_data.sql

-- Transforming user profile data
WITH cleaned_data AS (
    SELECT
        user_id,
        LOWER(user_name) AS user_name,
        LOWER(location) AS location,
        COALESCE(age, 0) AS age,
        COALESCE(income_level, 0) AS income_level
    FROM
        {{ ref('user_profile_data_parquet') }}
)

-- Outputting cleaned user profile data
SELECT
    *
FROM
    cleaned_data;

#transaction_metadata_data.sql

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

#device_and_location_data.sql

-- models/device_and_location_data.sql

-- Transforming device and location data
WITH cleaned_data AS (
    SELECT
        device_id,
        LOWER(device_type) AS device_type,
        COALESCE(location, 'Unknown') AS location
    FROM
        {{ ref('device_and_location_data_parquet') }}
)

-- Outputting cleaned device and location data
SELECT
    *
FROM
    cleaned_data;

#fraud_indicators.sql

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


#customer_support_interactions.sql

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


#
