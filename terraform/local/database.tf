resource "aws_db_instance" "postgres" {
  identifier          = local.db_identifier
  engine              = "postgres"
  engine_version      = "16"
  instance_class      = "db.t3.micro"
  allocated_storage   = 20
  db_name             = var.db_name
  username            = var.db_username
  password            = var.db_password
  skip_final_snapshot = true
  publicly_accessible = true

  lifecycle {
    ignore_changes = [publicly_accessible]
  }
}
