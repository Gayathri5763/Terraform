resource "aws_instance" "Gayathri" {
    ami = "ami-0a4408457f9a03be3"
    instance_type = "t2.micro"
    key_name = "jenkins"
    tags = {
      Name = "instance-01"
    }
  
}