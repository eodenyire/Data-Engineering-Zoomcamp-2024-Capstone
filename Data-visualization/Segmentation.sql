Segmentation:

-- Demographic segmentation analysis
SELECT age, gender, COUNT(*) AS transaction_count
FROM user_profile_data
JOIN transaction_metadata_data ON user_profile_data.user_id = transaction_metadata_data.user_id
GROUP BY age, gender
ORDER BY age, gender;

-- Transaction type segmentation analysis
SELECT transaction_type, COUNT(*) AS transaction_count
FROM transaction_metadata_data
GROUP BY transaction_type;


