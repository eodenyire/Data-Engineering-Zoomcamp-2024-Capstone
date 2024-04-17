from datetime import datetime, timedelta
from airflow import DAG
from airflow.operators.bash_operator import BashOperator
from airflow.operators.python_operator import PythonOperator

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 4, 16),
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 3,
    'retry_delay': timedelta(minutes=5),
}

dag = DAG(
    'etl_to_redshift',
    default_args=default_args,
    description='ETL process to pull Parquet files from EC2 and write to Redshift',
    schedule_interval='@daily',
)

def process_parquet_files():
    # Your PySpark processing logic here
    pass

def write_to_redshift():
    # Write processed data to Redshift
    pass

pull_parquet_files = BashOperator(
    task_id='pull_parquet_files',
    bash_command='your_script_to_pull_files.sh',
    dag=dag,
)

process_files = PythonOperator(
    task_id='process_parquet_files',
    python_callable=process_parquet_files,
    dag=dag,
)

write_to_redshift = PythonOperator(
    task_id='write_to_redshift',
    python_callable=write_to_redshift,
    dag=dag,
)

pull_parquet_files >> process_files >> write_to_redshift

