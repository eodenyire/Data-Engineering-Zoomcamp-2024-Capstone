Predictive Modeling:

-- Example: Linear regression to predict transaction volume
SELECT timestamp, AVG(transaction_volume) OVER (ORDER BY timestamp ROWS BETWEEN 7 PRECEDING AND CURRENT ROW) AS avg_transaction_volume_7_days
FROM merchant_data;

