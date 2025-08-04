resource "aws_s3_bucket" "my_bucket" {
  bucket = "my-bucket-s3"
  tags = {
    Name        = "My bucket"
    Environment = "Dev"
  }
}