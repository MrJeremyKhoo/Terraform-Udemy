provider "aws" {
    region = "ap-southeast-1"
    access_key = "some access_key"
    secret_key = "some secret_key"
}

resource "aws_vpc" "challenge1vpc" {
    cidr_block = "192.168.0.0/24"
    tags = {
        Name = "TerraformVPC"
    }
}