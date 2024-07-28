provider "aws" {
    region = "us-east-1"
  
}
module "aws_instance" {

   
source = "./module"
    ami = "ami-068e0f1a600cd311c"
    instance_type = "t2.micro"
    key_name = "rams"
    name = "amma"

  
}
