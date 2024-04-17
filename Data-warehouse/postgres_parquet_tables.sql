These tables will allow you to store the data from the source files in PostgreSQL, making it easier to query and analyze the data as needed. Let me know if you need further assistance or if there's anything else I can help you with!


 Let's create tables in PostgreSQL to store the data from the source files that were pulled by the DAG. Below are the tables corresponding to each source file:

merchant_data Table:
sql
Copy code
CREATE TABLE merchant_data (
    merchant_id VARCHAR(50),
    merchant_name VARCHAR(100),
    location VARCHAR(100),
    category VARCHAR(50),
    transaction_volume NUMERIC(15, 2)
);
currency_exchange_rates Table:
sql
Copy code
CREATE TABLE currency_exchange_rates (
    currency_from VARCHAR(10),
    currency_to VARCHAR(10),
    exchange_rate NUMERIC(15, 6),
    last_updated TIMESTAMP
);
user_profile_data Table:
sql
Copy code
CREATE TABLE user_profile_data (
    user_id VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    location VARCHAR(100),
    income_level NUMERIC(15, 2)
);
transaction_metadata_data Table:
sql
Copy code
CREATE TABLE transaction_metadata_data (
    transaction_id VARCHAR(50),
    timestamp TIMESTAMP,
    transaction_type VARCHAR(20),
    status VARCHAR(20)
);
device_and_location_data Table:
sql
Copy code
CREATE TABLE device_and_location_data (
    device_id VARCHAR(50),
    location VARCHAR(100)
);
fraud_indicators Table:
sql
Copy code
CREATE TABLE fraud_indicators (
    transaction_id VARCHAR(50),
    fraud_indicator VARCHAR(50)
);
customer_support_interactions Table:
sql
Copy code
CREATE TABLE customer_support_interactions (
    interaction_id VARCHAR(50),
    timestamp TIMESTAMP,
    interaction_type VARCHAR(50)
);
