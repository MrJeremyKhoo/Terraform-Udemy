provider "aws" {
  region = "ap-southeast-1"
  access_key = "some access_key"
  secret_key = "some secret_key"
}


resource "aws_instance" "ec2" {
    ami = "ami-02d7333f788d1caf6"
    instance_type = "t2.micro"
    security_groups = [aws_security_group.webtraffic.name]
}

variable "ingressrules" {
    type = list(number)
    default = [80,443]
}

variable "egressrules" {
    type = list(number)
    default = [80,443,25,3306,53,8080]
}

resource "aws_security_group" "webtraffic" {
    name = "Allow HTTPS"

    dynamic "ingress" {
        iterator = port 
        for_each = var.ingressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }

    dynamic "egress" {
        iterator = port 
        for_each = var.egressrules
        content {
        from_port = port.value
        to_port = port.value
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
        }
    }
}