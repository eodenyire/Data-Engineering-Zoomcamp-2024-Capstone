# Data Warehouse: Redshift and PostgreSQL

## Overview
This directory contains the implementation details for the data warehousing components of the M-Pesa Global Virtual Visa Card Analytics Platform. The primary focus is on setting up and managing data storage solutions using Amazon Redshift and PostgreSQL.

## Tables and Schema

### PostgreSQL
- **Merchant Data**
  - Columns: merchant_id, name, location, category, transaction_volume
- **Currency Exchange Rates**
  - Columns: currency, rate
- **User Profile Data**
  - Columns: user_id, age, gender, location, income_level
- **Transaction Metadata**
  - Columns: transaction_id, timestamp, amount, status
- **Device and Location Data**
  - Columns: device_id, device_type, location
- **Fraud Indicators**
  - Columns: transaction_id, flag, reason
- **Customer Support Interactions**
  - Columns: interaction_id, user_id, timestamp, action
- **Promotions and Offers**
  - Columns: promotion_id, name, start_date, end_date, discount_percentage

### Redshift
The tables in Redshift have the same schema as PostgreSQL, but the data is stored in Redshift instead.

## Setup Instructions
- For PostgreSQL, follow the instructions provided in the `postgres-setup.md` file in this directory.
- For Redshift, refer to the `redshift-setup.md` file for setup instructions.

## Note
The data in these tables is synthetic and generated for the purpose of learning and demonstration. It does not represent real-world transactions or entities associated with the M-Pesa Global Virtual Visa Card service.

