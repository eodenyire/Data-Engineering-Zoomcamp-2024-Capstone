from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from datetime import datetime, timedelta
import your_redshift_query_script

#Airflow DAG for Redshift Query Data Extraction:
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
    'redshift_query_report_generation',
    default_args=default_args,
    description='A DAG to generate CSV reports from Redshift queries',
    schedule_interval='@daily',  # Run daily
)

# Define the task to generate CSV report from Redshift queries
generate_report_task = PythonOperator(
    task_id='generate_redshift_query_report',
    python_callable=your_redshift_query_script.generate_csv_report,
    dag=dag,
)

# Set task dependencies
generate_report_task


