import pandas as pd

# Sample data
merchants = {
    'merchant_id': ['M001', 'M002', 'M003'],
    'name': ['Supermarket A', 'Clothing Store B', 'Electronics Shop C'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu'],
    'category': ['Retail', 'Retail', 'Retail']
}

# Create DataFrame
df_merchants = pd.DataFrame(merchants)

# Save as parquet file
df_merchants.to_parquet('merchant_data.parquet', index=False)

