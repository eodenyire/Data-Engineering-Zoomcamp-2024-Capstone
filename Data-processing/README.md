# Data Processing

This directory contains Airflow DAGs for processing data as part of the overall data engineering pipeline. The DAGs are responsible for tasks such as pulling Parquet files from an EC2 server, pushing data to Redshift and PostgreSQL databases, and pushing data to Kafka topics.

## Overview

The DAGs in this directory are designed to handle various data processing tasks efficiently and reliably. Below is a high-level overview of how the DAGs are structured and what tasks they perform:

### Pulling Parquet Files from EC2 Server

- **DAG Name:** `pull_parquet_files_from_ec2`
- **Description:** This DAG runs at scheduled intervals to pull Parquet files from an EC2 server and move them to a local directory accessible by Airflow.
- **Tasks:**
  - Establish an SSH connection to the EC2 server using an SSHHook.
  - Execute commands on the server to move Parquet files to a local directory using an SSHOperator.

### Pushing Data to Redshift

- **DAG Name:** `push_data_to_redshift`
- **Description:** This DAG loads data from Parquet files into Redshift tables.
- **Tasks:**
  - Copy data from Parquet files into Redshift tables using the PostgresHook or RedshiftHook.

### Pushing Data to PostgreSQL

- **DAG Name:** `push_data_to_postgresql`
- **Description:** This DAG loads data from Parquet files into PostgreSQL tables.
- **Tasks:**
  - Copy data from Parquet files into PostgreSQL tables using the PostgresHook.

### Pushing Data to Kafka Topics

- **DAG Name:** `push_data_to_kafka_topics`
- **Description:** This DAG pushes data from Parquet files into Kafka topics.
- **Tasks:**
  - Produce messages to Kafka topics based on data in Parquet files using the KafkaProducerHook.

Each DAG consists of multiple tasks, each handling a specific step in the data pipeline process. DAGs are scheduled to run at appropriate intervals based on data ingestion requirements.

## Usage

To use the DAGs in this directory, ensure that Airflow is correctly configured and the necessary plugins (e.g., SSH, PostgreSQL, Redshift, Kafka) are installed. Place the DAG definition files in the appropriate Airflow DAGs directory, and Airflow will automatically detect and execute them according to the defined schedule.

For more information on configuring and managing Airflow DAGs, refer to the Airflow documentation.


