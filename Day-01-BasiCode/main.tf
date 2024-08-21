resource "aws_instance" "Gayathri" {
    ami = "ami-02b49a24cfb95941c"
    instance_type = "t2.micro"
    key_name = "Jenkins"
    tags = {
      Name = "instance-01"
    }
  
}