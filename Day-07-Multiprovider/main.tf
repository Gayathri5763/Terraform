provider "aws" {
    region = "us-east-1"
  
}

resource "aws_s3_bucket" "dev" {
    bucket = "wskwhbdiwuguwhcxugeiwhs"   
}

provider "aws" {
    region = "us-east-1"
    alias = "America"
  
}

resource "aws_s3_bucket" "dev2" {
    bucket = "jxnsxskxpsjxywwowkw"
    provider = aws.America
  
}
