# Application LoadBalancer Deploy
resource "aws_lb" "minajeong_lb" {
  name               = "${var.name}-alb"
  internal           = false
  load_balancer_type = var.lb_type
  security_groups    = [aws_security_group.minajeong_websg.id]
  subnets            = [aws_subnet.minajeong_pub[0].id, aws_subnet.minajeong_pub[1].id]

  tags = {
    "Name" = "${var.name}-alb"
  }
}

# Load balancer target group
resource "aws_lb_target_group" "minajeong_lbtg" {
  name     = "${var.name}-1btg"
  port     = var.port_http
  protocol = var.protocol_http1
  vpc_id   = aws_vpc.minajeong_vpc.id

  health_check {
    enabled             = true
    healthy_threshold   = 3
    interval            = 5
    matcher             = "200"
    path                = "/health.html"
    port                = "traffic-port"
    protocol            = var.protocol_http1
    timeout             = 2
    unhealthy_threshold = 2
  }
}

# Load balancer listener
resource "aws_lb_listener" "minajeong_lblist" {
  load_balancer_arn = aws_lb.minajeong_lb.arn
  port              = var.port_http
  protocol          = var.protocol_http1

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.minajeong_lbtg.arn
  }
}


# Load balancer target group attachement
resource "aws_lb_target_group_attachment" "minajeong_lbtg_att" {
  target_group_arn = aws_lb_target_group.minajeong_lbtg.arn
  target_id        = aws_instance.minajeong_weba.id
  port             = var.port_http
}
