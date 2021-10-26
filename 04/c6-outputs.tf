#outputs - for loop in lists
output "for_output_list" {
  description = "Output in list"
  value = [for instance in aws_instance.MY-VM: instance.public_dns]
}
#outputs - for loop in Map
output "for_output_Map" {
  description = "Output in Map"
  value = {for instance in aws_instance.MY-VM: instance.id => instance.public_dns}
}
#outputs - for loop in Map Advanced
output "for_output_MapAdv" {
  description = "Output in MapAdv"
  value = {for c, instance in aws_instance.MY-VM: c => instance.public_dns}
}
#outputs- Legacy splat opeartor
output "Legacy_splat_instance_publicdns" {
  description = "legacy splat expression"
  value = aws_instance.MY-VM.*.public_dns
}

# Output Latest Generalized Splat Operator - Returns the List
output "latest_splat_instance_publicdns" {
  description = "Generalized Splat Expression"
  value = aws_instance.MY-VM[*].public_dns
}