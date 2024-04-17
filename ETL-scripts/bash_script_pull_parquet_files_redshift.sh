#!/bin/bash
""" 
This script uses the scp command to securely copy (pull) all parquet files
from the specified directory on the EC2 source to the local directory on the EC2 server.
"""

# Connection details for the EC2 source
EC2_USERNAME="GlobalVISA"
EC2_HOST="102.98.31.5"
EC2_PORT="22"
EC2_PASSWORD="gLOBAlSouth20203"

# Directory where parquet files are stored on the EC2 source
EC2_PARQUET_DIR="~/MpesaGlobal/PartnerDumps"

# Directory where parquet files will be stored locally on the EC2 server
LOCAL_PARQUET_DIR="/path/to/local/parquet/directory"

# Pull parquet files from EC2 source to local directory
echo "Pulling parquet files from EC2 source..."
scp -P $EC2_PORT $EC2_USERNAME@$EC2_HOST:$EC2_PARQUET_DIR/*.parquet $LOCAL_PARQUET_DIR

echo "Parquet files pulled successfully!"

