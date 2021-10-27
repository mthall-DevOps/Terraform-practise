# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type2" {
  for_each = toset([ "ap-south-1a", "ap-south-1b", "ap-south-1c" ])
  filter {
    name   = "instance-type"
    values = ["t2.micro"]
  }
  filter {
    name   = "location"
    values = [each.key] 
  }
  location_type = "availability-zone"
}


# Output
output "output_v1_1" {
 #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
 value = [ for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types] 
}