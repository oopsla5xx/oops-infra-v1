resource "aws_elasticache_replication_group" "redis" {
  replication_group_id       = local.redis_replication_group_id
  description                = "oops local dev cache/queue/pub-sub"
  engine                     = "redis"
  node_type                  = "cache.t3.micro"
  parameter_group_name       = "default.redis7.cluster.on"
  num_node_groups            = 1
  replicas_per_node_group    = 0
  automatic_failover_enabled = false
  port                       = 6379
}
