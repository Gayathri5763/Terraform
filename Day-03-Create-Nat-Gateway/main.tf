#create vpc
resource "aws_vpc" "gayathri" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "vpc_cust1"
        }
}

 #create internet gateway attach to vpc
resource "aws_internet_gateway" "gaya3" {
    vpc_id = aws_vpc.gayathri.id
    tags = {
      Name = "gaya3"
    }
  
}
#create public subnet
resource "aws_subnet" "gaya3" {
    vpc_id = aws_vpc.gayathri.id
    cidr_block = "10.0.0.0/24"
    tags = {
        Name = "pub_sub"
    }
}
#create private subnet
resource "aws_subnet" "gaya3_pvt" {
    vpc_id = aws_vpc.gayathri.id
    cidr_block = "10.0.1.0/24"
    tags = {
        Name = "pvt_sub"
    }
}
#create elastic ip
resource "aws_eip" "gaya3" {
    domain = "vpc"
    tags = {
      Name = "gayathri"
    }
  
}
#create Nat gateway to attach eip
resource "aws_nat_gateway" "gaya3" {
    subnet_id = aws_subnet.gaya3_pvt.id
    allocation_id = aws_eip.gaya3.id
    tags = {
      Name = "gayathri"
    }

}
#Create Route table and Attach to internet gateway to public route table
resource "aws_route_table" "Pub-gayathri" {
    vpc_id = aws_vpc.gayathri.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.gaya3.id
    }
    tags = {
      Name = "Public-RT"
    }

  
}
#Attach Nat Gateway to Private Route
resource "aws_route_table" "Private-gayathri" {
    vpc_id = aws_vpc.gayathri.id
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.gaya3.id
    }
    tags = {
        Name = "Private-RT"
    }

  
}
#Public RT association
resource "aws_route_table_association" "Public-gayathri" {
    subnet_id = aws_subnet.gaya3.id
    route_table_id = aws_route_table.Pub-gayathri.id
  
}
#private RT association
resource "aws_route_table_association" "Private-gayathri" {
    route_table_id = aws_route_table.Private-gayathri.id
    subnet_id = aws_subnet.gaya3_pvt.id
}