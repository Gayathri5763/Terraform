
provider "aws" {
    region = "us-east-1"
  
}
resource "aws_instance" "dev" {
    ami = "ami-0427090fd1714168b"
    instance_type = "t2.micro"
    key_name = "devsecops"
    availability_zone = "us-east-1a"
    tags = {
      Name = "LifeCycle"
    }

    

    #below examples are for lifecycle meta_arguments 

  #lifecycle {
   # create_before_destroy = true    #this attribute will create the new object first and then destroy the old one
  #}

lifecycle {
   prevent_destroy = true   #Terraform will error when it attempts to destroy a resource when this is set to true:
 }


  #lifecycle {
     #ignore_changes = [tags,] #This means that Terraform will never update the object but will be able to create or destroy it.
   #}


  
}
