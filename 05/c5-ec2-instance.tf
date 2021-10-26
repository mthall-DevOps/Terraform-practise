
data "aws_availability_zones" "azones" {
  filter {
    name   = "opt-in-status"
    values = ["opt-in-not-required"]
  }
}
resource "aws_instance" "MY-VM" {
  ami = data.aws_ami.amzlinux2.id 
  instance_type = var.instance_type
  #instance_type = var.instance_type_list[0]
  #instance_type = var.instance_type_map["qa"]
  user_data = file("${path.module}/sampleapp1.sh")
  key_name = var.aws_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  for_each = toset(data.aws_availability_zones.azones.names)
  availability_zone = each.key
  tags = {
    "Name" = "DEMOVM-${each.key}"
  }
}