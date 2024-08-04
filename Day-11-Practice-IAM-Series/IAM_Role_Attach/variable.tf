variable "region_name" {
    type = string
    default = "us-east-1"
  
}
variable "image_id" {
    type = string
    default = "ami-0ba9883b710b05ac6"
  
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}
variable "key_name" {
    type = string
    default = "devsecops"
  
}
variable "role_name" {
    type = string
    default = "ec2"
  
}
   
