import pandas as pd

# Sample data
merchants_data = {
    'merchant_id': ['M001', 'M002', 'M003', 'M004', 'M005', 'M006', 'M007', 'M008', 'M009', 'M010'],
    'name': ['Supermarket A', 'Clothing Store B', 'Electronics Shop C', 'Hardware Store D', 'Bookstore E', 
             'Restaurant F', 'Pharmacy G', 'Jewelry Store H', 'Furniture Store I', 'Sports Shop J'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu', 'Eldoret', 'Nakuru', 'Thika', 'Nyeri', 'Kakamega', 'Malindi', 'Lamu'],
    'category': ['Retail', 'Retail', 'Retail', 'Retail', 'Retail', 'Food', 'Health', 'Retail', 'Retail', 'Retail']
}

# Create DataFrame
df_merchants = pd.DataFrame(merchants_data)

# Save as parquet file
df_merchants.to_parquet('merchant_data.parquet', index=False)

# Display first 10 rows
print(df_merchants.head(10))

