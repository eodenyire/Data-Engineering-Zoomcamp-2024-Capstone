import pandas as pd

# Sample data for Merchant Data
merchant_data = {
    'merchant_id': ['M001', 'M002', 'M003', 'M004', 'M005', 'M006', 'M007', 'M008', 'M009', 'M010'],
    'name': ['Supermarket A', 'Clothing Store B', 'Electronics Shop C', 'Hardware Store D', 'Bookstore E', 
             'Restaurant F', 'Pharmacy G', 'Jewelry Store H', 'Furniture Store I', 'Sports Shop J'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu', 'Eldoret', 'Nakuru', 'Thika', 'Nyeri', 'Kakamega', 'Malindi', 'Lamu'],
    'category': ['Retail', 'Retail', 'Retail', 'Retail', 'Retail', 'Food', 'Health', 'Retail', 'Retail', 'Retail'],
    'transaction_volume': [1000, 500, 800, 300, 200, 100, 400, 600, 700, 900]
}

# Create DataFrame
df_merchant_data = pd.DataFrame(merchant_data)

# Save as parquet file
df_merchant_data.to_parquet('merchant_data.parquet', index=False)

