module "test" {
    source = "../Day-02-Custom-Network"
    ami_id = var.ami
    instance_type = var.instance_type
    key_name = var.key_name

}
