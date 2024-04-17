# Redshift Database Tables

The table schema for Redshift will mirror the schema used for PostgreSQL tables. However, certain adjustments may be required to accommodate Redshift's supported data types and constraints.

## Table Schema

### Merchant Data
- Columns: merchant_id, name, location, category, transaction_volume

### Currency Exchange Rates
- Columns: currency, rate

### User Profile Data
- Columns: user_id, age, gender, location, income_level

### Transaction Metadata
- Columns: transaction_id, timestamp, amount, status

### Device and Location Data
- Columns: device_id, device_type, location

### Fraud Indicators
- Columns: transaction_id, flag, reason

### Customer Support Interactions
- Columns: interaction_id, user_id, timestamp, action

### Promotions and Offers
- Columns: promotion_id, name, start_date, end_date, discount_percentage

## SQL Scripts
We'll utilize the same SQL scripts provided for PostgreSQL to create the tables in Redshift. However, ensure to review and adjust the data types and constraints to align with Redshift's capabilities.

For creating tables in Redshift, connect to your Redshift cluster using a SQL client tool (e.g., SQL Workbench/J) and execute the SQL scripts accordingly.

Remember to optimize the schema and distribution keys for better performance in a Redshift environment.


You can execute these scripts in your Redshift cluster using a SQL client tool (e.g., SQL Workbench/J) to create the respective tables. Feel free to adjust the data types and constraints as needed for your specific requirements! Let me know if you need further assistance.
