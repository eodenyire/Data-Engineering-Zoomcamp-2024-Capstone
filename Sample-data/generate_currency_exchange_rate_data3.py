# Sample data
exchange_rates_data = {
    'currency': ['USD', 'EUR', 'GBP', 'JPY', 'AUD', 'CAD', 'CHF', 'CNY', 'SEK', 'NZD'],
    'rate': [1.0, 0.85, 0.72, 110.85, 1.32, 1.25, 0.92, 6.42, 8.47, 1.44]
}

# Create DataFrame
df_exchange_rates = pd.DataFrame(exchange_rates_data)

# Save as parquet file
df_exchange_rates.to_parquet('exchange_rates.parquet', index=False)

# Display first 10 rows
print(df_exchange_rates.head(10))

