# Sample data
transactions = {
    'transaction_id': [1, 2, 3],
    'timestamp': ['2024-04-16 10:00:00', '2024-04-16 11:00:00', '2024-04-16 12:00:00'],
    'amount': [100, 50, 200],
    'status': ['Completed', 'Completed', 'Failed']
}

# Create DataFrame
df_transactions = pd.DataFrame(transactions)

# Save as parquet file
df_transactions.to_parquet('transaction_metadata.parquet', index=False)

