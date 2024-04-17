Redshift Database Tables
The table schema for Redshift will be the same as PostgreSQL. However, the specific data types may need adjustment based on Redshift's supported data types.

We'll use the same SQL scripts provided above for creating tables in Redshift. However, keep in mind that Redshift supports a subset of PostgreSQL data types, so some adjustments may be needed.


-- Merchant Data
CREATE TABLE IF NOT EXISTS merchant_data (
    merchant_id INT,
    name VARCHAR(255),
    location VARCHAR(255),
    category VARCHAR(255),
    transaction_volume DECIMAL
);

-- Currency Exchange Rates
CREATE TABLE IF NOT EXISTS currency_exchange_rates (
    currency VARCHAR(3),
    rate DECIMAL
);

-- User Profile Data
CREATE TABLE IF NOT EXISTS user_profile_data (
    user_id INT,
    age INT,
    gender VARCHAR(10),
    location VARCHAR(255),
    income_level DECIMAL
);

-- Transaction Metadata
CREATE TABLE IF NOT EXISTS transaction_metadata_data (
    transaction_id INT,
    timestamp TIMESTAMP,
    amount DECIMAL,
    status VARCHAR(20)
);

-- Device and Location Data
CREATE TABLE IF NOT EXISTS device_and_location_data (
    device_id INT,
    device_type VARCHAR(50),
    location VARCHAR(255)
);

-- Fraud Indicators
CREATE TABLE IF NOT EXISTS fraud_indicators (
    transaction_id INT,
    flag BOOLEAN,
    reason VARCHAR(255)
);

-- Customer Support Interactions
CREATE TABLE IF NOT EXISTS customer_support_interactions (
    interaction_id INT,
    user_id INT,
    timestamp TIMESTAMP,
    action VARCHAR(255)
);

-- Promotions and Offers
CREATE TABLE IF NOT EXISTS promotions_and_offers (
    promotion_id INT,
    name VARCHAR(255),
    start_date DATE,
    end_date DATE,
    discount_percentage DECIMAL
);

