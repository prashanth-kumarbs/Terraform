resource "random_id" "bucket_suffix" {
  byte_length = 4
}

resource "aws_s3_bucket" "bucket" {
  bucket = "my-tf-demo-bucket-${random_id.bucket_suffix.hex}"
  acl    = "private"
  tags   = { Name = "my-s3-bucket" }
}

