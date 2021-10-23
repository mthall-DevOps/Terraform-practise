#output public IP
output "public-IP" {
  description = "instance public ip"
  value = aws_instance.MY-VM.public_ip
}
#public dns
output "public-DNS" {
  description = "instance public DNS"
  value = aws_instance.MY-VM.public_dns
}