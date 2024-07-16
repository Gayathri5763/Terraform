resource "aws_instance" "ramya" {
    ami = var.ami_id
    instance_type = var.instance_type
    key_name = var.key_name
    subnet_id = aws_subnet.ramya.id

    tags = {
        Name = "ramya_ec2"
    }
} 



