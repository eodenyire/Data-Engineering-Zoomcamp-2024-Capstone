#!/bin/bash

# Connection details for the EC2 servers
SOURCE_IP="102.98.31.5"
SOURCE_USERNAME="GlobalVISA"
SOURCE_PORT="22"
SOURCE_PASSWORD="gLOBAlSouth20203"
SOURCE_DIR="~/MpesaGlobal/PartnerDumps"

DEST_IP="destination_ec2_ip"
DEST_USERNAME="destination_ec2_username"
DEST_PORT="22"
DEST_DIR="/path/to/destination"

# Command to copy files using scp
scp -P $SOURCE_PORT $SOURCE_USERNAME@$SOURCE_IP:$SOURCE_DIR/*.parquet $DEST_USERNAME@$DEST_IP:$DEST_DIR

# Verify if files are copied successfully
if [ $? -eq 0 ]; then
    echo "Files copied successfully."
else
    echo "Error: Failed to copy files."
fi

