# Create Qlik Sense Server EC2 Instance
resource "aws_instance" "qlik_sense_server" {
  ami                    = "ami-xxxxxxxxxxxxxxx" # Specify the Qlik Sense Server AMI
  instance_type          = "t2.large"            # Specify instance type based on Qlik Sense requirements
  key_name               = "your-keypair-name"   # Specify the key pair for SSH access
  security_groups        = ["${aws_security_group.qlik_sense_sg.id}"] # Reference security group for Qlik Sense server
  user_data              = "${file("userdata_qlik_sense.sh")}" # Script to configure Qlik Sense server
}

# Create security group for Qlik Sense server
resource "aws_security_group" "qlik_sense_sg" {
  name        = "qlik-sense-sg"
  description = "Security group for Qlik Sense server"

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Add additional ingress rules as needed for Qlik Sense ports and protocols
}

# Output Qlik Sense Server Public IP
output "qlik_sense_server_public_ip" {
  value = aws_instance.qlik_sense_server.public_ip
}

