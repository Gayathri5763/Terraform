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
variable "sandbox" {
    type = list(string)
    default = [ "dev","prod"]
  
}

resource "aws_instance" "test" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
     for_each = toset(var.sandbox)
   

    tags = {
      Name = each.value
    }
  
}
