#Create Application Load balancer

resource "aws_lb" "zupain" {
  name               = "${var.alb_name}"
  internal           = "${var.alb_internal}"
  load_balancer_type = "${var.alb_type}"
  ip_address_type    = "ipv4"
  security_groups    = ["${var.alb_security_groups}"]
  subnets            = "${var.alb_subnets[*]}"
}

output "alb_name" {
  value = "${aws_lb.zupain.id}"
}
