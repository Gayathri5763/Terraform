resource "aws_instance" "test" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "task"
  
}

resource "aws_s3_bucket" "test" {
    bucket = "efdmjebnfehfoiqehi"
    depends_on = [aws_instance.test]
  
}
