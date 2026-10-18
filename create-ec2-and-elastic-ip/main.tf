provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_ec2" {
  ami           = "ami-0567589d25e06853e"
  instance_type = "t3.micro"

  tags = {
    Name = "example_EC2"
  }
}

resource "aws_eip" "example_elastic_ip" {
  # connect it to the ec2
  instance = aws_instance.example_ec2.id

  tags = {
    Name = "example_elastic_ip"
  }
}

output "example_Elastic_IP" {
  value = aws_eip.example_elastic_ip.public_ip
}
