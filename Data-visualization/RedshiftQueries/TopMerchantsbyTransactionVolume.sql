"""
These queries provide insights into various aspects of your data, such as transaction trends, user demographics, fraud detection, and more. You can further customize and expand these queries based on your specific business needs and data characteristics. Let me know if you need additional queries or assistance with any specific analytical tasks!
"""


#Top Merchants by Transaction Volume:

SELECT merchant_id, merchant_name, SUM(transaction_amount) AS total_transaction_volume
FROM transaction_metadata_data
GROUP BY merchant_id, merchant_name
ORDER BY total_transaction_volume DESC
LIMIT 10;


#Card Usage Trends:

SELECT DATE_TRUNC('day', transaction_date) AS transaction_day,
       COUNT(DISTINCT card_id) AS unique_cards_used
FROM transaction_metadata_data
GROUP BY transaction_day
ORDER BY transaction_day;

#Customer Segmentation for Promotion Targeting:

SELECT user_id,
       CASE
           WHEN total_transaction_amount >= 1000 THEN 'High Value'
           WHEN total_transaction_amount >= 500 AND total_transaction_amount < 1000 THEN 'Medium Value'
           ELSE 'Low Value'
       END AS customer_segment
FROM (
    SELECT user_id, SUM(transaction_amount) AS total_transaction_amount
    FROM transaction_metadata_data
    GROUP BY user_id
) AS user_transactions;

#Popular Transaction Categories:

SELECT transaction_category, COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY transaction_category
ORDER BY transaction_count DESC
LIMIT 10;


#Peak Transaction Hours:

SELECT EXTRACT(HOUR FROM transaction_time) AS hour_of_day,
       COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY hour_of_day
ORDER BY hour_of_day;


#Top Locations by Transaction Amount:

SELECT location_id, location_name, SUM(transaction_amount) AS total_transaction_amount
FROM transaction_metadata_data
GROUP BY location_id, location_name
ORDER BY total_transaction_amount DESC
LIMIT 10;


#Wallet Usage Insights:

SELECT wallet_type,
       AVG(wallet_balance) AS average_wallet_balance,
       MAX(wallet_balance) AS max_wallet_balance
FROM user_profile_data
GROUP BY wallet_type;


#Transaction Trends Over Time:

SELECT DATE_TRUNC('month', transaction_date) AS transaction_month,
       COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY transaction_month
ORDER BY transaction_month;


#Average Transaction Amount by User Age Group:

SELECT CASE
           WHEN user_age < 18 THEN 'Under 18'
           WHEN user_age >= 18 AND user_age < 35 THEN '18-34'
           WHEN user_age >= 35 AND user_age < 50 THEN '35-49'
           WHEN user_age >= 50 THEN '50+'
       END AS age_group,
       AVG(transaction_amount) AS avg_transaction_amount
FROM user_profile_data
JOIN transaction_metadata_data ON user_profile_data.user_id = transaction_metadata_data.user_id
GROUP BY age_group;

#Transaction Frequency by Day of Week:

SELECT EXTRACT(DOW FROM transaction_date) AS day_of_week,
       COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY day_of_week
ORDER BY day_of_week;


#Top Fraud Indicators:

SELECT fraud_indicator, COUNT(*) AS fraud_count
FROM fraud_indicators
GROUP BY fraud_indicator
ORDER BY fraud_count DESC
LIMIT 5;


#Customer Support Interaction Analysis:

SELECT interaction_type, COUNT(*) AS interaction_count
FROM customer_support_interactions
GROUP BY interaction_type
ORDER BY interaction_count DESC;


#Cross-Border Transaction Analysis:

SELECT CASE
          WHEN origin_country != destination_country THEN 'Cross-Border'
          ELSE 'Domestic'
      END AS transaction_type,
      COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY transaction_type;


#Average Transaction Amount by Merchant Category:

SELECT merchant_category, AVG(transaction_amount) AS avg_transaction_amount
FROM transaction_metadata_data
GROUP BY merchant_category
ORDER BY avg_transaction_amount DESC
LIMIT 10;

