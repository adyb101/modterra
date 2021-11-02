module "production" {
  source           = "../01_module"

  region           = "ap-northeast-2"
  cidr             = "0.0.0.0/0"
  cidr_main        = "10.0.0.0/16"
  name             = "majeong"
  avazone          = ["a", "c"]
  key              = "majeong-key"
  public_s         = ["10.0.0.0/24", "10.0.2.0/24"]
  private_s        = ["10.0.1.0/24", "10.0.3.0/24"]
  private_dbs      = ["10.0.4.0/24", "10.0.5.0/24"]
  private_ip       = "10.0.0.11"
  prot_ssh         = "ssh"
  ssh_port         = "22"
  prot_tcp         = "tcp"
  cidr_v6          = "::/0"
  prot_http        = "http"
  http_port        = "80"
  prot_icmp        = "icmp"
  icmp_port        = "-1"
  prot_mysql       = "mysql"
  mysql_port       = "3306"
  prot_all         = "All" 
  ami              = "ami-0e4a9ad2eb120e054"
  instance_type    = "t2.micro"
  lb_type          = "application"
  hctype           = "ELB"
  db_st_type       = "gp2"   
  db_engine        = "mysql"
  db_vs            = "8.0"
  db_name          = "mydb"
  db_id            = "mydb"
  db_user          = "admin"
  db_pw            = "It12345!"
  db_pgn           = "default.mysql8.0"
  db_snapshot      = "true"
}