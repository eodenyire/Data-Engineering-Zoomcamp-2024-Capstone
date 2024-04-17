from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import your_postgresql_to_kafka_script

# Define the default arguments for the DAG
default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': datetime(2024, 4, 1),  # Adjust start date as needed
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

# Define the DAG
dag = DAG(
    'postgresql_to_kafka',
    default_args=default_args,
    description='A DAG to move data from PostgreSQL to Kafka topics',
    schedule_interval='@daily',  # Run daily
)

# Define the task to move data from PostgreSQL to Kafka
move_data_task = PythonOperator(
    task_id='move_postgresql_to_kafka',
    python_callable=your_postgresql_to_kafka_script.move_data_to_kafka,
    dag=dag,
)

# Set task dependencies
move_data_task


