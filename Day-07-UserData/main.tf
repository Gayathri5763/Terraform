
provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "web" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "devsecops"
    user_data = file("test.sh")
    tags = {
      Name = "Web-Instance"
    }
  
}
