# Nat gateway
resource "aws_eip" "lb_ip" {
  #instance = aws_instance.web.id
  count = 2
  vpc = true
}

resource "aws_nat_gateway" "minajeong_nga" {
  count = "${length(var.public_s)}"
  allocation_id = aws_eip.lb_ip[count.index].id
  subnet_id     = aws_subnet.minajeong_pub[count.index].id

  tags = {
    "Name" = "${var.name}-nga-${var.avazone[count.index]}"
   }
  }

  # Nat gateway_route table
  resource "aws_route_table" "minajeong_ngart" {
    vpc_id = aws_vpc.minajeong_vpc.id
    count = "${length(var.avazone)}"

    route {
        cidr_block  = var.cidr
        gateway_id  = aws_nat_gateway.minajeong_nga[count.index].id
    }

    tags = {
      "Name" = "${var.name}-nga-rt${var.avazone[count.index]}"
    }
}


# Nat gateway_route table association
resource "aws_route_table_association" "minajeong_ngartas" {
    count            = "${length(var.private_s)}"
    subnet_id        = aws_subnet.minajeong_pri[count.index].id
    route_table_id   = aws_route_table.minajeong_ngart[count.index].id    
}
