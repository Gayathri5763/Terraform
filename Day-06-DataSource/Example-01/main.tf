resource "aws_instance" "anna" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "devsecops"
     #security_groups = [ "aws_security_group.dev.id" ]
     tags = {
       Name = "instance-01"
     }
}
resource "aws_vpc" "anna" {
  cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-01"
    }
  
}
resource "aws_subnet" "dev-01" {
  vpc_id            = aws_vpc.anna.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "subnet-01"
  }
}

resource "aws_security_group" "dev-01" {
  name = "allow_tls"
  vpc_id = aws_vpc.anna.id
    tags = {
        Name = "sg-pavan"
    }

    ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }



egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
  
}