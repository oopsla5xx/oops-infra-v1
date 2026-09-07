resource "aws_s3_bucket" "attachments" {
  bucket        = "oops-dev-attachments"
  force_destroy = true # allows `terraform destroy` even with objects still in the bucket
}

resource "aws_db_instance" "postgres" {
  identifier          = "oops-dev-postgres"
  engine              = "postgres"
  engine_version      = "16"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  db_name             = "oops_development"
  username            = "oops"
  password            = "oops"
  skip_final_snapshot = true
  publicly_accessible = true

  lifecycle {
    ignore_changes = [publicly_accessible]
  }
}

resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = "oops-dev-redis"
  description                = "oops local dev cache/queue/pub-sub"
  engine                     = "redis"
  node_type                  = "cache.t3.micro"
  parameter_group_name       = "default.redis7.cluster.on"
  num_node_groups            = 1
  replicas_per_node_group    = 0
  automatic_failover_enabled = false
  port                       = 6379
}
