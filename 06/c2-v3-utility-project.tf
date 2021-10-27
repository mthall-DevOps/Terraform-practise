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
#basic output
output "output_v3_1" {
 value = {
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: az => i.instance_types
 }
}

#filtered output
output "output_v3_2" {
value = {
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: 
   az => i.instance_types if length(i.instance_types) != 0
 }
}
#take only keys
output "output_v3_3" {
value = keys({
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: 
   az => i.instance_types if length(i.instance_types) != 0
 })
}
#only one value from the list of keys
output "output_v3_4" {
value = keys({
   for az, i in data.aws_ec2_instance_type_offerings.my_ins_type: 
   az => i.instance_types if length(i.instance_types) != 0
 })[0]
}

