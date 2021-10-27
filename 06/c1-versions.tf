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
  region = "ap-south-1"
}