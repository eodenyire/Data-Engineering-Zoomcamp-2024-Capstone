# Sample data
devices = {
    'device_id': [2001, 2002, 2003],
    'device_type': ['Mobile', 'POS Terminal', 'Mobile'],
    'location': ['Nairobi', 'Mombasa', 'Kisumu']
}

# Create DataFrame
df_devices = pd.DataFrame(devices)

# Save as parquet file
df_devices.to_parquet('device_location_data.parquet', index=False)

