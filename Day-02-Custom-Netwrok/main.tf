#create vpc
resource "aws_vpc" "ramya" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name = "ramya"
    }
    }

#create internet gateway and attach to vpc
resource "aws_internet_gateway" "ramya" {
    vpc_id = aws_vpc.ramya.id
  }
#create subnets
resource "aws_subnet" "ramya" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.ramya.id
} 
#create route table and attach internat gateway to rt
 resource "aws_route_table" "ramya" {
    vpc_id = aws_vpc.ramya.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.ramya.id
    }
}

#subnet association
resource "aws_route_table_association" "name" {
    route_table_id = aws_route_table.ramya.id
    subnet_id = aws_subnet.ramya.id

}