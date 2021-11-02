#Security Group
resource "aws_security_group" "minajeong_websg" {
  name        = "Allow-WEB"
  description = "http-ssh-icmp"
  vpc_id      = aws_vpc.minajeong_vpc.id

  ingress = [
    {
      description      = var.prot_ssh
      from_port        = var.ssh_port
      to_port          = var.ssh_port
      protocol         = var.prot_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.prot_http
      from_port        = var.http_port
      to_port          = var.http_port
      protocol         = var.prot_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.prot_icmp
      from_port        = var.icmp_port
      to_port          = var.icmp_port
      protocol         = var.prot_icmp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.prot_mysql
      from_port        = var.mysql_port
      to_port          = var.mysql_port
      protocol         = var.prot_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      security_groups  = null
      prefix_list_ids  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = var.prot_all
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    "Name" = "${var.name}-websg"
  }
}

#Web_instance
data "aws_ami" "amzn" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-hvm*-x86_64-ebs"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["amazon"]
}

resource "aws_instance" "minajeong_weba" {
  ami                    = var.ami
  instance_type          = var.instance_type
  key_name               = var.key
  vpc_security_group_ids = [aws_security_group.minajeong_websg.id]
  availability_zone      = "${var.region}${var.avazone[0]}"
  private_ip             = var.private_ip
  subnet_id              = aws_subnet.minajeong_pub[0].id
  user_data              = file("./install_seoul.sh")

  tags = {
    Name = "${var.name}-weba"
  }
}

resource "aws_eip" "minajeong_web_eip" {
  vpc                       = true
  instance                  = aws_instance.minajeong_weba.id
  associate_with_private_ip = var.private_ip
  depends_on                = [aws_internet_gateway.minajeong_ig]
}