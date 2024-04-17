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

# Output RDS endpoint and Airflow instance public IP
output "rds_endpoint" {
  value = aws_db_instance.postgresql.endpoint
}

output "airflow_public_ip" {
  value = aws_instance.airflow.public_ip
}

