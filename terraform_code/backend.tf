terraform {
  backend "s3" {
    bucket = "demo-terraform-bucket-1"
    key    = "terraform"
    region = "us-east-1"
  }
}
