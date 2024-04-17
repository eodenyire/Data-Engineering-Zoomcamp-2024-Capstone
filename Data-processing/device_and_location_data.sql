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

