resource "aws_instance" "Gayathri" {
    ami = "ami-0ae8f15ae66fe8cda"
    instance_type = "t2.micro"
    key_name = "task"
    tags = {
      Name = "instance-01"
    }
  
}