#Create VPC
resource "aws_vpc" "gayathri" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "gayathri"
    }
  
}
#Create Internet Gateway and attach to VPC
resource "aws_internet_gateway" "gayathri" {
    vpc_id = aws_vpc.gayathri.id
    tags = {
      Name = "gayathri"
    }
  
}
#Create subnet
resource "aws_subnet" "gayathri" {
    vpc_id = aws_vpc.gayathri.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "gayathri"
    }
  
}
#Create RouteTable and attach to Internet Gateway to RouteTable
resource "aws_route_table" "gayathri" {
    vpc_id = aws_vpc.gayathri.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gayathri.id
    }
    tags = {
      Name = "gayathri"
    }
  
}
#Subnet Association
resource "aws_route_table_association" "gayathri" {
    route_table_id = aws_route_table.gayathri.id
    subnet_id = aws_subnet.gayathri.id
    
  
}
#Create Security Group
resource "aws_security_group" "gayathri" {
  name        = "allow_tls"
  vpc_id      = aws_vpc.gayathri.id
  tags = {
    Name = "gayathri_sg"
  }
 ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "TCP"
    cidr_blocks      = ["0.0.0.0/0"]
    
  }
ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
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
