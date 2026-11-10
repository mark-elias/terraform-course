provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "example_ec2" {
  ami           = "ami-0567589d25e06853e"
  instance_type = "t3.micro"
  // link securty group
  security_groups = [aws_security_group.example_security_group.name]

  tags = {
    Name = "example_EC2"
  }
}

resource "aws_security_group" "example_security_group" {
  name = "Allow HTTPS"

  tags = {
    Name = "example_sg"
  }
  // traffic in
  ingress {
    // create a range from and to
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]
  }


  // traffic out
  egress {
    // create a range from and to
    from_port   = 443
    to_port     = 443
    protocol    = "TCP"
    cidr_blocks = ["0.0.0.0/0"]

  }

}
