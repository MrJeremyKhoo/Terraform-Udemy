provider "aws" {
  region = "ap-southeast-1"
  access_key = "some access_key"
  secret_key = "some secret_key"
}

resource "aws_vpc" "test" {
    cidr_block ="10.0.0.0/16"
}