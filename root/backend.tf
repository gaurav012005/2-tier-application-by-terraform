terraform {
  backend "s3" {
    bucket = "tfstate-gaurav-101"
    key    = "backend/prod.tfstate"
    region = "us-east-1"
    dynamodb_table = "remote-backend"
  }
}