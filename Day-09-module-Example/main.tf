module "test" {
    source = "../Day-09-Module-Local-Source"
    ami = "ami-068e0f1a600cd311c"
    instance_type = "t2.micro"
    key_name = "rams"
    
    
  
}
