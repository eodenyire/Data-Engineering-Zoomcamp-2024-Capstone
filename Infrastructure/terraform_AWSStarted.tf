# Define provider
provider "aws" {
  region = "us-east-1" # Set your desired region
}

# Create AWS RDS instance for PostgreSQL
resource "aws_db_instance" "postgresql" {
  allocated_storage    = 20
  engine               = "postgres"
  instance_class       = "db.t2.micro"
  name                 = "my-postgresql-db"
  username             = "admin"
  password             = "password"
}

# Create AWS Redshift cluster for analysis
resource "aws_redshift_cluster" "redshift" {
  cluster_identifier      = "my-redshift-cluster"
  node_type               = "dc2.large"
  cluster_type            = "single-node"
  master_username         = "admin"
  master_password         = "password"
}

# Create EC2 instance for Airflow
resource "aws_instance" "airflow" {
  ami                    = "ami-0c55b159cbfafe1f0"
  instance_type          = "t2.micro"
  key_name               = "your-keypair-name"
  security_groups        = ["${aws_security_group.airflow.id}"]
  user_data              = "${file("userdata.sh")}"
}

# Create security group for Airflow EC2 instance
resource "aws_security_group" "airflow" {
  name        = "airflow-sg"
  description = "Security group for Airflow EC2 instance"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# Create S3 bucket for data storage
resource "aws_s3_bucket" "data_storage" {
  bucket = "my-data-storage-bucket"
  acl    = "private"
}

# Create IAM role for AWS Lambda
resource "aws_iam_role" "lambda_role" {
  name = "lambda-role"
  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement": [{
      "Effect": "Allow",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }]
  })
}

# Attach policies to IAM role for AWS Lambda
resource "aws_iam_role_policy_attachment" "lambda_policy_attachment" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Create AWS Lambda function for fraud detection
resource "aws_lambda_function" "fraud_detection" {
  function_name    = "fraud-detection"
  handler          = "index.handler"
  runtime          = "python3.8"
  role             = aws_iam_role.lambda_role.arn
  filename         = "lambda_function_payload.zip"
  source_code_hash = filebase64sha256("lambda_function_payload.zip")
}

# Create CloudWatch log group for Airflow
resource "aws_cloudwatch_log_group" "airflow_logs" {
  name              = "/airflow"
  retention_in_days = 30
}

# Output RDS endpoint, Redshift endpoint, Airflow public IP, and Lambda function ARN
output "rds_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}

output "redshift_endpoint" {
  value = aws_redshift_cluster.redshift.endpoint
}

output "airflow_public_ip" {
  value = aws_instance.airflow.public_ip
}

output "lambda_arn" {
  value = aws_lambda_function.fraud_detection.arn
}

