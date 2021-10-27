#list of AZ's
data "aws_availability_zones" "azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
# Datasource
data "aws_ec2_instance_type_offerings" "my_ins_type" {
  for_each = toset(data.aws_availability_zones.azones.names)
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
output "output_v3_1" {
 #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
 value = toset([ for t in data.aws_ec2_instance_type_offerings.my_ins_type: t.instance_types])
}

output "output_v3_2" {
 #value = data.aws_ec2_instance_type_offerings.my_ins_type1.instance_types
 #value = toset([ for t in data.aws_ec2_instance_type_offerings.my_ins_type2: t.instance_types])
 value = {
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: az => i.instance_types
 }
}

#filtered output
output "output_v3_3" {
value = {
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: 
   az => i.instance_types if length(i.instance_types) != 0
 }
}

