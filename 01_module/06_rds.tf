resource "aws_db_instance" "minajeong_mydb" {
  allocated_storage        = 20
  storage_type             = "${var.db_st_type}"
  engine                   = "${var.db_engine}"
  engine_version           = "${var.db_vs}"
  instance_class           = "db.${var.instance_type}"
  name                     = "${var.db_name}"
  identifier               = "${var.db_id}"
  username                 = "${var.db_user}"
  password                 = "${var.db_pw}"
  parameter_group_name     = "${var.db_pgn}"
  availability_zone        = "${var.region}${var.avazone[0]}"
  db_subnet_group_name     = aws_db_subnet_group.minajeong_dbsn.id
  vpc_security_group_ids   = [aws_security_group.minajeong_websg.id]
  skip_final_snapshot      = var.db_snapshot
  
  tags  =   {
      "Name"    =   "${var.name}-mydb"
    }
  }

  resource "aws_db_subnet_group" "minajeong_dbsn" {
      name = "${var.name}-dbsb-group"
      subnet_ids = [aws_subnet.minajeong_pridb[0].id,aws_subnet.minajeong_pridb[1].id]

      tags = {
        "Name" = "${var.name}-dbsb-group"
      }
  }