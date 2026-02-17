terraform {
  backend "s3" {
    bucket = "new-bucket-7268"
    key = "statefile"
    region = "ap-south-1"
  }
}