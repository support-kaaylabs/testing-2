terraform {
  backend "s3" {
    bucket = "terraform-zupain"
    key    = "terraform.tfstate"
    region = "ap-south-1"
  }
}
