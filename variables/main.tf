provider "aws" {
  region = "us-east-1"
}

# ==================
# strings
variable "vpc_name" {
  type    = string
  default = "my_example_vpc"
}

# numbers
variable "ssh_port" {
  type    = number
  default = 22
}

# booleans
variable "enabled" {
  type    = bool
  default = true
}

# lists
variable "my_list" {
  type    = list(string)
  default = ["value1", "value2", "value3"]
}

# maps
variable "my_map" {
  type = map(any)
  default = {
    key1 = "value1"
    key2 = "value2"
  }
}
# =======================
variable "input_variable_example" {
  type        = string
  description = "set the name of the VPC"
}

resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = var.input_variable_example
  }
}

