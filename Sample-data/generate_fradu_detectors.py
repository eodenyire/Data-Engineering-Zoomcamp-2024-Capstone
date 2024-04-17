# Sample data
fraud_indicators = {
    'transaction_id': [1, 3],
    'flag': [True, True],
    'reason': ['Suspicious activity', 'Unusual transaction amount']
}

# Create DataFrame
df_fraud_indicators = pd.DataFrame(fraud_indicators)

# Save as parquet file
df_fraud_indicators.to_parquet('fraud_indicators.parquet', index=False)

