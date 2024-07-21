resource "aws_instance" "ramya" {
    ami = "ami-0b72821e2f351e396"
    instance_type = "t2.micro"
    key_name = "task"
     #security_groups = [ "aws_security_group.dev.id" ]
    tags = {
      Name = "Instanced-01"
    }
}

resource "aws_vpc" "dev" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "vpc-01"
    }
  
}
resource "aws_subnet" "dev-01" {
    vpc_id = aws_vpc.dev.id
    availability_zone = "ap-south-1a"
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "subnet-01"
    }  
}
resource "aws_security_group" "dev" {
    name = "allow_tls"
    vpc_id = aws_vpc.dev.id
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