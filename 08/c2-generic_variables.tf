#aws region
variable "aws_region" {
  description = "aws region for instance"
  type = string
  default = "ap-south-1"
}
#environment variable
variable "environment" {
  description = "env variable used as prefix"
  type = string
  default = "dev"
}
#business division
variable "business_division"{
 description = "business_division"
 type = string
 default = "HR"
}
