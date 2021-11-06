# 변수 선언
variable "name" {
  type = string
#  default = "majeong"
}

variable "avazone" {
  type = list
#  default = ["a", "c"]
}

variable "region" {
  type = string
#  default = "ap-northeast-2"
}

variable "key" {
  type = string
#  default = "majeong-key"
}

variable "cidr" {
  type = string
#  default = "0.0.0.0/0"
}

variable "cidr_v6" {
  type = string
#  default = "::/0"
}

variable "cidr_main" {
  type = string
#  default = "10.0.0.0/16"
}

variable "public_s" {
  type = list
#  default = ["10.0.0.0/24", "10.0.2.0/24"]
}

variable "private_s" {
  type = list
#  default = ["10.0.1.0/24", "10.0.3.0/24"]
}

variable "private_dbs" {
  type = list
#  default = ["10.0.4.0/24", "10.0.5.0/24"]
}

variable "private_ip" {
  type = string
#  default = "10.0.0.11"
}

variable "port_ssh" {
  type = number
#  default = 22
}

variable "port_http" {
  type = number
#  default = 80
}

variable "port_minus" {
  type = number
#  default = -1
}

variable "port_mysql" {
  type = number
#  default = 3306
}

variable "protocol_ssh" {
  type = string
#  default = "ssh"
}

variable "protocol_tcp" {
  type = string
#  default = "tcp"
}

variable "protocol_udp" {
  type = string
#  default = "udp"
}

variable "protocol_http" {
  type = string
#  default = "http"
}

variable "protocol_http1" {
  type = string
  default = "HTTP"
}

variable "protocol_icmp" {
  type = string
#  default = "icmp"
}

variable "protocol_minus"{
  type = number
#  default = -1
}

variable "ami" {
  type = string
#  default = "ami-0e4a9ad2eb120e054"
}

variable "instance_type" {
  type = string
#  default = "t2.micro"
}

variable "lb_type" {
  type = string
#  default = "application"
}

variable "db_storage_size" {
  type = number
  default = 20
}

variable "db_storage_type" {
  type = string
#  default = "gp2"
}

variable "db_engine" {
  type = string
#  default = "mysql"
}

variable "db_version" {
  type = string
#  default = "8.0"
}

variable "db_instance_type" {
  type = string
  default = "db.t2.micro"
}

variable "db_name" {
  type = string
#  default = "mydb"
}

variable "db_id" {
  type = string
#  default = "mydb"
}

variable "db_username" {
  type = string
#  default = "admin"
}

variable "db_pw" {
  type = string
#  default = "It12345!"
}

variable "db_snapshot" {
  type = string
#  default = "true"
}

variable "strategy" {
  type = string
#  default = "cluster"
}

variable "endpoint" {
  type = string
  default = "data.aws_db_instance.mydb.endpoint"
}