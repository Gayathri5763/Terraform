resource "aws_instance" "ramya" {
    ami = "ami-066784287e358dad1"
    instance_type = "t2.micro"
    key_name = "dev"
    tags = {
      Name = "instance-01"
    }

}