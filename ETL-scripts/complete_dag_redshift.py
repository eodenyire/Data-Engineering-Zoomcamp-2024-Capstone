from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from datetime import datetime, timedelta

# Define default arguments
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 4, 1),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Define DAG
dag = DAG(
    'parquet_to_redshift',
    default_args=default_args,
    description='A DAG to pull, process, and write parquet files to AWS Redshift',
    schedule_interval='@daily',
)

# Define tasks
pull_parquet_files = BashOperator(
    task_id='pull_parquet_files',
    bash_command='your_script_to_pull_parquet_files.sh',
    dag=dag,
)

process_parquet_files = BashOperator(
    task_id='process_parquet_files',
    bash_command='your_script_to_process_parquet_files.sh',
    dag=dag,
)

write_to_redshift = BashOperator(
    task_id='write_to_redshift',
    bash_command='your_script_to_write_to_redshift.sh',
    dag=dag,
)

# Define task dependencies
pull_parquet_files >> process_parquet_files >> write_to_redshift

