#example1:without list varaible
#resource "aws_instance" "test" {
 #  ami = "ami-0bb84b8ffd87024d8"
 #  instance_type = "t2.micro"
  # key_name = "devsecops"
   #count = 2

   #tags = {
    # Name = "Pavan-${count.index}"

   #}
  
#}
variable "ami_id" {
    type = string
    default = "ami-0427090fd1714168b"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "devsecops"
  
}
variable "test" {
    type = list(string)
    default = ["dev0","prod1"]
  
}

resource "aws_instance" "dev" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    count = length(var.test)
    tags = {
      Name = var.test[count.index]
    }

    
}
