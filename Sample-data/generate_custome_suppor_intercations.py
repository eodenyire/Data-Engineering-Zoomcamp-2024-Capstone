# Sample data
support_interactions = {
    'interaction_id': [101, 102, 103],
    'user_id': [1001, 1002, 1003],
    'timestamp': ['2024-04-16 10:30:00', '2024-04-16 11:30:00', '2024-04-16 12:30:00'],
    'action': ['Inquiry', 'Complaint', 'Feedback']
}

# Create DataFrame
df_support_interactions = pd.DataFrame(support_interactions)

# Save as parquet file
df_support_interactions.to_parquet('customer_support_interactions.parquet', index=False)

