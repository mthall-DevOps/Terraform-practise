
resource "aws_instance" "MY-VM" {
  ami = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  user_data = file("${path.module}/sampleapp1.sh")
  tags = {
    "Name" = "DEMOVM"
  }
}