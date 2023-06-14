terraform {
  backend "s3" {
    bucket = "remote-tf-statefile"
    key = "dev/terraform.statefile"
    region = "ap-southeast-1"
  }
}