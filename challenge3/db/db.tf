resource "aws_instance" "db" {
    ami = "ami-02d7333f788d1caf6"
    instance_type = "t2.micro"

    tags = {
        Name = "DB Server"
    }
}

output "PrivateIP" {
    value = aws_instance.db.private_ip
}