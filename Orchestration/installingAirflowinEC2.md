# Installing Apache Airflow on EC2 Linux Server

To install Apache Airflow on the EC2 Linux server, you can SSH into the server using the provided connection details and then follow the installation instructions for Airflow. Here's a step-by-step guide:

1. **SSH into the EC2 instance:** Open a terminal on your local machine and use the SSH command to connect to the EC2 instance. Replace `102.98.31.5` with the actual IP address of your EC2 instance.

   ```bash
   ssh GlobalVISA@102.98.31.5 -p 22
You will be prompted to enter the password gLOBAlSouth20203 after executing the command.

Update and upgrade packages: Once logged in, it's a good practice to update the package repository and upgrade installed packages on the server.

bash
Copy code
sudo apt update
sudo apt upgrade -y
Install dependencies: Install dependencies required for Airflow.

bash
Copy code
sudo apt install -y python3-pip python3-venv
sudo apt install -y libssl-dev libffi-dev libpq-dev
Install Airflow: Create a Python virtual environment and install Apache Airflow using pip.

bash
Copy code
python3 -m venv airflow-env
source airflow-env/bin/activate
pip install apache-airflow
Initialize Airflow database: Initialize the Airflow metadata database.

bash
Copy code
airflow db init
Start Airflow Scheduler and Web Server: Start the Airflow scheduler and web server in separate terminal sessions.

In one terminal, start the scheduler:

bash
Copy code
airflow scheduler
In another terminal, start the web server:

bash
Copy code
airflow webserver
Access Airflow Web UI: Open a web browser and navigate to http://102.98.31.5:8080 to access the Airflow web interface. Here, you can configure and manage your DAGs.

Configure Connections and Variables: In the Airflow UI, navigate to Admin > Connections to set up connections for database, AWS, etc. Also, configure variables as needed.

Define and Deploy DAGs: Create Python files for your DAGs and place them in the appropriate directory on the EC2 instance. You can use a text editor or IDE to create and edit DAG files directly on the server.

Test and Monitor DAGs: Once your DAGs are defined and deployed, you can monitor their execution and troubleshoot any issues using the Airflow UI.

By following these steps, you can install Apache Airflow on your EC2 Linux server and use it to orchestrate your ETL processes. Make sure to secure your server and Airflow installation by following best practices for authentication and access control.
