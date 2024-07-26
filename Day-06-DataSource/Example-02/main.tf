resource "aws_instance" "dev" {
  ami                          = data.aws_ami.amzlinux.id
  instance_type                = "t2.micro"
  security_groups              = [data.aws_security_group.anna.id]  // Ensure data.aws_security_group.dev.id returns a valid security group ID
  subnet_id                    = data.aws_subnet.dev-01.id          // Ensure data.aws_subnet.dev.id returns a valid subnet ID
  tags = {
    Name = "Hardcoded-Instance"
  }
}
