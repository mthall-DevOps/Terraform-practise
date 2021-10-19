terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      #version = "~> 3.0"
    }
  }
}
provider "aws" {
  profile = "default"
  region = "ap-south-1"
}
resource "aws_instance" "ec2demo" {
  ami           = "ami-041d6256ed0f2061c" # Amazon Linux in us-east-1, update as per your region
  instance_type = "t2.micro"
}

