# AMI
resource "aws_ami_from_instance" "minajeong_ami" {
  name               = "${var.name}-ami"
  source_instance_id = aws_instance.minajeong_weba.id
  depends_on = [
    aws_instance.minajeong_weba
  ]
}


# Launch_configuration
resource "aws_launch_configuration" "minajeong_lacf" {
  name          = "${var.name}-web"
  image_id      = aws_ami_from_instance.minajeong_ami.id
  instance_type = "${var.instance_type}"
  iam_instance_profile = "admin_role2"
  security_groups = [aws_security_group.minajeong_websg.id]
  key_name = "${var.key}"
  user_data = <<-EOF
                #!/bin/bash
                systemctl start httpd
                systemctl enable httpd
                EOF
    lifecycle {
      create_before_destroy  = true 
    }
}


# Placement_group
resource "aws_placement_group" "minajeong_pg" {
  name      = "${var.name}-pg"
  strategy  = "cluster"
}

resource "aws_autoscaling_group" "minajeong_atsg" {
  name                           = "${var.name}-atsg"
  min_size                       = 2
  max_size                       = 8
  health_check_grace_period      = 300
  health_check_type              = "${var.hctype}"
  desired_capacity               = 2
  force_delete                   = true
  launch_configuration           = aws_launch_configuration.minajeong_lacf.name
  vpc_zone_identifier            = [aws_subnet.minajeong_pub[0].id,aws_subnet.minajeong_pub[1].id]

}


# Autoscaling_attachment
resource "aws_autoscaling_attachment" "minajeong_atatt" {
  autoscaling_group_name = aws_autoscaling_group.minajeong_atsg.id
  alb_target_group_arn = aws_lb_target_group.minajeong_lbtg.arn
}