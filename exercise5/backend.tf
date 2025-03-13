terraform {
  backend "s3" {
    bucket = "yama-s3"
    key    = "terraform/backend"
    region = "us-east-1"
  }
}