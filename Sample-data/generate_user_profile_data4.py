# Sample data for User Profile Data
user_profile_data = {
    'user_id': [1001, 1002, 1003, 1004, 1005, 1006, 1007, 1008, 1009, 1010],
    'age': [30, 25, 35, 40, 22, 28, 50, 33, 45, 29],
    'gender': ['Male', 'Female', 'Male', 'Female', 'Male', 'Male', 'Female', 'Male', 'Female', 'Male'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu', 'Eldoret', 'Nakuru', 'Thika', 'Nyeri', 'Kakamega', 'Malindi', 'Lamu'],
    'income_level': ['High', 'Medium', 'High', 'Low', 'Medium', 'Medium', 'Low', 'High', 'Low', 'Medium']
}

# Create DataFrame
df_user_profile_data = pd.DataFrame(user_profile_data)

# Save as parquet file
df_user_profile_data.to_parquet('user_profile_data.parquet', index=False)

