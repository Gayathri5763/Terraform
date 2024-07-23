resource "aws_instance" "gayathri_dev1" {
    ami = var.ami_id_Public
    instance_type = var.instance_type_01 
    key_name = var.key_name_01
    tags = {
      Name = "public-id"
    }
}
resource "aws_instance" "gayathri_dev2" {
    ami = var.ami_id_Private
    instance_type = var.instance_type_02
    key_name = var.key_name_02
    tags = {
      Name = "private-id"
    }
}