"""
The install_tableau.sh script will contain the commands to install and configure Tableau Server on the EC2 instance. After running terraform apply, Terraform will provision the EC2 instance, execute the installation script, and copy the necessary files to the instance.
"""


# Define AWS provider
provider "aws" {
  region = "us-west-2"  # Replace with your desired region
}

# Define EC2 instance
resource "aws_instance" "tableau_server" {
  ami                    = "ami-0c55b159cbfafe1f0"  # AMI for your EC2 instance
  instance_type          = "t2.medium"              # Instance type
  key_name               = "your-key-pair"          # Key pair for SSH access
  security_groups        = ["your-security-group"]  # Security group(s) for instance
  subnet_id              = "your-subnet-id"         # Subnet ID

  # User data to execute installation script
  user_data = <<-EOF
              #!/bin/bash
              curl -O https://downloads.tableau.com/esdalt/2021.3.0/tableau-server-2021-3-0.x86_64.rpm
              sudo yum -y install tableau-server-2021-3-0.x86_64.rpm
              # Add commands to configure Tableau Server
              EOF
}

# Define provisioner to copy installation script to instance
resource "null_resource" "copy_install_script" {
  triggers = {
    instance_id = aws_instance.tableau_server.id
  }

  provisioner "local-exec" {
    command = "scp -i ~/.ssh/your-key.pem install_tableau.sh ec2-user@${aws_instance.tableau_server.public_ip}:~/"
  }
}

