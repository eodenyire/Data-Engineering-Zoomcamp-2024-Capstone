"""
In this Terraform file:

EC2 instances are provisioned for Tableau Server and Qlik Sense Server.
An AWS QuickSight account is created.
An AWS Redshift cluster is provisioned.
You'll need to replace placeholder values such as AMI IDs, instance types, key pair names, AWS account IDs, IAM role ARNs, security group IDs, etc., with your actual values. Additionally, you may need to define other resources such as security groups, IAM roles, etc., as required by your specific setup.

Make sure to run terraform init and terraform apply commands after updating the Terraform file to provision the resources in your AWS account.
"""



# Define provider
provider "aws" {
  region = "us-east-1"  # Update with your desired region
}

# Provision EC2 instance for Tableau
resource "aws_instance" "tableau_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Update with Tableau-compatible AMI
  instance_type = "t2.medium"               # Update with desired instance type
  key_name      = "your_key_pair_name"      # Update with your EC2 key pair name

  tags = {
    Name = "Tableau Server"
  }
}

# Provision EC2 instance for Qlik Sense
resource "aws_instance" "qlik_sense_instance" {
  ami           = "ami-0c55b159cbfafe1f0"  # Update with Qlik Sense-compatible AMI
  instance_type = "t2.medium"               # Update with desired instance type
  key_name      = "your_key_pair_name"      # Update with your EC2 key pair name

  tags = {
    Name = "Qlik Sense Server"
  }
}

# Create AWS QuickSight resources
resource "aws_quicksight_account" "main" {
  name     = "Your QuickSight Account Name"
  aws_account_id = "your_aws_account_id"     # Update with your AWS account ID
}

# Define Redshift cluster
resource "aws_redshift_cluster" "main" {
  cluster_identifier         = "redshift-cluster"
  node_type                  = "dc2.large"
  cluster_type               = "single-node"
  publicly_accessible        = true
  iam_roles                  = ["arn:aws:iam::123456789012:role/redshift-role"]  # Update with IAM role ARN
  vpc_security_group_ids     = ["sg-0123456789abcdef0"]                          # Update with security group ID
  cluster_subnet_group_name  = "redshift-subnet-group"
}

# Other resources such as security groups, IAM roles, etc. can be defined here


