# Sample data
exchange_rates = {
    'currency': ['USD', 'EUR', 'GBP'],
    'rate': [1.0, 0.85, 0.72]
}

# Create DataFrame
df_exchange_rates = pd.DataFrame(exchange_rates)

# Save as parquet file
df_exchange_rates.to_parquet('exchange_rates.parquet', index=False)

