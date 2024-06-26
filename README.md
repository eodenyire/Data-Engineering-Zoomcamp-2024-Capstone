# Data Engineering Zoomcamp by Data Talks Club
# End-to-End Data Engineering Pipeline

[Data Engineering Zoomcamp](https://github.com/eodenyire/Data-Engineering-Zoomcamp-2024-Capstone/assets/61192633/fd231e1f-ae42-4c7a-b5d2-a38960eb4645)
 ## Introduction
This repository contains the code, documentation, and resources for the end-to-end data!engineering pipeline developed as a capstone project for the Data Engineering Zoomcamp by DataTalks. The project aims to demonstrate proficiency in designing, implementing, and managing data pipelines to support various data processing, analysis, and visualization tasks. Although we were supposed to use public datasets, my manager asked me to try this pipeline so that after the Zoomcamp, I may implement it for the Mpesa GlobalPay Consumer Visa Card.

## Disclaimer

The data used in this project is synthetic and generated solely for educational purposes. It is not related to real-world data or any actual services provided by M-PESA GlobalPay Visa Card or any other organization. Any resemblance to real data is purely coincidental.

## Background
### M-PESA GlobalPay Virtual VISA Card
The M-PESA GlobalPay Virtual VISA Card is a partnership between M-PESA and VISA. It enables users to make payments to international online merchants for goods and services using their M-PESA wallet.

### Data Engineering Zoomcamp by DataTalks
The Data Engineering Zoomcamp by DataTalks is a comprehensive training program designed to provide hands-on experience in data engineering concepts, tools, and techniques.

## Technologies Used
- Apache Airflow
- AWS services (S3, Redshift, EC2, Quicksight)
- PostgreSQL
- Kafka
- Tableau
- Power BI
- Terraform
- Python
- SQL

## Architecture
The data engineering pipeline follows a modular architecture, comprising data ingestion, processing, transformation, analysis, and visualization stages. Apache Airflow is used for workflow orchestration, while Apache NiFi handles data ingestion and processing tasks. AWS services are leveraged for storage, computation, and analytics.

## Implementation Details
- Apache Airflow DAGs: Orchestrates data workflows and task scheduling.
- Python Scripts: Implements data manipulation, transformation, and integration tasks.
- SQL Queries: Executes data analysis and aggregation operations on relational databases.
- Terraform: Deploys and manages infrastructure resources on AWS.

## Testing
Testing methodologies include unit tests, integration tests, and end-to-end tests to ensure the reliability and accuracy of the data pipeline. Automated testing frameworks are used to streamline the testing process.

## Deployment
Infrastructure is provisioned using Terraform, following Infrastructure as Code (IaC) principles. AWS services are deployed and configured according to project requirements.

## Monitoring and Logging
Monitoring and logging mechanisms leverage AWS CloudWatch, ELK Stack, and CloudWatch Alarms for real-time visibility into system health and performance metrics. Logs are collected, analyzed, and visualized to facilitate proactive monitoring and troubleshooting.

## Conclusion
The end-to-end data engineering pipeline demonstrates proficiency in designing, implementing, and managing complex data pipelines to support various data processing, analysis, and visualization tasks. The project showcases best practices in data engineering, including modular architecture, automated testing, Infrastructure as Code, and robust monitoring and logging.

## Repository Structure
- `code/`: Contains the code for Apache Airflow DAGs, Python scripts, SQL queries, and other relevant scripts.
- `documentation/`: Includes project documentation, README files, and other documentation resources.
- `resources/`: Contains structural drawings, diagrams, and other project resources.
- `README.md`: The main README file for the repository, providing an overview of the project and its contents.

## Getting Started
To get started with the project, clone the repository to your local machine and refer to the documentation and code files for detailed information about the project implementation. I have given lots of getting started guides which can be used to bring ourselves up to speed.

## Contributing
Contributions to the project are welcome! Please fork the repository, make your changes, and submit a pull request for review.

## Acknowledgments
Special thanks to the instructors and mentors at the Data Engineering Zoomcamp by DataTalks for their guidance and support throughout the project.

