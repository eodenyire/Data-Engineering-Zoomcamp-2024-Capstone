import psycopg2
import pandas as pd
#Python Script for dbt Model Data Extraction and CSV Generation:

# Database connection parameters
db_params = {
    'host': 'your_redshift_host',
    'port': 'your_redshift_port',
    'database': 'your_redshift_database',
    'user': 'your_redshift_user',
    'password': 'your_redshift_password'
}

# SQL query to extract data from dbt models
sql_query = """
SELECT * FROM your_dbt_model;
"""

# Connect to Redshift
conn = psycopg2.connect(**db_params)

# Execute SQL query and fetch data
df = pd.read_sql_query(sql_query, conn)

# Define file path for CSV report
csv_file_path = 'your_file_path/dbt_model_report.csv'

# Write data to CSV file
df.to_csv(csv_file_path, index=False)

# Close database connection
conn.close()

print("CSV report generated successfully.")

