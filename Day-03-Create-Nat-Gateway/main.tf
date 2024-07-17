
#Create VPC
resource "aws_vpc" "ramya" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "ramya_VPC"
    }
  
}
#Create Internet Gateway
resource "aws_internet_gateway" "ramya" {
    vpc_id = aws_vpc.ramya.id
    tags = {
      Name = "ramya-Int"
    }
  
}
#Create public Subnet
resource "aws_subnet" "public_ramya" {
    vpc_id = aws_vpc.ramya.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "Public-Subnet-01"
    }
  
}
#Create Private Subnet
resource "aws_subnet" "Private_ramya" {
    vpc_id = aws_vpc.ramya.id
    cidr_block = "10.0.2.0/24"
    tags = {
      Name = "Private-Subnet-01"
    }
  
}
#Create Elastic ip
resource "aws_eip" "ramya" {
    domain = "vpc"
    tags = {
      Name = "ramya-ELIP"
    }
  
}
#Create NAT Gateway and attach to 
resource "aws_nat_gateway" "ramya" {
    subnet_id = aws_subnet.public_ramya.id
    allocation_id = aws_eip.ramya.id
    tags = {
      Name = "ramya-NAT"
    }
  
}
#Create Route table and Attach to internet gateway to public route table
resource "aws_route_table" "Public-ramya" {
    vpc_id = aws_vpc.ramya.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ramya.id
    }
    tags = {
      Name = "Public-RT"
    }

  
}
#Attach Nat Gateway to Private Route
resource "aws_route_table" "Private-ramya" {
    vpc_id = aws_vpc.ramya.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.ramya.id
    }
    tags = {
        Name = "Private-RT"
    }

  
}
#Public RT association
resource "aws_route_table_association" "Public-ramya" {
    subnet_id = aws_subnet.public_ramya.id
    route_table_id = aws_route_table.Public-ramya.id
  
}
#private RT association
resource "aws_route_table_association" "Private-ramya" {
    route_table_id = aws_route_table.Private-ramya.id
    subnet_id = aws_subnet.Private_ramya.id
  
}
