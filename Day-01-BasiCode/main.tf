resource "aws_instance" "Gayathri" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "task"
    tags = {
      Name = "instance-01"
    }
  
}