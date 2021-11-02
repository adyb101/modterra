# main
provider "aws" {
  region = var.region
}

# ssh_key
resource "aws_key_pair" "minajeong_key" {
  key_name = var.key
  public_key = file("../../../.ssh/id_rsa.pub")
}

# vpc
resource "aws_vpc" "minajeong_vpc" {
  cidr_block = var.cidr_main
  enable_dns_support = true
  enable_dns_hostnames = true
  
  tags = {
    "Name" = "${var.name}-vpc"
  }
}


resource "aws_subnet" "minajeong_pub" {
  vpc_id            = aws_vpc.minajeong_vpc.id
  count             = "${length(var.public_s)}" #2
  cidr_block        = "${var.public_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pub-${var.avazone[count.index]}"
  }
}

#가용영역 a의 Private Subnet
resource "aws_subnet" "minajeong_pri" {
  vpc_id            = aws_vpc.minajeong_vpc.id
  count             = "${length(var.private_s)}" #2
  cidr_block        = "${var.private_s[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pri-${var.avazone[count.index]}"
  }
}

resource "aws_subnet" "minajeong_pridb" {
  vpc_id            = aws_vpc.minajeong_vpc.id
  count             = "${length(var.private_dbs)}" #2
  cidr_block        = "${var.private_dbs[count.index]}"
  availability_zone = "${var.region}${var.avazone[count.index]}"

  tags = {
    Name = "pridb-${var.avazone[count.index]}"
  }
}


resource "aws_internet_gateway" "minajeong_ig" {
  vpc_id = aws_vpc.minajeong_vpc.id

  tags = {
    "Name" = "${var.name}-ig"
  }
}


resource "aws_route_table" "minajeong_rt" {
  vpc_id = aws_vpc.minajeong_vpc.id

  route {
  #  carrier_gateway_id = "value"
    cidr_block = var.cidr
  #  destination_prefix_list_id = "value"
  #  egress_only_gateway_id = "value"
    gateway_id = aws_internet_gateway.minajeong_ig.id
  #  instance_id = "value"
  #  ipv6_cidr_block = "value"
  #  local_gateway_id = "value"
  #  nat_gateway_id = "value"
  #  network_interface_id = "value"
  #  transit_gateway_id = "value"
  #  vpc_endpoint_id = "value"
  #  vpc_peering_connection_id = "value"
  } 
  tags = {
    Name = "${var.name}-rt"
  }
}


resource "aws_route_table_association" "minajeong_rtas_a" {
  count = "${length(var.public_s)}"
  subnet_id = aws_subnet.minajeong_pub[count.index].id
  route_table_id = aws_route_table.minajeong_rt.id
}
