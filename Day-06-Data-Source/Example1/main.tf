resource "aws_instance" "ramya" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    key_name = "task"
    associate_public_ip_address = true
    security_groups = [data.aws_security_group.ramya.id]
    subnet_id = data.aws_subnet.dev-01
    tags = {
        Name = "Hardcoded-instance"
      
    }
}

