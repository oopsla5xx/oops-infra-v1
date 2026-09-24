variable "db_name" {
  description = "Database name for the local Postgres instance"
  type        = string
  default     = "oops_development"
}

variable "db_username" {
  description = "Superuser username for the local Postgres instance"
  type        = string
  default     = "oops"
}

variable "db_password" {
  description = "Superuser password for the local Postgres instance"
  type        = string
  default     = "oops"
  sensitive   = true
}
