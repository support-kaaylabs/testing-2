#Create ALB Listeners 80

resource "aws_lb_listener" "zupain" {
  load_balancer_arn = "${var.lis_alb_name}"
  port              = "${var.alb_port}"
  protocol          = "${var.alb_protocol}"
  default_action {
    type                 = "forward"
    target_group_arn     = "${var.attach_target_group}"
  }
}

output "alb_listener" {
   value = "${aws_lb_listener.zupain.id}"
  }


