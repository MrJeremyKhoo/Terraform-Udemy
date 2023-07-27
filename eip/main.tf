provider "aws" {
    region = "ap-southeast-1"
    access_key = "some access_key"
    secret_key = "some secret_key"
}

resource "aws_instance" "ec2" {
    ami = "ami-02d7333f788d1caf6"
    instance_type = "t2.micro"
}

resource "aws_eip" "elasticeip" {
    instance = aws_instance.ec2.id
}

output "EIP" {
    value = aws_eip.elasticeip.public_ip
}