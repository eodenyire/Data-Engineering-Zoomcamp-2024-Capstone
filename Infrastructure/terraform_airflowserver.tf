"""  
This configuration will create an EC2 instance named Airflow Instance running Apache Airflow. The user_data script installs Airflow, initializes the metadata database, and starts the Airflow scheduler and web server. Additionally, it sets up a security group allowing SSH access on port 22 and any other necessary inbound rules for Airflow services. Finally, it creates a key pair for SSH access to the instance.
"""



# Define the EC2 instance for Airflow deployment
resource "aws_instance" "airflow_instance" {
  ami                    = "your_ami_id"
  instance_type          = "t2.micro"
  key_name               = "your_key_name"
  security_groups        = ["${aws_security_group.airflow_security_group.name}"]
  subnet_id              = "your_subnet_id"
  associate_public_ip_address = true
  tags = {
    Name = "Airflow Instance"
  }

  # Provisioning script to install Airflow
  user_data = <<-EOF
              #!/bin/bash
              # Install necessary packages and dependencies
              sudo apt update
              sudo apt install -y python3-pip python3-venv
              # Install Apache Airflow
              pip3 install apache-airflow
              # Initialize Airflow metadata database
              airflow db init
              # Start Airflow scheduler and web server
              airflow scheduler -D
              airflow webserver -D
              EOF
}

# Define security group for Airflow instance
resource "aws_security_group" "airflow_security_group" {
  name        = "airflow-security-group"
  description = "Security group for Airflow instance"
  vpc_id      = "your_vpc_id"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add additional ingress rules as needed for Airflow services
}

# Define key pair for SSH access to Airflow instance
resource "aws_key_pair" "airflow_key_pair" {
  key_name   = "airflow-key"
  public_key = "your_public_ssh_key"
}

