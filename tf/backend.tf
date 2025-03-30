terraform {
  backend "s3" {
    bucket         = "tf-state-nginx-yo"
    key            = "infra/terraform.tfstate"
    region         = "eu-north-1"
    encrypt        = true
  }
}
