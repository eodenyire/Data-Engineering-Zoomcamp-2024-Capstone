# Sample data
users = {
    'user_id': [1001, 1002, 1003],
    'age': [30, 25, 35],
    'gender': ['Male', 'Female', 'Male'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu']
}

# Create DataFrame
df_users = pd.DataFrame(users)

# Save as parquet file
df_users.to_parquet('user_profile_data.parquet', index=False)

