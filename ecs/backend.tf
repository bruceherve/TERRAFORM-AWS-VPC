# create s3 bucket
resource "aws_s3_bucket" "terraform-state" {
  bucket = "terraform-state-herve"
}
#provider "aws" {
  #profile = "herve"
 # region = "us-east-1"
#}
# create s3 bucket acl
resource "aws_s3_bucket_acl" "bucket-acl" {
  bucket = aws_s3_bucket.terraform-state.id 
  acl = "private"
}

# create s3 bucket versioning
#resource "aws_s3_bucket_versioning" "bucket-versioning" {
 # bucket = aws_s3_bucket.terraform-state.id 
  #versioning_configuration {
 #   status = "Enabled"
  #}
#}

# store the terraform state file in s3
terraform {
  backend "s3" {
    bucket = "terraform-state-herve"
    key = "ecs.tfstate"
    region = "us-east-1"
    profile = "herve"
  }
}