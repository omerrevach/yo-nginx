resource "aws_s3_bucket" "terraform_state" {
  bucket = "tf-state-nginx-yo"
  force_destroy = true
}
