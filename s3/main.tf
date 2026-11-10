provider "aws" {
  region = "us-east-1"
}

resource "aws_s3_bucket" "my_bucket" {
  bucket = "mark-terraform-course-bucket-12345"

  tags = {
    Name = "terraform-course-bucket"
  }
}