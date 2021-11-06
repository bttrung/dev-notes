terraform {
  backend "s3" {
    bucket = "terraform-trungbt"
    key = "terraform-backend-state"
    region = "ap-southeast-1"
  }
}