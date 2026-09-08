locals {
  name_prefix = "oops-dev"

  s3_bucket_name             = "${local.name_prefix}-attachments"
  db_identifier              = "${local.name_prefix}-postgres"
  redis_replication_group_id = "${local.name_prefix}-redis"
}
