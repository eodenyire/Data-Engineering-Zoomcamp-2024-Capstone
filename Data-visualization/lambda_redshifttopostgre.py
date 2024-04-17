import boto3
import psycopg2
import csv
import os


"""
This approach allows you to periodically export data from Redshift to S3 and then automatically load it into your PostgreSQL database, ensuring that both databases stay synchronized. Adjustments may be necessary based on your specific data volume, frequency, and performance requirements.
"""
def lambda_handler(event, context):
    s3 = boto3.client('s3')
    pg_host = 'your_postgres_host'
    pg_user = 'your_postgres_user'
    pg_password = 'your_postgres_password'
    pg_dbname = 'your_postgres_dbname'

    # Connect to PostgreSQL
    conn = psycopg2.connect(
        host=pg_host,
        user=pg_user,
        password=pg_password,
        dbname=pg_dbname
    )
    cursor = conn.cursor()

    # Iterate over S3 event records
    for record in event['Records']:
        bucket_name = record['s3']['bucket']['name']
        object_key = record['s3']['object']['key']
        s3_object = s3.get_object(Bucket=bucket_name, Key=object_key)
        
        # Read CSV data from S3 object
        data = s3_object['Body'].read().decode('utf-8').splitlines()
        reader = csv.reader(data)
        next(reader)  # Skip header row

        # Insert data into PostgreSQL table
        for row in reader:
            cursor.execute("""
                INSERT INTO your_postgres_table (column1, column2, ...)
                VALUES (%s, %s, ...)
            """, row)
    
    # Commit and close connection
    conn.commit()
    conn.close()

