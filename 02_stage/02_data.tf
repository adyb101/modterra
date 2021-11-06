# 변수 입력
module "stage" {
  source = "../01_module"

  name            = "majeong"
  region          = "ap-northeast-3"
  cidr            = "0.0.0.0./0"
  cidr_main       = "10.2.0.0/16"
  cidr_v6         = "::/0"
  avazone         = ["a", "c"]
  key             = "majeong-key"
  public_s        = ["10.2.0.0/24", "10.2.2.0/24"]
  private_s       = ["10.2.1.0/24", "10.2.3.0/24"]
  private_dbs     = ["10.2.4.0/24", "10.2.5.0/24"]
  private_ip      = "10.2.0.11"
  instance_type   = "t3.nano"
  protocol_ssh    = "ssh"
  port_ssh        = "22"
  protocol_tcp    = "tcp"
  protocol_http   = "http"
  port_http       = "80"
  protocol_icmp   = "icmp"
  port_minus      = "-1"
  protocol_mysql  = "mysql"
  port_mysql      = "3306"
  ami             = "ami-0791d2e614355a9eb"
  lb_type         = "application"
  db_storage_size = "20"
  db_storage_type = "gp2"
  db_engine       = "mysql"
  db_vs           = "8.0"
  db_name         = "mydb"
  db_id           = "mydb"
  db_user         = "admin"
  db_pw           = "It12345!"
  db_snapshot     = "true"
}
