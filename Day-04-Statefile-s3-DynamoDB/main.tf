resource "aws_s3_bucket" "gayathri_dev" {
    bucket = "ghjddiwojknsjcngnfje"
  
}
resource "aws_dynamodb_table" "terraform-state-lock-dynamo" {
  name = "terraform-state-lock-dynamo"
  hash_key = "LockID"
  read_capacity = 20
  write_capacity = 20
 
  attribute {
    name = "LockID"
    type = "S"
  }
}