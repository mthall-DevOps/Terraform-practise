#aws region
variable "aws_region" {
  description = "aws region for instance"
  type = string
  default = "ap-south-1"
}
#aws instance
variable "instance_type" {
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
#instance ype with list
variable "instance_type_list" {
  description = "Instance type"
  type = list(string)
  default = [ "t2.micro", "t2.medium" ]
}
#instance tyep with map
variable "instance_type_map" {
  description = "Instance type"
  type = map(string)
  default = {
    "dev" = "t2.micro"
    "qa" = "t2.medium"
  }
}