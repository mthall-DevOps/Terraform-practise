
resource "aws_instance" "MY-VM" {
  ami = data.aws_ami.amzlinux2.id 
  #instance_type = var.instance_type
  instance_type = var.instance_type_list[0]
  #instance_type = var.instance_type_map["dev"]
  user_data = file("${path.module}/sampleapp1.sh")
  key_name = var.aws_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  # Meta-Argument Count
  count = 2
  tags = {
    "Name" = "DEMOVM-${count.index}"
  }
}