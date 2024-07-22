provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "ramya" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"
    key_name = "task"
    user_data = file("test.sh")
    tags = {
      Name = "web-instance"
    }
}
