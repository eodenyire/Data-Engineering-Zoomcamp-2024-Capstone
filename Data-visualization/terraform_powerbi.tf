# power_bi_instance.tf

provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "power_bi_instance" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name      = "your_key_pair_name"
  security_groups = ["your_security_group_name"]

  tags = {
    Name = "Power BI Instance"
  }
}

