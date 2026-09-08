resource "aws_s3_bucket" "attachments" {
  bucket        = local.s3_bucket_name
  force_destroy = true # allows `terraform destroy` even with objects still in the bucket
}
