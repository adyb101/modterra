# DB_rds
resource "aws_db_instance" "minajeong_mydb" {
  allocated_storage      = var.db_storage_size
  storage_type           = var.db_storage_type
  engine                 = var.db_engine
  engine_version         = var.db_version
  instance_class         = var.db_instance_type
  name                   = var.db_name
  identifier             = var.db_id
  username               = var.db_username
  password               = var.db_pw
  parameter_group_name   = "default.mysql8.0"
  availability_zone      = "${var.region}${var.avazone[0]}"
  db_subnet_group_name   = aws_db_subnet_group.minajeong_dbsn.id
  vpc_security_group_ids = [aws_security_group.minajeong_websg.id]
  skip_final_snapshot    = var.db_snapshot

  tags = {
    "Name" = "${var.name}-${var.db_name}"
  }
}
#DB_subnet group
resource "aws_db_subnet_group" "minajeong_dbsn" {
  name       = "${var.name}-dbsb-group"
  subnet_ids = [aws_subnet.minajeong_pridb[0].id, aws_subnet.minajeong_pridb[1].id]

  tags = {
    "Name" = "${var.name}-dbsb-group"
  }
}
data "aws_db_instance" "mydb" {
  db_instance_identifier = "mydb"
  depends_on = [
    aws_db_instance.minajeong_mydb
  ]
}
