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
    'write_to_kafka',
    default_args=default_args,
    description='A DAG to write processed data from Redshift to Kafka topics',
    schedule_interval='@daily',
)

# Define tasks
write_to_kafka = BashOperator(
    task_id='write_to_kafka',
    bash_command='/path/to/your_script_to_write_to_kafka.sh',
    dag=dag,
)

# Define task dependencies
write_to_kafka

