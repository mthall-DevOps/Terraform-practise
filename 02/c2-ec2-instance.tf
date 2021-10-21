
resource "aws_instance" "MY-VM" {
  ami = "ami-041d6256ed0f2061c"
  instance_type = "t2.micro"
  user_data = file("${path.module}/sampleapp1.sh")
  tags = {
    "Name" = "DEMOVM"
  }
}