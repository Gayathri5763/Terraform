resource "aws_instance" "test" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"
    key_name = "task"
  
}

resource "aws_s3_bucket" "test" {
    bucket = "njgyekdihdyuefmnb"
    depends_on = [aws_instance.test]
  
}
