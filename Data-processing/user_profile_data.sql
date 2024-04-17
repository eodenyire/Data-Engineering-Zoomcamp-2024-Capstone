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

