# 변수 입력
module "production" {
  source           = "../01_module"

  name             = "majeong"
  region           = "ap-northeast-2"
  cidr             = "0.0.0.0/0"
  cidr_main        = "10.0.0.0/16"
  cidr_v6          = "::/0"
  avazone          = ["a", "c"]
  key              = "majeong-key"
  public_s         = ["10.0.0.0/24", "10.0.2.0/24"]
  private_s        = ["10.0.1.0/24", "10.0.3.0/24"]
  private_dbs      = ["10.0.4.0/24", "10.0.5.0/24"]
  private_ip       = "10.0.0.11"
  instance_type    = "t2.micro"
  protocol_ssh     = "ssh"
  port_ssh         = "22"
  protocol_tcp     = "tcp"
  prot_http        = "http"
  protocol_http    = "80"
  protocol_icmp    = "icmp"
  port_minus       = "-1"
  protocol_mysql   = "mysql"
  port_mysal       = "3306"
  ami              = "ami-0e4a9ad2eb120e054"
  lb_type          = "application"
  db_storage_size  = "20"
  db_storage_type  = "gp2"
  db_engine        = "mysql"
  db_version       = "8.0"
  db_instance_type = "db.t2.micro"
  db_name          = "mydb"
  db_id            = "mydb"
  db_username      = "admin"
  db_pw            = "It12345!"
  db_snapshot      = "true"
  strategy         = "cluster"
}