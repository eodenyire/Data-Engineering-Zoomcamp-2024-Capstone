#Merchant Data Table

CREATE TABLE merchant_data (
    merchant_id VARCHAR(50),
    name VARCHAR(100),
    location VARCHAR(100),
    category VARCHAR(50),
    transaction_volume INT
);

#Currency Exchange Rates Table

CREATE TABLE currency_exchange_rates (
    currency VARCHAR(10),
    rate FLOAT
);

#User Profile Data Table


CREATE TABLE user_profile_data (
    user_id VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    location VARCHAR(100),
    income_level VARCHAR(50)
);

#Transaction Metadata Table

CREATE TABLE transaction_metadata_data (
    transaction_id VARCHAR(50),
    timestamp TIMESTAMP,
    amount FLOAT,
    status VARCHAR(20)
);

#Device and Location Data Table

CREATE TABLE device_and_location_data (
    device_id VARCHAR(50),
    device_type VARCHAR(20),
    location VARCHAR(100)
);
#Fraud Indicators Table


CREATE TABLE fraud_indicators (
    transaction_id VARCHAR(50),
    flag BOOLEAN,
    reason VARCHAR(100)
);

#Customer Support Interactions Table


CREATE TABLE customer_support_interactions (
    interaction_id VARCHAR(50),
    user_id VARCHAR(50),
    timestamp TIMESTAMP,
    action VARCHAR(100)
);

#Promotions and Offers Table

CREATE TABLE promotions_and_offers (
    promotion_id VARCHAR(50),
    name VARCHAR(100),
    start_date DATE,
    end_date DATE,
    discount_percentage FLOAT
);
