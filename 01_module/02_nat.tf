# Nat gateway
resource "aws_eip" "lb_ip" {
  #instance = aws_instance.web.id
  vpc   = true
}

resource "aws_nat_gateway" "minajeong_nga" {
  allocation_id = aws_eip.lb_ip.id
  subnet_id     = aws_subnet.minajeong_pub[0].id

  tags = {
    "Name" = "${var.name}-ng"
  }
}

# Nat gateway_route table
resource "aws_route_table" "minajeong_ngart" {
  vpc_id = aws_vpc.minajeong_vpc.id

  route {
    cidr_block = var.cidr
    gateway_id = aws_nat_gateway.minajeong_nga.id
  }

  tags = {
    "Name" = "${var.name}-ng-rt"
  }
}

# Nat gateway_route table association
resource "aws_route_table_association" "minajeong_ngartas" {
  count          = "${length(var.private_s)}"
  subnet_id      = aws_subnet.minajeong_pri[count.index].id
  route_table_id = aws_route_table.minajeong_ngart.id
}
