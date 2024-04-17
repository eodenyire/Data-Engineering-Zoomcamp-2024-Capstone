#!/bin/bash

# Connection details for PostgresSQL
PG_HOST="your_postgres_host"
PG_PORT="5432"
PG_DATABASE="your_database_name"
PG_USER="your_database_user"
PG_PASSWORD="your_database_password"

# Processed data directory
DATA_DIR="/path/to/processed/data"

# Loop through each parquet file and write to PostgresSQL
for file in $DATA_DIR/*.parquet; do
    table_name=$(basename "$file" .parquet)
    echo "Loading data from $file to table $table_name in PostgresSQL..."
    psql -h $PG_HOST -p $PG_PORT -U $PG_USER -d $PG_DATABASE -c "\copy $table_name from '$file' DELIMITER ',' CSV HEADER;"
    if [ $? -eq 0 ]; then
        echo "Data loaded successfully to table $table_name."
    else
        echo "Error: Failed to load data to table $table_name."
    fi
done

