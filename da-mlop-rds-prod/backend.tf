terraform {
  backend "s3" {
    bucket = "remote-tf-statefile"
    key = "rds/terraform.statefile"
    region = "ap-southeast-1"
  }
}