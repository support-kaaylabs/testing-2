resource "aws_lb_target_group" "zupain" {
  name     = "${var.targetgrp_name}"
  port     = 80
  protocol = "HTTP"
  vpc_id   = "${var.trg_vpc_id}"
  deregistration_delay = "${var.deregistration_delay}"

  health_check {
        path = "${var.healthcheck}"
        protocol = "HTTP"
        interval = "30"
        timeout = "10"
        healthy_threshold = "3"
        unhealthy_threshold = "2"
   }
}

output "aws_lb_target_group" {
   value = "${aws_lb_target_group.zupain.arn}"
}