Trend Analysis:
sql
Copy code
-- Daily transaction volume trend
SELECT DATE(timestamp) AS date, COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY DATE(timestamp)
ORDER BY date;

-- Weekly user engagement trend
SELECT DATE_TRUNC('week', timestamp) AS week_start_date, COUNT(DISTINCT user_id) AS unique_users
FROM transaction_metadata_data
GROUP BY week_start_date
ORDER BY week_start_date;
