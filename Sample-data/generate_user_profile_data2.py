# Sample data
users_data = {
    'user_id': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010],
    'age': [30, 25, 35, 40, 22, 28, 50, 33, 45, 29],
    'gender': ['Male', 'Female', 'Male', 'Female', 'Male', 'Male', 'Female', 'Male', 'Female', 'Male'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu', 'Eldoret', 'Nakuru', 'Thika', 'Nyeri', 'Kakamega', 'Malindi', 'Lamu']
}

# Create DataFrame
df_users = pd.DataFrame(users_data)

# Save as parquet file
df_users.to_parquet('user_profile_data.parquet', index=False)

