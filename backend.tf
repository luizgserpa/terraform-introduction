terraform {
  backend "s3" {
    bucket = "gdg-2022-workshop-tf"
    key    = "terraform/state.tfstate"
    region = "us-east-1"
  }
}