terraform {
  backend "s3" {
    bucket = "yama-s3"
    key    = "terraform/backend_exercise6"
    region = "us-east-1"
  }
}