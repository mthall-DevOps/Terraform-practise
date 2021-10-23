
resource "aws_instance" "MY-VM" {
  ami = data.aws_ami.amzlinux2.id 
  instance_type = var.instance_type
  user_data = file("${path.module}/sampleapp1.sh")
  key_name = var.aws_keypair
  vpc_security_group_ids = [ aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id ]
  tags = {
    "Name" = "DEMOVM"
  }
}