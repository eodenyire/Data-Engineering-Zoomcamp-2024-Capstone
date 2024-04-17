#!/bin/bash

# Connection details for the EC2 server
SOURCE_IP="102.98.31.5"
SOURCE_USERNAME="GlobalVISA"
SOURCE_PORT="22"
SOURCE_PASSWORD="gLOBAlSouth20203"
SOURCE_DIR="~/MpesaGlobal/PartnerDumps"

# Destination directory where files will be saved locally
DEST_DIR="/path/to/local/directory"

# Pull parquet files using scp
scp -P $SOURCE_PORT $SOURCE_USERNAME@$SOURCE_IP:$SOURCE_DIR/*.parquet $DEST_DIR

# Verify if files are copied successfully
if [ $? -eq 0 ]; then
    echo "Parquet files copied successfully."
else
    echo "Error: Failed to copy parquet files."
fi

