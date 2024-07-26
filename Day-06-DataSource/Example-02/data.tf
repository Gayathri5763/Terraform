data "aws_security_group" "anna" {
    id = "sg-0394822cb9d306ae8"
    filter {
      name = "tag:Name"
      values = [ "sg-pavan" ]
    }
  
}

data "aws_vpc" "dev" {
    filter {
      name = "tag:Name"
      values = [ "vpc-01" ]
    }
  
}

data "aws_subnet" "dev" {
    id = "subnet-0ca62c13250d65e02"
    filter {
      name = "tag:Name"
      values = [ "subnet-01" ]
    }
}
  


data "aws_ami" "amzlinux" {
  most_recent = true
  owners = [ "amazon" ]
  filter {
    name = "name"
    values = [ "amzn2-x86_64-MATEDE_DOTNET-2023.10.12" ]
  }
  filter {
    name = "root-device-type"
    values = [ "ebs" ]
  }
  filter {
    name = "virtualization-type"
    values = [ "hvm" ]
  }
  filter {
    name = "architecture"
    values = [ "x86_64" ]
  }
}