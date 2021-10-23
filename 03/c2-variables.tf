#aws region
variable "aws_region" {
  description = "aws region for instance"
  type = string
  default = "ap-south-1"
}
#aws instance
variable "aws_instance" {
  description = "aws instance"
  type = string
  default = "t2.micro"
}
#aws ec2 key pair
variable "aws_keypair" {
  description = "ec2-instance key pair"
  type = string
  default = "aws-key"
}
