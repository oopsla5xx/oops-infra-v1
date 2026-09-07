output "database_dsn" {
  description = "DATABASE_DSN shape used by oops-api-v1's .env.development — informational only (nothing reads this automatically); compare against the hardcoded value if something seems off"
  value       = "postgres://${aws_db_instance.postgres.username}:${aws_db_instance.postgres.password}@${aws_db_instance.postgres.address}:${aws_db_instance.postgres.port}/${aws_db_instance.postgres.db_name}?sslmode=disable"
  sensitive   = true
}

output "redis_addr" {
  description = "REDIS_ADDR shape used by oops-api-v1's .env.development"

  value = "${coalesce(
    aws_elasticache_replication_group.redis.primary_endpoint_address,
    aws_elasticache_replication_group.redis.configuration_endpoint_address,
  )}:${aws_elasticache_replication_group.redis.port}"
}

output "s3_bucket" {
  value = aws_s3_bucket.attachments.bucket
}

output "s3_endpoint" {
  value = "http://localhost:4566"
}
