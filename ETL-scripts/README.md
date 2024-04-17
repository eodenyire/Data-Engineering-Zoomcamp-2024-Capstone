# ETL Scripts

In this section, we provide examples of DAGs (Directed Acyclic Graphs) for orchestrating ETL (Extract, Transform, Load) processes using Apache Airflow. These DAGs are configured to pull Parquet files from an EC2 server using BashOperator tasks. However, they do not specify the specific Parquet files to pull. Instead, they execute a bash command (your_script_to_pull_files.sh) to pull the files.

To specify which Parquet files to pull, follow these steps:

1. **Update Bash Script:** Modify the your_script_to_pull_files.sh script to use utilities like scp or rsync to copy the desired Parquet files from the EC2 server to a directory on the Airflow server.

2. **Modify DAG Tasks:** Update the BashOperator tasks in each DAG to execute the updated bash script with the appropriate parameters.

Here's a general outline of how to modify the DAGs to pull specific Parquet files:

```python
pull_parquet_files = BashOperator(
    task_id='pull_parquet_files',
    bash_command='your_script_to_pull_files.sh /path/to/source/files/*.parquet /path/to/destination',
    dag=dag,
)

