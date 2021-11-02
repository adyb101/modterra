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


variable "ssh_port" {
  type = number
#  default = 22
}


variable "http_port" {
  type = number
#  default = 80
}

variable "icmp_port" {
  type = number
#  default = -1
}

variable "mysql_port" {
  type = number
#  default = 3306
}

variable "prot_ssh" {
  type = string
#  default = "ssh"
}

variable "prot_tcp" {
  type = string
#  default = "tcp"
}

variable "prot_http" {
  type = string
#  default = "http"
}

variable "prot_icmp" {
  type = string
#  default = "icmp"
}

variable "prot_mysql"{
  type = string
#  default = "mysql"
}

variable "prot_all" {
  type =  string
#  default = "All"
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

variable "hctype" {
  type = string
#  default = "ELB"
}

variable "db_st_type" {
  type = string
#  default = "gp2"
}

variable "db_engine" {
  type = string
#  default = "mysql"
}

variable "db_vs" {
  type = string
#  default = "8.0"
}

variable "db_name" {
  type = string
#  default = "mydb"
}

variable "db_id" {
  type = string
#  default = "mydb"
}

variable "db_user" {
  type = string
#  default = "admin"
}

variable "db_pw" {
  type = string
#  default = "It12345!"
}

variable "db_pgn" {
  type = string
#  default = "default.mysql8.0"
}

variable "db_snapshot" {
  type = string
#  default = "true"
}