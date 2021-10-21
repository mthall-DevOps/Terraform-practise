terraform {
    required_version = "~> 1.0" //~> is a version constarint allows 1.0, 1.1,1.2 etc
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 3.63"
     }
  }
}
provider "aws" {
  profile = "default"
  region = "us-east-1"
}

resource "aws_instance" "MY-VM" {
  ami = "ami-02e136e904f3da870"
  instance_type = t2.micro
  user_data = file("${path.module}/sampleapp1.sh")
  tags = {
    "Name" = "DEMOVM"
  }
}