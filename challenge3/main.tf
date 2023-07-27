provider "aws" {
  region = "ap-southeast-1"
  access_key = "some access_key"
  secret_key = "some secret_key"
}

module "db" {
    source = "./db"
    
}

module "web" {
    source = "./web"  
}

output "PrivateIP" {
    value = module.db.PrivateIP
}

output "PublicIP" {
    value = module.web.pub_ip
}