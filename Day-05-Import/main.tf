provider "aws" {
  
}
resource "aws_instance" "bhavani" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t3.micro"
    tags = {
      Name = "Manual Instance"
    }
}
    
