output "public_ip" {
    value = aws_instance.gayathri_dev.public_ip
    #sensitive = true
  
}
output "private_ip" {
    value = aws_instance.gayathri_dev.private_ip
  
}
output "security_groups" {
    value = aws_security_group.gayathri.id
  
}
output "vpc_id" {
    value = aws_vpc.gayathri.id
  
}