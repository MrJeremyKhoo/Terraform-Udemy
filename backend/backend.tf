terraform {
    backend "s3" {
        key = "terraform/tfstate.tfstate"
        bucket = "internbuckey"
        region = "ap-southeast-1"
        access_key = "some access_key"
        secret_key = "some secret_key"
    }
}