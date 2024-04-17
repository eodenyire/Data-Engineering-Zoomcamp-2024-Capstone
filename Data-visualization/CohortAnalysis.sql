Cohort Analysis:


-- User retention cohort analysis
WITH user_cohort AS (
    SELECT user_id, DATE(MIN(timestamp)) AS signup_date
    FROM user_profile_data
    GROUP BY user_id
)
SELECT EXTRACT(MONTH FROM TIMESTAMP 'epoch' + EXTRACT(EPOCH FROM signup_date) * INTERVAL '1 second') AS signup_month,
       EXTRACT(YEAR FROM signup_date) AS signup_year,
       COUNT(DISTINCT user_id) AS cohort_size,
       COUNT(DISTINCT CASE WHEN EXTRACT(MONTH FROM timestamp) = EXTRACT(MONTH FROM signup_date) THEN user_id END) AS retained_users
FROM user_cohort
LEFT JOIN transaction_metadata_data ON user_cohort.user_id = transaction_metadata_data.user_id
GROUP BY signup_month, signup_year
ORDER BY signup_year, signup_month;

