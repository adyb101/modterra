# Security Group
resource "aws_security_group" "minajeong_websg" {
  name        = "Allow-WEB"
  description = "http-ssh-icmp-mysql"
  vpc_id      = aws_vpc.minajeong_vpc.id

  ingress = [
    {
      description      = var.protocol_ssh
      from_port        = var.port_ssh
      to_port          = var.port_ssh
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.protocol_http
      from_port        = var.port_http
      to_port          = var.port_http
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.protocol_icmp
      from_port        = var.port_minus
      to_port          = var.port_minus
      protocol         = var.protocol_icmp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    },
    {
      description      = var.protocol_mysql
      from_port        = var.port_mysql
      to_port          = var.port_mysql
      protocol         = var.protocol_tcp
      cidr_blocks      = [var.cidr]
      ipv6_cidr_blocks = [var.cidr_v6]
      security_groups  = null
      prefix_list_ids  = null
      self             = null
    }
  ]

  egress = [
    {
      description      = "All"
      from_port        = 0
      to_port          = 0
      protocol         = var.protocol_minus
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

# Web_instance
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
  # private_ip             = var.private_ip
  subnet_id              = aws_subnet.minajeong_pub[0].id
  user_data              = file("../01_module/install_seoul.sh")

  tags = {
    Name = "${var.name}-weba"
  }
}

# Elastic IP
resource "aws_eip" "minajeong_web_eip" {
  vpc          = true
  instance     = aws_instance.minajeong_weba.id
  # associate_with_private_ip = var.private_ip
  depends_on   = [aws_internet_gateway.minajeong_ig]
}
